import Toybox.WatchUi;
import Toybox.System;
import Toybox.Application.Storage;
import Toybox.Application.Properties;
using Toybox.System;

class SettingsMenuInputDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(menuItem) {
        var id = menuItem.getId();
        var idStr = id.toString();
        System.println("Opción Seleccionada: " + idStr);

        if(idStr.equals("freq")){
            // redirect to freq menu
            WatchUi.pushView(new FrequencyMenu(), new FrequencyMenuInputDelegate(), WatchUi.SLIDE_UP);
        }
        else if (idStr.equals("enable_msgs")) {
            var toggleItem = menuItem as WatchUi.ToggleMenuItem;
            var val = toggleItem.isEnabled();
            Storage.setValue("enabled", val);
            System.println("Notificaciones habilitadas: " + val);
        } 
        else if (idStr.equals("dnd_mode")) {
            var toggleItem = menuItem as WatchUi.ToggleMenuItem;
            var val = toggleItem.isEnabled();
            Storage.setValue("allowDND", val);
            System.println("Notificaciones habilitadas en DnD: " + val);
        } 
        else if (idStr.equals("sleep_time")) {
            System.println("Configurando horario de Inicio de sueño");
            WatchUi.pushView(
                new $.SleepPicker("Inicio Sueño"), 
                new $.SleepPickerDelegate("sleepStart"), 
                WatchUi.SLIDE_UP
            );
        }
        else if (idStr.equals("delete_msgs")) {
            var message = "¿Borrar todos los mensajes?";
            var dialog = new WatchUi.Confirmation(message);
            WatchUi.pushView(
                dialog,
                new DeleteMessagesConfirmationDelegate(),
                WatchUi.SLIDE_IMMEDIATE
            );
        }
        else if(idStr.equals("restore_settings")){
            var message = "¿Reestablecer la configuración?";
            var dialog = new WatchUi.Confirmation(message);
            WatchUi.pushView(
                dialog,
                new RestoreConfigConfirmationDelegate(),
                WatchUi.SLIDE_IMMEDIATE
            );
        }else if(idStr.equals("view_storage")) {
            // Creamos el menú de resumen al vuelo
            var summaryMenu = new WatchUi.Menu2({:title=>"Configuración Actual"});
            
            // Obtenemos los valores igual que en tu initialize
            // Garmin no permite menos de 5 minutos en Background
            var freq = Storage.getValue("frequency"); 
            if (freq == null) {
                freq = Properties.getValue("frequency"); 
            }
            var enabled = Storage.getValue("enabled");
            if (enabled == null) {
                enabled = Properties.getValue("enabled");
            }
            var dnd = Storage.getValue("allowDND");
            if (dnd == null) {
                dnd = Properties.getValue("allowDND");
            }
            var sStart = Storage.getValue("sleepStart");
            if (sStart == null) {
                sStart = Properties.getValue("sleepStart");
            }
            var sEnd = Storage.getValue("sleepEnd");
            if (sEnd == null) {
                sEnd = Properties.getValue("sleepEnd");
            }

            // Los añadimos como texto simple
            summaryMenu.addItem(new WatchUi.MenuItem("Frecuencia", freq != null ? freq.toString() : "N/A", null, {}));
            summaryMenu.addItem(new WatchUi.MenuItem("Habilitado", enabled == true ? "Sí" : "No", null, {}));
            summaryMenu.addItem(new WatchUi.MenuItem("Habilitado No Molestar", dnd == true ? "Sí" : "No", null, {}));
            summaryMenu.addItem(new WatchUi.MenuItem("Horas de Sueño", sStart + " a " + sEnd, null, {}));

            // Lo mostramos. Usamos un Delegate vacío porque es solo para ver.
            WatchUi.pushView(summaryMenu, new WatchUi.Menu2InputDelegate(), WatchUi.SLIDE_LEFT);
        }
    }

    // Por si el usuario usa el botón físico "atrás"
    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_DOWN); // Cierra el menú actual
    }

    function onSettingsChanged() {
        // Esto refresca la pantalla si el usuario cambia algo en el móvil con la app abierta
        WatchUi.requestUpdate(); 
    }
}