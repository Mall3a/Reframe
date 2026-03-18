 using Toybox.WatchUi;
using Toybox.System;
import Toybox.Application.Storage;
import Toybox.Application.Properties;

class RestoreConfigConfirmationDelegate extends WatchUi.ConfirmationDelegate {
    function initialize() {
        ConfirmationDelegate.initialize();
    }

function onResponse(response) {
        if (response == WatchUi.CONFIRM_NO) {
            return false;
        } else {
            // 1. Limpieza total de Storage
            Storage.clearValues();
            
            // 2. Restaurar valores desde Properties
            var freq = Properties.getValue("frequency");
            Storage.setValue("allowDND", Properties.getValue("allowDND"));
            Storage.setValue("batterySave", Properties.getValue("batterySave"));
            Storage.setValue("sleepStart", Properties.getValue("sleepStart"));
            Storage.setValue("sleepEnd", Properties.getValue("sleepEnd"));
            Storage.setValue("enabled", Properties.getValue("enabled"));
            Storage.setValue("frequency", freq);
            
            // 3. Resetear el índice a 0 y limpiar el buzón
            Storage.setValue("last_msg_index", 0);
            Storage.deleteValue("proxima_frase");
            Storage.deleteValue("cat_for_bg");

            // 4. Reprogramar el próximo evento
            var proximoMomento = Time.now().add(new Time.Duration(freq * 60));
            Storage.setValue("proximo_timestamp", proximoMomento.value());

            WatchUi.showToast("Configuración Reestablecida", null);
            
            // 5. Volver atrás
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            return true;
        }
    }    
}
