using Toybox.Application;
using Toybox.Background;
using Toybox.System;
using Toybox.Time;
using Toybox.Application.Storage;
using Toybox.Application.Properties;
using Toybox.Attention;

(:background)
class ReframeApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
        var minutes = Storage.getValue("frequency"); 
        System.println("Frecuencia de usuario: "+ minutes);
        if (minutes == null) {
            System.println("Sin frecuencia de usuario, se usa frecuencia de Properties: " + Settings.getFrequency() );
            minutes = Settings.getFrequency();
        }

        var duration = new Time.Duration(minutes * 60);
        var eventTime = Time.now().add(duration);
        Background.registerForTemporalEvent(eventTime);
    }

    function getInitialView() {
        // Obtenemos el "paquete" completo de datos
        var data = Settings.getNextSequentialMessage();
        
        if (data == null) {
            // Fallback por si no hay mensajes
            return [ new ReframeView(), new ReframeViewDelegate() ];
        }

        var msgObj = data[:msg];
        var currentIndex = data[:index];
        var totalCount = data[:total];

        // Ejecutamos la vibración
        vibrateForIndex(currentIndex, totalCount);

        // Retornamos la vista pasando los datos ya procesados
        return [ 
            new NotificationView(msgObj, currentIndex, totalCount), 
            new NotificationViewDelegate() 
        ];
    }

    function onSettingsChanged() {
        // Esto refresca la pantalla si el usuario cambia algo en el móvil con la app abierta
        WatchUi.requestUpdate(); 
    }

    function onStop(state) {
    }

    function getServiceDelegate() {
        return [ new ReframeBackgroundServiceDelegate() ];
    }

    function vibrateForIndex(index, total) {
        if (!(Attention has :vibrate)) { return; }
        if (index == total - 1) { 
            // el último de la lista vibra distinto
            Attention.vibrate([
                new Attention.VibeProfile(100, 500),
                new Attention.VibeProfile(0, 200),
                new Attention.VibeProfile(100, 500),
                new Attention.VibeProfile(0, 200),
                new Attention.VibeProfile(100, 1000)
            ]);
        } else {
            Attention.vibrate([ new Attention.VibeProfile(70, 150) ]);
        }
    }
}

(:background)
class ReframeBackgroundServiceDelegate extends System.ServiceDelegate {

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
        if (sleepStart == null) {
            // Valores por defecto si el usuario no ha configurado nada
            sleepStart = Properties.getValue("sleepStart");
        }
        var sleepEnd = Storage.getValue("sleepEnd");
        if (sleepEnd == null) {
            // Valores por defecto si el usuario no ha configurado nada
            sleepEnd = Properties.getValue("sleepEnd");
        }

        if (sleepStart < sleepEnd) {
            // Caso simple: Sueño de 01:00 a 07:00
            return (now.hour >= sleepStart && now.hour < sleepEnd);
        } else {
            // Caso cruzando medianoche: Sueño de 22:00 a 07:00
            return (now.hour >= sleepStart || now.hour < sleepEnd);
        }
    }

    function initialize() {
        ServiceDelegate.initialize();
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
        Background.exit(null);
    }
}