 using Toybox.WatchUi;
using Toybox.System;
import Toybox.Application.Storage;
import Toybox.Application.Properties;

class ChangeFrequencyConfirmationDelegate extends WatchUi.ConfirmationDelegate {
        private var _minutes;
  
    function initialize(minutes) {
        ConfirmationDelegate.initialize();
        _minutes = minutes;
    }

    function onResponse(response) {
        if (response == WatchUi.CONFIRM_NO) {
            System.println("Cancel");
            return false;
        } else {
            System.println("Confirm");
            // Guardamos en Storage
            Storage.setValue("frequency", _minutes);
            System.println("Frecuencia establecida por usuario: " + _minutes);
            WatchUi.showToast("Frecuencia establecida en "+_minutes+" minutos", null);
            // Volvemos atrás de forma segura
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            return true;
        }
    }
}
