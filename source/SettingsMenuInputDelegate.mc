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
            
            if (!val) {
                // Si el usuario desactiva, cancelamos el próximo evento
                Background.deleteTemporalEvent();
                Storage.deleteValue("proximo_timestamp");
                System.println("Evento de fondo cancelado.");
            } else {
                // Si activa, programamos uno nuevo de inmediato
                var freq = Storage.getValue("frequency");
                if (freq == null) { freq = 30; }
                var proximo = Time.now().add(new Time.Duration(freq * 60));
                Background.registerForTemporalEvent(proximo);
                Storage.setValue("proximo_timestamp", proximo.value());
            }
        }
        else if (idStr.equals("dnd_mode")) {
            var toggleItem = menuItem as WatchUi.ToggleMenuItem;
            var val = toggleItem.isEnabled();
            Storage.setValue("allowDND", val);
            System.println("Notificaciones habilitadas en DnD: " + val);
        } 
        else if (idStr.equals("battery_mode")) {
                var toggleItem = menuItem as WatchUi.ToggleMenuItem;
                var val = toggleItem.isEnabled();
                
                // Guardamos la decisión del usuario
                Storage.setValue("batterySave", val);
                System.println("Notificaciones habilitadas en ahorro de bateria: " + val);
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
            var message = "¿Borrar todos Mis Mensajes?";
            var dialog = new WatchUi.Confirmation(message);
            WatchUi.pushView(
                dialog,
                new DeleteMessagesConfirmationDelegate(),
                WatchUi.SLIDE_IMMEDIATE
            );
        }
        else if(idStr.equals("restore_settings")){
            var message = "¿Reestablecer configuración inicial?";
            var dialog = new WatchUi.Confirmation(message);
            WatchUi.pushView(
                dialog,
                new RestoreConfigConfirmationDelegate(),
                WatchUi.SLIDE_IMMEDIATE
            );
        } else if (idStr.equals("topic")) {
            var topicMenu = new WatchUi.Menu2({:title=>"Elegir Tema"});
            // La nueva opción para ver solo lo cargado desde el móvil
            topicMenu.addItem(new WatchUi.MenuItem("Mis Mensajes", null, "Personal", {}));
            // Los temas del sistema (hardcoded)
            topicMenu.addItem(new WatchUi.MenuItem("Identidad y Valor", null, "Identidad", {}));
            topicMenu.addItem(new WatchUi.MenuItem("Sanidad", null, "Sanidad", {}));
            topicMenu.addItem(new WatchUi.MenuItem("Trabajo",null, "Trabajo", {}));
            topicMenu.addItem(new WatchUi.MenuItem("Metanoia y Narrativa",null, "Metanoia", {}));
            topicMenu.addItem(new WatchUi.MenuItem("Paz y Descanso", null, "Paz", {}));
            topicMenu.addItem(new WatchUi.MenuItem("Relaciones, Límites y Perdón", null, "Relaciones", {}));

            WatchUi.pushView(topicMenu, new TopicMenuDelegate(), WatchUi.SLIDE_LEFT);
        } else if(idStr.equals("view_config")) {
            // Creamos el menú de resumen al vuelo
            var summaryMenu = new WatchUi.Menu2({:title=>"Configuración Actual"});
            
            // Obtenemos los valores igual que en tu initialize
            var selected_topic = Storage.getValue("selected_topic");
            if (selected_topic == null) {
                // Valores por defecto si el usuario no ha configurado nada
                // selected_topic = Properties.getValue("selected_topic");
                selected_topic = "Identidad";
            }
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
            var batterySave = Storage.getValue("batterySave");
            if (batterySave == null) {
                batterySave = Properties.getValue("batterySave");
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
            summaryMenu.addItem(new WatchUi.MenuItem("Tema actual", selected_topic, null, {}));
            summaryMenu.addItem(new WatchUi.MenuItem("Frecuencia", freq != null ? + "Cada " + freq.toString() + " minutos" : "N/A", null, {}));
            summaryMenu.addItem(new WatchUi.MenuItem("Habilitado", enabled == true ? "Sí" : "No", null, {}));
            summaryMenu.addItem(new WatchUi.MenuItem("Habilitado No Molestar", dnd == true ? "Sí" : "No", null, {}));
            summaryMenu.addItem(new WatchUi.MenuItem("Habilitado Ahorro Batería", batterySave == true ? "Sí" : "No", null, {}));
            summaryMenu.addItem(new WatchUi.MenuItem("Horas de Sueño", sStart + ":00 a " + sEnd + ":00", null, {}));

            // Lo mostramos. Usamos un Delegate vacío porque es solo para ver.
            WatchUi.pushView(summaryMenu, new WatchUi.Menu2InputDelegate(), WatchUi.SLIDE_LEFT);
        }
    }
    
    function onSettingsChanged() {
        // Esto refresca la pantalla si el usuario cambia algo en el móvil con la app abierta
        WatchUi.requestUpdate(); 
    }
}