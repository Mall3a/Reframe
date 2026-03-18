import Toybox.WatchUi;
import Toybox.Application.Storage;

class TopicMenuDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        var topicId = item.getId().toString();
        Storage.setValue("selected_topic", topicId);
        
        // RESET TOTAL: Ponemos el contador en 0 y borramos lo anterior
        Storage.setValue("last_msg_index", 0); 
        Storage.deleteValue("proxima_frase"); // Al borrar esto, forzamos a la App a recargar
        Storage.deleteValue("cat_for_bg");
        
        System.println("Tema cambiado a: " + topicId + ". Índice reseteado a 0.");

        // Volver al menú principal
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE); 
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE); 
        WatchUi.pushView(new $.SettingsMenu(), new $.SettingsMenuInputDelegate(), WatchUi.SLIDE_IMMEDIATE);
    }
}