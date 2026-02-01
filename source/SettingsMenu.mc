import Toybox.WatchUi;
using Toybox.Application.Storage;
using Toybox.Application.Properties;

class SettingsMenu extends WatchUi.Menu2 {

    function initialize() {
        Menu2.initialize({:title=>"Configuraciones"});

        var sleepStart = Storage.getValue("sleepStart");
        if (sleepStart == null) {
            // Valores por defecto si el usuario no ha configurado nada
            sleepStart = Properties.getValue("sleepStart");
        }
        var sleepEnd = Storage.getValue("sleepEnd");
        if (sleepEnd == null) {
            // Valores por defecto si el usuario no ha configurado nada
            sleepEnd = Properties.getValue("sleepEnd");
        }

        // Frecuencia
        Menu2.addItem(new WatchUi.MenuItem("Establecer Frecuencia", null, :freq, {}));
        var frequency = Storage.getValue("frequency");
        if (frequency == null) {
            // Valores por defecto si el usuario no ha configurado nada
            // Garmin no permite menos de 5 minutos en Background
            frequency = Properties.getValue("frequency");
        }
        System.println("Frecuencia actual? : "+  frequency);
        // Desactivar Recordatorios (Toggle)
        var isEnabled = Storage.getValue("enabled");
        if (isEnabled == null) {
            // Valores por defecto si el usuario no ha configurado nada
            isEnabled = Properties.getValue("enabled");
        }
        System.println("Notificaciones Habilitadas? : "+ isEnabled);

        Menu2.addItem(new WatchUi.ToggleMenuItem("Habilitar Notificaciones", null, :enable_msgs, isEnabled, {}));

        // Modo No Molestar (Toggle)
        var allowDND = Storage.getValue("allowDND");
        if (allowDND == null) {
            // Valores por defecto si el usuario no ha configurado nada
            allowDND = Properties.getValue("allowDND");
        }
        System.println("Notificaciones Habilitadas en DnD? : "+ allowDND);
        Menu2.addItem(new WatchUi.ToggleMenuItem("Habilitar en modo No Molestar", null, :dnd_mode, allowDND, {}));

        // Dentro del initialize de SettingsMenu
        Menu2.addItem(new WatchUi.MenuItem(
            "Horario de Sueño", 
            sleepStart + ":00 a " + sleepEnd + ":00", 
            "sleep_time", 
            {}
        ));

        Menu2.addItem(new WatchUi.MenuItem("Configuración Actual", "Resumen", :view_storage, {}));
      
        System.println("Horas de sueño: "+ sleepStart + ":00 a " + sleepEnd + ":00");
        // Borrar Frases (Acción directa)
        Menu2.addItem(new WatchUi.MenuItem("Borrar Frases Agregadas", "Limpiar lista", :delete_msgs, {}));
        
        // Reestablecer Configuracion (Acción directa)
        Menu2.addItem(new WatchUi.MenuItem("Reestablecer Configuración", null, :restore_settings, {}));

       
    }

    function onSettingsChanged() {
        // Esto refresca la pantalla si el usuario cambia algo en el móvil con la app abierta
        WatchUi.requestUpdate(); 
    }
}