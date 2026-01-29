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
        
        // Guardamos en Storage
        Storage.setValue("frequency", minutes);
        System.println("Frecuencia establecida por usuario: " + minutes);

        // Volvemos atrás de forma segura
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }

    // Por si el usuario usa el botón físico "atrás"
    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}