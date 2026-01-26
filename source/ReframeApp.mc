using Toybox.Application;
using Toybox.Background;
using Toybox.System;
using Toybox.Time;
using Toybox.Application.Storage;
using Toybox.Attention;

(:background)
class ReframeApp extends Application.AppBase {
    // initialize the AppBase class
    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
      // frecuencia por defecto (settings)
        var propertiesFrequency = Settings.getFrequency(); // minutos
        // frecuencia guardada por el usuario en FrequencyMenuInputDelegate
        var storageFrequency = Storage.getValue("frequency"); 
        System.println("Frecuencia de Storage: "+ storageFrequency);
        var minutes;
        if (storageFrequency != null) {
            minutes = storageFrequency;
        } else {
            minutes = propertiesFrequency;
        }

        // Time.Duration usa SEGUNDOS
        var duration = new Time.Duration(minutes * 60);
        var eventTime = Time.now().add(duration);
        Background.registerForTemporalEvent(eventTime);
        // esto disparará onTemporalEvent() en X minutos
    }

    // Return the initial view of your application here
    function getInitialView() {
        var msgs = Settings.getMessages();
        // System.println("msgs en getInitialView: " + msgs);

        var lastIndex = Storage.getValue("last_msg_index");
        if (lastIndex == null || lastIndex >= msgs.size()) {
            lastIndex = 0;
        }

        var msg = msgs[lastIndex];

        vibrateForIndex(lastIndex, msgs.size());

        Storage.setValue(
            "last_msg_index",
            (lastIndex + 1) % msgs.size()
        );
        return [ new NotificationView(msg, lastIndex, msgs.size()), new NotificationViewDelegate() ];  
        // Mientras se hace lo de onStart, se muestra esta vista
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    /**
        If the application needs to save data to the object store it should be done in this function. 
        Once the function is complete, the application will terminate.
    */
    }

    // ServiceDelegate runs background tasks for this app
    function getServiceDelegate() {
        /**
        When a ServiceDelegate is retrieved, the following will occur:
            The method triggered within the ServiceDelegate will be run
            The background task will exit using Background.exit() or System.exit()
            The background task will be automatically terminated after 30 seconds if it is not exited by these methods
        */
        return [ new ReframeBackgroundServiceDelegate() ];
    }

    function vibrateForIndex(index, total) {
        if (!(Attention has :vibrate)) { return; }

        if (index == total - 1) {
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

    function showNotification(){
        var msgs = Settings.getMessages();
        System.println("msgs: " + msgs);

        var lastIndex = Storage.getValue("last_msg_index");
        if (lastIndex == null || lastIndex >= msgs.size()) {
            lastIndex = 0;
        }

        var msg = msgs[lastIndex];

        vibrateForIndex(lastIndex, msgs.size());

        WatchUi.switchToView(
            new NotificationView(msg, lastIndex, msgs.size()),
            new NotificationViewDelegate(),
            WatchUi.SLIDE_IMMEDIATE
        );

        WatchUi.requestUpdate();

        Storage.setValue(
            "last_msg_index",
            (lastIndex + 1) % msgs.size()
        );
    }
}

(:background)
class ReframeBackgroundServiceDelegate extends System.ServiceDelegate {
    function isQuietTime() {
        var settings = System.getDeviceSettings();
        if (settings has :doNotDisturb && settings.doNotDisturb) {
            return true;
            // TODO: que usuario pueda elegir si quiere ser molestado en este modo (switch boolean)
        }
        var clock = System.getClockTime();
        return (clock.hour >= 24 || clock.hour < 9);
        // TODO: que usuario pueda modificar horas en un menu después 
    }

    function initialize() {
        ServiceDelegate.initialize();
    }

    function onTemporalEvent() {
        if (isQuietTime()) { 
            return; 
        }else{
            Background.requestApplicationWake("¿Quieres renovar tu mente?");
        }
        Background.exit(null);
    }
}