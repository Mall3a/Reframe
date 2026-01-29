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
            // TODO: añadir confirmacion con valor para usuario 
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
            // TODO: agregar una confirmacion antes de hacer
            Settings.clearData();
            WatchUi.showToast("Mensajes Borrados", null);
            System.println("Mensajes Borrados");
            WatchUi.popView(WatchUi.SLIDE_DOWN); // Cerrar menú tras borrar
            WatchUi.popView(WatchUi.SLIDE_DOWN); // Cerrar menú tras borrar X2
        }
        else if(idStr.equals("restore_settings")){
            // TODO: agregar una confirmacion antes de hacer
            Storage.clearValues();
            // Valores: allowDND, last_msg_index, frequency, enabled, sleepEnd, sleepStart
            System.println("Configuración Reestablecida");
            WatchUi.showToast("Configuración Reestablecida", null);
            WatchUi.popView(WatchUi.SLIDE_DOWN); // Cerrar menú tras borrar
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