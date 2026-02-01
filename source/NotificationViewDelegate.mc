using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application;
using Toybox.Application.Storage;

class NotificationViewDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

     function onSelect() {
        System.println("onSelect clicked with pushView");
        WatchUi.pushView(new SettingsMenu(), new SettingsMenuInputDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSettingsChanged() {
        // Esto refresca la pantalla si el usuario cambia algo en el móvil con la app abierta
        WatchUi.requestUpdate(); 
    }

     // --- FUNCION PARA MANEJAR EL SALTO DE FRASE AL SALIR ---
     function onBack() {
        // Al presionar atrás, preparamos la frase que se verá 
        // en el próximo Glance y en la próxima entrada a la App.
        var data = Settings.getNextSequentialMessage();
        if (data != null) {
            Storage.setValue("proxima_frase", data[:msg][:text]);
            Storage.setValue("msg_for_bg", data[:msg][:text]); // Para el Background
            Storage.setValue("cat_for_bg", data[:msg][:category]);
            Storage.setValue("last_sent_index", data[:index]);
            Storage.setValue("last_sent_total", data[:total]);
        }
        return false; // El sistema cierra la aplicación
    }

}