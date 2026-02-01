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

            // LLENAR EL BUZÓN CON LA FRASE #1 POR DEFECTO ---
            var data = Settings.getNextSequentialMessage();
            if (data != null) {
                Storage.setValue("proxima_frase", data[:msg][:text]);
                Storage.setValue("cat_for_bg", data[:msg][:category]);
                Storage.setValue("last_sent_index", data[:index]);
                Storage.setValue("last_sent_total", data[:total]);
            }

            WatchUi.showToast("Mensajes Borrados", null);
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            return true;
        }
    }
}
