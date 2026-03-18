import Toybox.WatchUi;
import Toybox.Application.Storage;

class TopicMenuDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        var temaId = item.getId().toString();
        
        // 1. Guardamos el estado
        Storage.setValue("selected_tema", temaId);
       
       // Limpieza recomendada
        Storage.setValue("last_msg_index", 0);
        Storage.deleteValue("proxima_frase");
        Storage.deleteValue("cat_for_bg");
        Storage.deleteValue("last_sent_index");
        Storage.deleteValue("last_sent_total");
        Storage.deleteValue("msg_for_bg"); // <--- Importante

        var data = Settings.getNextSequentialMessage();
        if (data != null) {
            Storage.setValue("proxima_frase", data[:msg][:text]);
            Storage.setValue("cat_for_bg", data[:msg][:category]);
            Storage.setValue("last_sent_index", data[:index]);
            Storage.setValue("last_sent_total", data[:total]);
        }
        
        System.println("Tema cambiado a: " + temaId);

        // 2. Limpiamos el stack de vistas (Cierra el submenú y el menú viejo)
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE); 
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE); 

        // 3. Reabrimos el Menú de Configuraciones fresco
        WatchUi.pushView(
            new $.SettingsMenu(), 
            new $.SettingsMenuInputDelegate(), 
            WatchUi.SLIDE_IMMEDIATE
        );
    }
}