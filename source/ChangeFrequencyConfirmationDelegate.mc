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
            return false;
        } else {
            Storage.setValue("frequency", _minutes);
            
            // RE-PROGRAMAR EVENTO CON NUEVA FRECUENCIA ---
            var proximoMomento = Time.now().add(new Time.Duration(_minutes * 60));
            try {
                Background.registerForTemporalEvent(proximoMomento);
                Storage.setValue("proximo_timestamp", proximoMomento.value());
            } catch(ex) {}

            WatchUi.showToast("Frecuencia: " + _minutes + " min", null);
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            return true;
        }
    }
}
