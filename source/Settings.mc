using Toybox.Application.Storage;
using Toybox.Application.Properties;
using Toybox.Lang;
using Toybox.System;

class Settings {

   // --- TEMA 1: TU IDENTIDAD (LA VOZ DEL PADRE) ---
    static function getTemaIdentidad() {
        return [
            {:text => "Hija, tu valor no viene de lo que haces, sino de que Yo te hice. (Efe. 2:10)", :category => "PURPURA"},
            {:text => "No hay nada que te condene; para Mí estás completa y perfecta. (Rom. 8:1)", :category => "AZUL"},
            {:text => "Eres Mi hija antes que hacedora; amada antes que productiva.", :category => "PURPURA"},
            {:text => "Te tengo esculpida en las palmas de Mis manos; jamás te olvidaré. (Isa. 49:16)", :category => "AZUL"},
            {:text => "Eres una obra formidable y maravillosa; Yo no cometo errores contigo.", :category => "AZUL"},
            {:text => "No eres invisible; Yo te veo, te nombro y te doy valor.", :category => "AZUL"},
            {:text => "Hija, te amé antes de que hicieras nada; Mi amor es tu ancla firme.", :category => "AZUL"},
            {:text => "Yo soy suficiente hoy porque Dios está conmigo y en paz conmigo.", :category => "AZUL"},
            {:text => "Eres Mi amiga; Yo te comparto lo que hay en Mi corazón. (Juan 15:15)", :category => "VERDE"},
            {:text => "No necesitas ganar Mi amor; ya lo tienes todo, hoy y siempre.", :category => "PURPURA"},
            {:text => "Hija, descansa: no es tarde para Mi gracia en tu vida.", :category => "VERDE"}
        ];
    }

    // --- TEMA 2: SANIDAD Y BIOLOGÍA (MI CUIDADO POR TI) ---
    static function getTemaSanidad() {
        return [
            {:text => "Hija, esto es incomodidad, no peligro. Suelta tu mandíbula ahora.", :category => "AMARILLO"},
            {:text => "Bástate Mi gracia; Mi poder se luce cuando tú te sientes débil. (2 Cor. 12:9)", :category => "AMARILLO"},
            {:text => "Tu sistema nervioso está activado; respira, Yo te estoy sosteniendo.", :category => "AMARILLO"},
            {:text => "Mi cuerpo es un templo que necesita ritmo, luz y paz, no exigencia.", :category => "VERDE"},
            {:text => "Quédate quieta y recuerda que Yo soy tu Dios. (Sal. 46:10)", :category => "AMARILLO"},
            {:text => "No todo es urgente. Puedo esperar 60 segundos; Yo tengo el control.", :category => "VERDE"},
            {:text => "Hija, descansar no es perder tiempo; es confiar en Mi cuidado.", :category => "AMARILLO"},
            {:text => "Tu intestino y tu mente están en paz bajo Mi gracia sanadora.", :category => "AMARILLO"},
            {:text => "No vives bajo amenaza; vives bajo Mi cuidado amoroso de Padre.", :category => "VERDE"},
            {:text => "Duerme tranquila, que Yo velo por tus sueños y tus planes.", :category => "AMARILLO"}
        ];
    }

    // --- TEMA 3: TRABAJO Y SENIORITY (SEGURIDAD EN MÍ) ---
    static function getTemaTrabajo() {
        return [
            {:text => "Hija, tu seguridad no es saberlo todo; es descansar en Mí mientras hablas.", :category => "AZUL"},
            {:text => "Hacer menos no te hace menos. Tu valor para Mí es innegociable.", :category => "VERDE"},
            {:text => "Te están evaluando a ti, no juzgando Mi amor por ti. Es solo información.", :category => "AZUL"},
            {:text => "Si no resulta, sigues siendo Mi hija: capaz, inteligente y amada.", :category => "PURPURA"},
            {:text => "No lleves la carga del resultado; Yo soy el Maestro, tú Mi instrumento.", :category => "VERDE"},
            {:text => "Tu integridad nace de saber quién eres para Mí, no de los aplausos.", :category => "AZUL"},
            {:text => "Hija, termina tu tarea y para. No necesitas optimizar cada minuto.", :category => "VERDE"},
            {:text => "Yo estoy contigo en lo pequeño y en lo grande. Descansa. (Mat. 25:21)", :category => "VERDE"},
            {:text => "No necesitas ser perfecta para estar lista para lo que Yo tengo para ti.", :category => "AZUL"},
            {:text => "Muestro cómo pienso con claridad; no necesito tener todas las respuestas.", :category => "AZUL"},
            {:text => "Si una puerta se cierra, es porque Yo te estoy cuidando.", :category => "VERDE"}
        ];
    }

    // --- TEMA 4: METANOIA (LA VOZ DE LA ADULTA) ---
    static function getTemaMetanoia() {
        return [
            {:text => "Hija, no te preocupes por el mañana. Yo sé lo que necesitas.", :category => "PURPURA"},
            {:text => "Yo soy el buey fuerte que tira de tu carga; tú solo camina a Mi paso.", :category => "PURPURA"},
            {:text => "Yo ahora soy la adulta. Tú no tienes que defender a nadie sola.", :category => "PURPURA"},
            {:text => "No tienes que ser perfecta para que Yo te quiera.", :category => "AZUL"},
            {:text => "No estás en la mesa de tu infancia; ahora puedes elegir distinto.", :category => "PURPURA"},
            {:text => "No creo todo lo que pienso; cuestiono las historias que me cuento.", :category => "AZUL"},
            {:text => "Renuncio a la mentira de ser un fracaso; soy creación intencional de Dios.", :category => "PURPURA"},
            {:text => "No me juzgo a mí misma; Mi único juez es el Señor. (1 Cor. 4:4)", :category => "AZUL"},
            {:text => "El silencio no es abandono. Estoy sola, pero estoy segura con Dios.", :category => "AZUL"},
            {:text => "Mi realidad se sana hoy con historias de paz y de amor del Padre.", :category => "PURPURA"}
        ];
    }

    // --- TEMA 5: PAZ Y CONFIANZA ---
    static function getTemaPaz() {
        return [
            {:text => "Yo te guardo en paz perfecta porque tu mente descansa en Mí.", :category => "AZUL"},
            {:text => "Mi yugo es fácil y Mi carga es ligera; descansa hoy en Mí.", :category => "AMARILLO"},
            {:text => "Hija, Yo te doy el sueño; puedes descansar en paz sin culpa.", :category => "AMARILLO"},
            {:text => "La paz de Dios guarda hoy mi corazón y todos mis pensamientos.", :category => "AZUL"},
            {:text => "La incertidumbre no es peligro; es el espacio donde Yo obro para ti.", :category => "VERDE"},
            {:text => "Sé los planes que tengo para ti: son de bienestar y esperanza.", :category => "AZUL"},
            {:text => "Jehová es mi pastor, nada me faltará; en Cristo soy sostenida.", :category => "VERDE"},
            {:text => "Puedo detenerme sin miedo; Dios gobierna incluso cuando descanso.", :category => "AMARILLO"},
            {:text => "No vivo bajo amenaza, vivo bajo el cuidado amoroso de mi Padre.", :category => "VERDE"},
            {:text => "Si Yo visto a las flores, cuidaré de ti hoy con más amor. (Mat. 6:30)", :category => "VERDE"}
        ];
    }

    // --- TEMA 6: RELACIONES Y LÍMITES ---
    static function getTemaRelaciones() {
        return [
            {:text => "Hija, Mi aprobación es la única que necesitas para estar completa.", :category => "PURPURA"},
            {:text => "No le vas a agradar a todos, y eso está bien. Tu paz es Mía.", :category => "VERDE"},
            {:text => "Suelto el derecho a la ofensa; Mi salud mental es prioridad del Cielo.", :category => "AMARILLO"},
            {:text => "Como otros me tratan es su historia, no la mía ni Mi valor.", :category => "VERDE"},
            {:text => "Nadie te conoce tanto como Yo; no aceptes juicios ajenos como verdades.", :category => "AZUL"},
            {:text => "Respondo con gracia; Mi paz no depende del humor de los demás.", :category => "AZUL"},
            {:text => "Puedo establecer límites con amor porque Yo te doy dominio propio.", :category => "VERDE"},
            {:text => "No estás sola. Yo estoy contigo y pongo personas sanas en tu camino.", :category => "AZUL"}
        ];
    }


    // Esta es la función que decide QUÉ lista usar
    static function getDefaultMessages() {
        var temaId = Storage.getValue("selected_tema");
        if (temaId == null) { temaId = "IDENTIDAD"; } // Por defecto

        if (temaId.equals("IDENTIDAD")) { return getTemaIdentidad(); }
        if (temaId.equals("SANIDAD"))   { return getTemaSanidad(); }
        if (temaId.equals("TRABAJO"))    { return getTemaTrabajo(); }
        if (temaId.equals("METANOIA"))   { return getTemaMetanoia(); }
        if (temaId.equals("PAZ"))        { return getTemaPaz(); }
        if (temaId.equals("RELACIONES")) { return getTemaRelaciones(); }
        
        return getTemaIdentidad();
    }

    static function getNextSequentialMessage() {
        var temaId = Storage.getValue("selected_tema");
        if (temaId == null) { temaId = "IDENTIDAD"; }

        var userArray = Properties.getValue("messageList");
        var userSize = (userArray != null) ? userArray.size() : 0;
        
        var selected = null;
        var totalSize = 0;
        var index = Storage.getValue("last_msg_index");
        if (index == null) { index = 0; }

        var defMessages = getTemaById(temaId);
        var defSize = defMessages.size();

        // 1. Calcular tamaño total según el tema
        if (temaId.equals("PERSONAL")) {
            totalSize = userSize;
        } else {
            totalSize = userSize + defSize;
        }

        // 2. Si no hay mensajes de ningún tipo, abortar
        if (totalSize == 0) { return null; }

        // 3. Validar que el índice no se haya quedado fuera de rango (Crucial)
        if (index >= totalSize || index < 0) { index = 0; }

        // 4. Obtener el mensaje correspondiente
        if (index < userSize) {
            selected = getSpecificUserMessage(index, userArray);
        } else {
            var defIndex = index - userSize;
            // Doble validación de seguridad para el array del sistema
            if (defIndex < 0 || defIndex >= defSize) { defIndex = 0; }
            selected = defMessages[defIndex];
        }

        // 5. Actualizar índice para la próxima vez (Avanzamos)
        Storage.setValue("last_msg_index", (index + 1) % totalSize);

        return { :msg => selected, :index => index, :total => totalSize };
    }

    // --- FUNCIÓN AUXILIAR PARA MAPEAR TEMAS ---
    private static function getTemaById(id) {
        if (id.equals("SANIDAD"))   { return getTemaSanidad(); }
        if (id.equals("TRABAJO"))    { return getTemaTrabajo(); }
        if (id.equals("METANOIA"))   { return getTemaMetanoia(); }
        if (id.equals("PAZ"))        { return getTemaPaz(); }
        if (id.equals("RELACIONES")) { return getTemaRelaciones(); }
        
        // Si algo falla o es la primera vez, Identidad es la base
        return getTemaIdentidad(); 
    }

    // --- FUNCIÓN AUXILIAR PARA MENSAJES DE USUARIO ---
    private static function getSpecificUserMessage(index, userArray) {
        var entry = userArray[index] as Toybox.Lang.Dictionary;
        return {
            :text => entry.get("msgText"),
            :category => mapCategory(entry.get("msgCat"))
        };
    }

    private static function getSpecificMessage(index, userArray, userSize) {
        if (userArray != null && index < userSize) {
            var entry = userArray[index] as Toybox.Lang.Dictionary;
            return {
                :text => entry.get("msgText"),
                :category => mapCategory(entry.get("msgCat"))
            };
        } else {
            var defMessages = getDefaultMessages(); 
            var defIndex = index - userSize;
            // Aseguramos que el índice no se pase del límite por error
            if (defIndex < 0) { defIndex = 0; }
            if (defIndex >= defMessages.size()) { defIndex = 0; }
            return defMessages[defIndex]; 
        }
    }

    static function mapCategory(id) {
        var cats = ["AZUL", "VERDE", "PURPURA", "AMARILLO"];
        if (id != null && id >= 0 && id < cats.size()) {
            return cats[id];
        }
        return "AZUL";
    }

    static function getColor(messageObj, index, total) {
        if (messageObj == null || messageObj[:category] == null) { return 0x000055; }
        var cat = messageObj[:category];
        if (cat.equals("AZUL")) { return 0x000055; }
        if (cat.equals("VERDE")) { return 0x003300; }
        if (cat.equals("PURPURA")) { return 0x330066; }
        if (cat.equals("AMARILLO")) { return 0x552200; }
        return 0x000055;
    }

    static function clearData() {
        Properties.setValue("messageList", []);
        Storage.setValue("last_msg_index", 0);
        Storage.deleteValue("proxima_frase");
        Storage.deleteValue("cat_for_bg");
        Storage.deleteValue("last_sent_index");
        Storage.deleteValue("last_sent_total");

        Storage.deleteValue("msg_for_bg"); // <--- VITAL para que no salga una frase vieja borrada
    }
}