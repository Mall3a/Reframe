import Toybox.WatchUi;
import Toybox.Application.Storage;
import Toybox.Application.Properties;

class SleepPickerDelegate extends WatchUi.PickerDelegate {
    var _key; // "sleepStart" o "sleepEnd"

    function initialize(key) {
        PickerDelegate.initialize();
        _key = key;
    }

function onAccept(values) {
        var hour = values[0]; // La hora elegida en el Picker
        
        // Guardamos el valor (sea de inicio o de fin)
        Storage.setValue(_key, hour);
        System.println("Hora escogida: "+ hour);
        
        // Cerramos el picker actual
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE); 

        //  abrimos el de 'sleepEnd' de inmediato
        if (_key.equals("sleepStart")) {
            System.println("Configurando horario de Fin de sueño");
            WatchUi.pushView(
                new $.SleepPicker("Fin de Sueño"), 
                new $.SleepPickerDelegate("sleepEnd"), // Ahora le pasamos la llave de FIN
                WatchUi.SLIDE_UP
            );
        } else {
            // Si ya era el de sleepEnd, el proceso terminó. 
            // 1. Cerramos el Menú de configuraciones viejo que está por debajo
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE); 
            // 2. Lo abrimos de nuevo. Esto ejecutará el initialize() y leerá las horas nuevas
            WatchUi.pushView(new $.SettingsMenu(), new $.SettingsMenuInputDelegate(), WatchUi.SLIDE_IMMEDIATE);
        }
        return true;
    }

    function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
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