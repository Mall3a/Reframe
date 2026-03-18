using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application.Storage;
using Toybox.Application.Properties;


class DeleteMessagesConfirmationDelegate extends WatchUi.ConfirmationDelegate {
    function initialize() {
        ConfirmationDelegate.initialize();
    }

    function onResponse(response) {
        if (response == WatchUi.CONFIRM_NO) {
            return false;
        } else {
            Settings.clearData(); // Esto borra last_msg_index y la lista de usuario

        
            WatchUi.showToast("Mensajes Borrados", null);
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            return true;
        }
    }
}
