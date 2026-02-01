import Toybox.WatchUi;
import Toybox.System;
import Toybox.Application.Storage;
import Toybox.Application.Properties;

class FrequencyMenuInputDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        // Obtenemos los minutos directamente del ID del item seleccionado
        var minutes = item.getId();
            var message = "¿Cambiar frecuencia a "+minutes+" minutos?";
            var dialog = new WatchUi.Confirmation(message);
            WatchUi.pushView(
                dialog,
                new ChangeFrequencyConfirmationDelegate(minutes),
                WatchUi.SLIDE_IMMEDIATE
            );
    }

}