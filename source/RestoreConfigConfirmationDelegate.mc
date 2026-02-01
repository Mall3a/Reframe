 using Toybox.WatchUi;
using Toybox.System;
import Toybox.Application.Storage;
import Toybox.Application.Properties;

class RestoreConfigConfirmationDelegate extends WatchUi.ConfirmationDelegate {
    function initialize() {
        ConfirmationDelegate.initialize();
    }

    function onResponse(response) {
        if (response == WatchUi.CONFIRM_NO) {
            return false;
        } else {
            Storage.clearValues();
            
            // Valores reestablecidos
            Storage.setValue("allowDND", Properties.getValue("allowDND"));
            Storage.setValue("sleepStart", Properties.getValue("sleepStart"));
            Storage.setValue("sleepEnd", Properties.getValue("sleepEnd"));
            Storage.setValue("enabled", Properties.getValue("enabled"));
            Storage.setValue("frequency", Properties.getValue("frequency"));
            Storage.setValue("last_msg_index", 0);

            var freq = Properties.getValue("frequency");
            var proximoMomento = Time.now().add(new Time.Duration(freq * 60));
            Storage.setValue("proximo_timestamp", proximoMomento.value());

            // REGENERAR EL BUZÓN PARA EL GLANCE ---
            var data = Settings.getNextSequentialMessage();
            if (data != null) {
                Storage.setValue("proxima_frase", data[:msg][:text]);
                Storage.setValue("cat_for_bg", data[:msg][:category]);
                Storage.setValue("last_sent_index", data[:index]);
                Storage.setValue("last_sent_total", data[:total]);
            }

            WatchUi.showToast("Configuración Reestablecida", null);
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            return true;
        }
    }
}
