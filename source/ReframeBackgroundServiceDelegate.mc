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

    function onTemporalEvent() {
        var enabled = Storage.getValue("enabled");
        if (enabled == null) { 
            enabled = Properties.getValue("enabled"); 
        }

        if (enabled) {
            var isSleep = isSleepTime();
            var isDnD = isDnDMode();
            var bypass = byPassDnD();

            // REGLA: 
            // 1. Nunca enviamos si es hora de dormir (isSleep).
            // 2. Si no es hora de dormir, enviamos si:
            //    - No hay No Molestar (DnD)
            //    - O hay No Molestar pero el usuario activó el Bypass.
            
            if (!isSleep) {
                if (!isDnD || bypass) {
                    Background.requestApplicationWake("¿Quieres renovar tu mente?");
                }
            }
        }

        // 2. RE-PROGRAMACIÓN
        // Garmin no permite menos de 5 minutos en Background
        var minutes = Storage.getValue("frequency"); 
        if (minutes == null) {
            minutes = Properties.getValue("frequency");
        }
        
        // Calculamos el momento en que se volverá a despertar el servicio
        var proximoMomento = Time.now().add(new Time.Duration(minutes * 60));
        
        // Registramos el siguiente evento
        Background.registerForTemporalEvent(proximoMomento);

        // Guardamos el timestamp para el Glance
        Storage.setValue("proximo_timestamp", proximoMomento.value());

        Background.exit(true);
    }
}