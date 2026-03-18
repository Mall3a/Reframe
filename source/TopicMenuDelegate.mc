import Toybox.WatchUi;
import Toybox.Application.Storage;

class TopicMenuDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        var temaId = item.getId().toString();
        // Guardamos el tema elegido
        Storage.setValue("selected_tema", temaId);
        // Reiniciamos el índice a 0 para que empiece la nueva lista desde el principio
        Storage.setValue("last_msg_index", 0);
        
        System.println("Tema cambiado a: " + temaId);
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}