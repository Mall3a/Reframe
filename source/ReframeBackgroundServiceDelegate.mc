using Toybox.Application;
using Toybox.Background;
using Toybox.System;
using Toybox.Time;
using Toybox.Application.Storage;
using Toybox.Application.Properties;

(:background)
class ReframeBackgroundServiceDelegate extends System.ServiceDelegate {

    function initialize() {
        ServiceDelegate.initialize();
    }

    function byPassDnD(){
        var allowDND = Storage.getValue("allowDND");
        if (allowDND == null) {
            allowDND = Properties.getValue("allowDND");
        }
        return allowDND;
    }

    function isDnDMode(){
        var settings = System.getDeviceSettings();
        return (settings has :doNotDisturb && settings.doNotDisturb) ? true : false;
    }

    function isSleepTime(){
        var now = System.getClockTime();
        var sleepStart = Storage.getValue("sleepStart");
        if (sleepStart == null) { sleepStart = Properties.getValue("sleepStart"); }
        
        var sleepEnd = Storage.getValue("sleepEnd");
        if (sleepEnd == null) { sleepEnd = Properties.getValue("sleepEnd"); }

        if (sleepStart < sleepEnd) {
            return (now.hour >= sleepStart && now.hour < sleepEnd);
        } else {
            return (now.hour >= sleepStart || now.hour < sleepEnd);
        }
    }

    function inBatterySavingMode() {
        var settings = System.getDeviceSettings();
        return (settings has :batterySavingMode && settings.batterySavingMode) ? true : false;
    }

    function onTemporalEvent() {
        // 1. VERIFICACIÓN DE ESTADO GLOBAL
        var enabled = Storage.getValue("enabled");
        if (enabled == null) { 
            enabled = Properties.getValue("enabled"); 
        }

        if (enabled) {
            var isSleep = isSleepTime();
            var isDnD = isDnDMode();
            var bypassDnD = byPassDnD();
            
            // Lógica de Batería: Detectamos el estado físico y la preferencia del usuario
            var inBatterySaving = inBatterySavingMode();
            var allowInBatterySave = Storage.getValue("batterySave");
            if (allowInBatterySave == null) { 
                allowInBatterySave = Properties.getValue("batterySave"); 
            }

            // REGLAS DE DISPARO:
            // 1. El sueño es sagrado: Si isSleep es true, no se envía nada.
            // 2. Filtro de Batería: Si está en ahorro, solo pasa si allowInBatterySave es true.
            // 3. Filtro de No Molestar: Si hay DnD, solo pasa si hay bypass.
            
            if (!isSleep) {
                // Verificamos: ¿No hay ahorro? O ¿Hay ahorro pero tengo permiso?
                if (!inBatterySaving || allowInBatterySave) {
                    
                    // Verificamos: ¿No hay DnD? O ¿Hay DnD pero tengo bypass?
                    if (!isDnD || bypassDnD) {
                        Background.requestApplicationWake("¿Quieres renovar tu mente?");
                    }
                }
            }
        }

        // 2. RE-PROGRAMACIÓN (Sigue igual para mantener la secuencia)
        var minutes = Storage.getValue("frequency"); 
        if (minutes == null) {
            minutes = Properties.getValue("frequency");
        }
        
        // Calculamos el momento en que se volverá a despertar el servicio
        var proximoMomento = Time.now().add(new Time.Duration(minutes * 60));
        
        // Registramos el siguiente evento
        Background.registerForTemporalEvent(proximoMomento);

        // Guardamos el timestamp para el Glance/Vistazo
        Storage.setValue("proximo_timestamp", proximoMomento.value());

        // Salimos del proceso de fondo devolviendo el control al sistema
        Background.exit(true);
    }
}