using Toybox.Application;
using Toybox.Lang;
using Toybox.System;

(:background)
class Settings {

    // Número máximo de mensajes configurables
    static var MAX_MESSAGES = 37;

    // Frecuencia en minutos 
    static function getFrequency() {
        var propertiesFrequency = Application.Properties.getValue("frequency");
        System.println("Frecuencia de Properties: "+ propertiesFrequency);
        return propertiesFrequency;
    }

    // Obtiene la lista de mensajes configurados
    static function getMessages() {
        var properties = Application.Properties;// "Dios está conmigo"
        var msgs = [];
        for (var i = 1; i <= MAX_MESSAGES; i++) {
            var propName = "message" + i;
            //System.println("property Name: "+ propName);
            var msg = properties.getValue(propName);
            //System.println("property msg: "+ msg);
            if (msg != null && msg.length() > 0) {
                msgs.add(msg);
            }
        }
        return msgs;
    }
}