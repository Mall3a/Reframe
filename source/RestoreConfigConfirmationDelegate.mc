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
            // allowDND, last_msg_index, frequency, enabled, sleepEnd, sleepStart
            System.println("Configuración Reestablecida");
            WatchUi.showToast("Configuración Reestablecida", null);
            WatchUi.popView(WatchUi.SLIDE_DOWN); // Cerrar menú tras borrar
            return true;
        }
    }
}
