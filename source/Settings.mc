using Toybox.Application;
using Toybox.Application.Storage;
using Toybox.Application.Properties;
using Toybox.Lang;
using Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
(:background)
class Settings {

// Mantenemos los defaults por si el usuario no ha configurado nada aún
    static var defaultMessages = [
        {:text => "Todo lo puedo en Cristo que me fortalece (Filipenses 4:13)", :category => "AZUL"},
        {:text => "Dios me ama profunda y eternamente", :category => "VERDE"},
        {:text => "Soy valiosa para Dios, Su tesoro especial", :category => "PURPURA"},
        {:text => "Soy la luz del mundo; no ando en tinieblas, tengo la luz de la vida (Juan 8:12)", :category => "AZUL"},
        {:text => "Soy un amigo de Jesús; Él me ha dado a conocer todo lo del Padre (Juan 15:15)", :category => "VERDE"},
        {:text => "He sido elegida y puesta por Dios para dar fruto permanente (Juan 15:16)", :category => "PURPURA"},
        {:text => "Como el Padre amó a Jesús, así Él me ama a mí; permanezco en Su amor (Juan 15:9)", :category => "AZUL"},
        {:text => "Soy más que vencedora por medio de Aquel que me amó (Romanos 8:37)", :category => "VERDE"},
        {:text => "La paz de Jesús gobierna mi corazón y nada me turba (Juan 14:27)", :category => "AZUL"},
        {:text => "Confío en el Señor con todo mi corazón y no me apoyo en mi propia inteligencia (Proverbios 3:5)", :category => "VERDE"},
        {:text => "Mi corazón no se turba ni tiene miedo; acepto la paz de Cristo (Juan 14:27)", :category => "AZUL"},
        {:text => "En el mundo hay aflicción, pero confío: Jesús ya venció al mundo (Juan 16:33)", :category => "VERDE"},
        {:text => "Conozco la Verdad de Jesús, y esa Verdad me hace libre hoy (Juan 8:32)", :category => "PURPURA"},
        {:text => "El amor de Dios ha sido derramado en mi corazón por el Espíritu Santo (Romanos 5:5)", :category => "VERDE"},
        {:text => "El Espíritu de Verdad vive en mí y me guía a toda verdad (Juan 16:13)", :category => "PURPURA"},
        {:text => "No me afano por el mañana, Dios cuida de mí hoy (Mateo 6:34)", :category => "AZUL"},
        {:text => "Para mí todo es posible porque he decidido creer (Marcos 9:23)", :category => "AZUL"},
        {:text => "Tengo vida en abundancia porque Jesús me la ha dado (Juan 10:10)", :category => "VERDE"},
        {:text => "El gozo del Señor es mi fortaleza y me llena de energía (Nehemías 8:10)", :category => "VERDE"},
        {:text => "Dios es mi refugio y mi fortaleza, siempre presente en mi vida (Salmo 46:1)", :category => "AZUL"},
        {:text => "Camino por fe y no por vista, confiando en las promesas de Dios (2 Corintios 5:7)", :category => "AZUL"},
        {:text => "Permanezco en la Vid; por eso hoy llevo mucho fruto (Juan 15:5)", :category => "VERDE"},
        {:text => "Si Dios viste así a las flores, ¡cuánto más cuidará de mí hoy! (Mateo 6:30)", :category => "VERDE"},
        {:text => "Recibo poder del Espíritu Santo para ser testigo de Su gracia (Hechos 1:8)", :category => "PURPURA"},
        {:text => "Todo lo que pido creyendo que ya lo he recibido, me vendrá (Marcos 11:24)", :category => "AZUL"},
        {:text => "Pido con fe y recibo, porque mi Padre me ama (Mateo 7:7)", :category => "VERDE"},
        {:text => "Soy libre de toda carga, Su yugo es fácil y ligero (Mateo 11:30)", :category => "AMARILLO"},
        {:text => "Busco primero Su reino y todo lo demás me es añadido (Mateo 6:33)", :category => "AZUL"},
        {:text => "El Señor es mi pastor, nada me falta (Salmo 23:1)", :category => "VERDE"},
        {:text => "Dios me da sabiduría y entendimiento para tomar buenas decisiones (Santiago 1:5)", :category => "AZUL"},
        {:text => "No me elegí yo a mí misma, Jesús me elegió a mí para que mi fruto permanezca (Juan 15:16)", :category => "VERDE"},
        {:text => "Tengo fe en Dios; si digo a esta montaña 'quítate', ella me obedece (Marcos 11:23)", :category => "AZUL"},
        {:text => "Mi Padre sabe lo que necesito antes de que yo lo pida; descanso en Su cuidado (Mateo 6:8)", :category => "VERDE"},
        {:text => "No me conformo a este mundo; me transformo renovando mi mente (Romanos 12:2)", :category => "PURPURA"},
        {:text => "Dios no me dio un espíritu de temor, sino de poder, amor y dominio propio (2 Timoteo 1:7)", :category => "VERDE"},
        {:text => "Todo lo que es verdadero, honesto y puro, en eso pongo mi pensamiento (Filipenses 4:8)", :category => "AZUL"},
        {:text => "Mi mente está siendo renovada ahora. Amén.", :category => "AMARILLO"}
    ];

    
    static function getFrequency() {
        var freq = Properties.getValue("frequency");
        System.println("Frecuencia en Properties XML (Garmin Connect): " + freq);
        return freq;
    }

    // Procesa la lista que viene de Garmin Connect y la combina con los defaults
    static function getMessages() {
        var userArray = Properties.getValue("messageList");
        var parsed = [];
        
        // 1. Procesar mensajes del usuario si existen
        if (userArray != null && userArray.size() > 0) {
            for (var i = 0; i < userArray.size(); i++) {
                var entry = userArray[i]; 
                var keys = entry.keys();
                var text = "";
                var catId = 0;

                for (var j = 0; j < keys.size(); j++) {
                    var key = keys[j];
                    if (key.toString().equals("msgText")) {
                        text = entry[key];
                    } else if (key.toString().equals("msgCat")) {
                        catId = entry[key];
                    }
                }

                if (text instanceof Lang.String && text.length() > 0) {
                    parsed.add({
                        :text => text,
                        :category => mapCategory(catId)
                    });
                }
            }
        }
        
        // 2. MERGE: Combinar los mensajes del usuario con los defaultMessages
        // Creamos una copia de los defaults y añadimos los del usuario al principio o final
        var totalMessages = [];
        
        // Añadimos primero los del usuario (si hay)
        if (parsed.size() > 0) {
            totalMessages.addAll(parsed);
        }
        
        // Añadimos los mensajes por defecto después
        totalMessages.addAll(defaultMessages);

        return totalMessages;
    }

    // Convierte el ID numérico del dropdown a String para tu lógica de colores
    static function mapCategory(id) {
        // El orden debe ser igual al del XML
        // 0: Azul, 1: Verde, 2: Púrpura, 3: Amarillo
        var cats = ["AZUL", "VERDE", "PURPURA", "AMARILLO"];
        if (id != null && id >= 0 && id < cats.size()) {
            return cats[id];
        }
        return "AZUL";
    }

    static function getColor(messageObj, index, total) {
        var cat = messageObj[:category];
        
        // Colores basados en los IDs del XML
        if (cat != null) {
            if (cat.equals("AZUL")) { return 0x000055; }
            if (cat.equals("VERDE")) { return 0x003300; }
            if (cat.equals("PURPURA")) { return 0x330066; }
            if (cat.equals("AMARILLO")) { return 0x552200; }
        }
        
        // Fallback por si acaso
        return 0x000055;
    }

    static function getNextSequentialMessage() {
        var msgs = getMessages();
        var size = msgs.size();
        if (size == 0) { return null; }

        var index = Storage.getValue("last_msg_index");
        // Validación de seguridad por si la lista cambió de tamaño
        if (index == null || index >= size) { index = 0; }

        var selected = msgs[index];

        // Guardar el siguiente índice para la PRÓXIMA vez
        Storage.setValue("last_msg_index", (index + 1) % size);

        // Devolvemos un objeto que contiene todo lo necesario
        return {
            :msg => selected,
            :index => index,
            :total => size
        };
    }

    static function clearData() {
        Properties.setValue("messageList", []);  // userArray de Garmin Connect
        // También reiniciar el índice de lectura
        Storage.setValue("last_msg_index", 0);
        System.println("messageList "+ Properties.getValue("messageList"));
        System.println("last_msg_index "+ Storage.getValue("last_msg_index"));
    }
}