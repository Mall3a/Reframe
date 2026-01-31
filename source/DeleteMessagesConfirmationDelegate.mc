 using Toybox.WatchUi;
using Toybox.System;

class DeleteMessagesConfirmationDelegate extends WatchUi.ConfirmationDelegate {
    function initialize() {
        ConfirmationDelegate.initialize();
    }

    function onResponse(response) {
        if (response == WatchUi.CONFIRM_NO) {
            System.println("Cancel");
            return false;
        } else {
            System.println("Confirm");
            Settings.clearData();
            WatchUi.showToast("Mensajes Borrados", null);
            System.println("Mensajes Borrados");
            WatchUi.popView(WatchUi.SLIDE_DOWN); // Cerrar menú tras borrar
            WatchUi.popView(WatchUi.SLIDE_DOWN); // Cerrar menú tras borrar X2
            return true;
        }
    }
}
