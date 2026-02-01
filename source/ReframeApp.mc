using Toybox.Application;
using Toybox.Background;
using Toybox.System;
using Toybox.Time;
using Toybox.Application.Storage;
using Toybox.Application.Properties;
using Toybox.Attention;
using Toybox.WatchUi;

(:background)
class ReframeApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    (:glance)
    function getGlanceView() {
        return [ new ReframeGlanceView() ]; 
    }

    function onBackgroundData(data) {
        WatchUi.requestUpdate(); 
    }

    function onStart(state) {
        var minutes = Storage.getValue("frequency");
        if (minutes == null) { minutes = Properties.getValue("frequency"); }

        var proximoEvento = Time.now().add(new Time.Duration(minutes * 60));
        Background.registerForTemporalEvent(proximoEvento);
        Storage.setValue("proximo_timestamp", proximoEvento.value());

        // Si no hay frase inicial, ponemos una por defecto para no llamar a Settings
        if (Storage.getValue("proxima_frase") == null) {
            Storage.setValue("proxima_frase", "Toca para renovar tu mente");
        }
    }

    function getInitialView() {
        var text = Storage.getValue("proxima_frase");
        var cat = Storage.getValue("cat_for_bg");
        var idx = Storage.getValue("last_sent_index");
        var total = Storage.getValue("last_sent_total");

        // Si no hay datos (primera vez o tras reset), pedimos a Settings
        if (text == null || total == null || total == 0) {
            var data = Settings.getNextSequentialMessage();
            if (data != null) {
                var msgObj = data[:msg];
                text = msgObj[:text];
                cat = msgObj[:category];
                idx = data[:index];
                total = data[:total];

                // Llenamos el buzón inicial
                Storage.setValue("proxima_frase", text);
                Storage.setValue("cat_for_bg", cat);
                Storage.setValue("last_sent_index", idx);
                Storage.setValue("last_sent_total", total);
            }
        }

        var finalMsgObj = { :text => text, :category => cat };
        vibrateForIndex(idx, total);

        // Retornamos la vista y su delegate
        return [ 
            new NotificationView(finalMsgObj, idx, total), 
            new NotificationViewDelegate() 
        ];
    }

    function onSettingsChanged() {
        WatchUi.requestUpdate(); 
    }

    function onStop(state) {
        // Vacío para optimizar memoria en Venu 2S
    }

    function getServiceDelegate() {
        return [ new ReframeBackgroundServiceDelegate() ];
    }

    function vibrateForIndex(index, total) {
        if (!(Attention has :vibrate)) { return; }
        // Vibración más intensa si es el último de la lista
        if (index != null && total != null && total > 0 && index == total - 1) { 
            Attention.vibrate([
                new Attention.VibeProfile(100, 500),
                new Attention.VibeProfile(100, 1000)
            ]);
        } else {
            Attention.vibrate([ new Attention.VibeProfile(70, 150) ]);
        }
    }
}
