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
            System.println("Cancel");
            return false;
        } else {
            System.println("Confirm");
            Storage.clearValues();
            // Valores reestablecidos:
            
            Storage.setValue("allowDND",Properties.getValue("allowDND"));
            Storage.setValue("sleepStart",Properties.getValue("sleepStart"));
            Storage.setValue("sleepEnd",Properties.getValue("sleepEnd"));
            Storage.setValue("enabled",Properties.getValue("enabled"));
            Storage.setValue("frequency",Properties.getValue("frequency"));

            Storage.setValue("last_msg_index", 0);

            var proximoMomento = Time.now().add(new Time.Duration(Properties.getValue("frequency") * 60));
            Storage.setValue("proximo_timestamp", proximoMomento.value());
            var proximaFrase = Settings.peekNextMessage();
            Storage.setValue("proxima_frase", proximaFrase);


            System.println("Configuración Reestablecida");
            WatchUi.showToast("Configuración Reestablecida", null);
            WatchUi.popView(WatchUi.SLIDE_DOWN); // Cerrar menú tras borrar
            return true;
        }
    }
}
