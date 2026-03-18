using Toybox.Application.Storage;
using Toybox.Application.Properties;
using Toybox.Lang;
using Toybox.System;

class Settings {

    // --- TEMA 1: IDENTIDAD Y VALOR (AZUL / PURPURA) ---
    static function getTemaIdentidad() {
        return [
            {:text => "Mi valor no viene de lo que hago, viene de ser hechura de Dios. (Efe. 2:10)", :category => "PURPURA"},
            {:text => "Fui creada en Cristo Jesús; soy redimida, nombrada y llamada Suya.", :category => "AZUL"},
            {:text => "No hay ninguna condenación sobre mí; estoy completa en Él. (Rom. 8:1)", :category => "AZUL"},
            {:text => "Soy hija antes que hacedora; soy amada antes que productiva.", :category => "PURPURA"},
            {:text => "Dios me creó y me redimió; Suya soy yo. (Isa. 43:1)", :category => "AZUL"},
            {:text => "Soy una obra formidable y maravillosa de Dios. (Sal. 139:14)", :category => "AZUL"},
            {:text => "Soy linaje escogido y nación santa para Dios. (1 Ped. 2:9)", :category => "AZUL"},
            {:text => "He recibido el espíritu de adopción: ¡Abba, Padre! (Rom. 8:15)", :category => "PURPURA"},
            {:text => "Mirad cuál amor me ha dado el Padre, para ser llamada hija de Dios. (1 Juan 3:1)", :category => "AZUL"},
            {:text => "Dios me eligió antes de la creación para ser adoptada como Su hija. (Efe. 1:4-5)", :category => "AZUL"},
            {:text => "Aunque padre y madre me dejen, Jehová con todo me recogerá. (Sal. 27:10)", :category => "AZUL"},
            {:text => "Cercano está Jehová a mi corazón quebrantado; Él me salva. (Sal. 34:18)", :category => "AZUL"},
            {:text => "Dios nunca me olvidará; me tiene esculpida en Sus palmas. (Isa. 49:15-16)", :category => "AZUL"},
            {:text => "Soy elegida de Dios y preciosa ante Sus ojos. (1 Ped. 2:4)", :category => "AZUL"},
            {:text => "Dios me hizo acepta en el Amado; soy totalmente bienvenida. (Efe. 1:6)", :category => "AZUL"},
            {:text => "Como Jesús, soy piedra principal para Dios aunque otros me desechen.", :category => "VERDE"},
            {:text => "Renuncio a todo rechazo; la sangre de Jesús me redime. (2 Cor. 12:9)", :category => "PURPURA"},
            {:text => "Cambio mi percepción: soy profundamente amada y aceptada por mi Padre.", :category => "PURPURA"},
            {:text => "Dios me amó siendo aún pecadora; ¡cuánto más me ama siendo Su hija! (Rom. 5:8)", :category => "AZUL"},
            {:text => "La esperanza en Dios no avergüenza; Su amor inunda mi corazón. (Rom. 5:5)", :category => "AZUL"},
            {:text => "Antes que me formase en el vientre me conoció y me santificó (Jer. 1:5)", :category => "VERDE"},
            {:text => "Dios me escogió para que fuese santa y sin mancha ante Él (Efe. 1:4)", :category => "AZUL"},
            {:text => "Busco a Dios porque Él puso ese deseo en mí. Él comenzó la obra.", :category => "VERDE"},
            {:text => "Soy justa, porque Dios obra a través de mí.", :category => "AZUL"},
            {:text => "I am enough. I am at peace and harmony with everything around me.", :category => "AZUL"},
            {:text => "Nada esencial se ha perdido. Mi seguridad no depende de lo externo.", :category => "VERDE"},
            {:text => "Mi valor no depende de mi apariencia; soy maravillosamente creada.", :category => "PURPURA"},
            {:text => "No soy una huérfana espiritual; Dios está conmigo y no me deja.", :category => "AZUL"},
            {:text => "Renuncio a la identidad de invisible; Dios me ve y me da valor.", :category => "AZUL"},
            {:text => "Soy aceptada en el Amado; recibo amor sin miedo y con dignidad.", :category => "AZUL"},
            {:text => "Dios completa Su obra en mí a Su tiempo; no es tarde para Su gracia.", :category => "VERDE"},
            {:text => "Mirad cuál amor nos ha dado el Padre para ser hijos de Dios. (1 Juan 3:1)", :category => "AZUL"},
            {:text => "Soy la luz del mundo; tengo la luz de la vida (Juan 8:12)", :category => "AZUL"},
            {:text => "Soy amiga de Jesús; Él me dio a conocer todo lo del Padre (Juan 15:15)", :category => "VERDE"},
            {:text => "He sido elegida por Dios para dar fruto permanente (Juan 15:16)", :category => "PURPURA"},
            {:text => "Como el Padre amó a Jesús, así Él me ama; permanezco en Su amor (Juan 15:9)", :category => "AZUL"},
            {:text => "Soy más que vencedora por medio de Jesús (Romanos 8:37)", :category => "VERDE"},
            {:text => "Conozco la Verdad de Jesús, y esa Verdad me hace libre hoy (Juan 8:32)", :category => "PURPURA"},
            {:text => "El amor de Dios ha sido derramado en mi corazón por el Espíritu Santo.", :category => "VERDE"},
            {:text => "El Espíritu de Verdad vive en mí y me guía a toda verdad (Juan 16:13)", :category => "PURPURA"}
        ];
    }

    // --- TEMA 2: SANIDAD Y BIOLOGÍA (AMARILLO / VERDE) ---
    static function getTemaSanidad() {
        return [
            {:text => "Por el poder de Jesús mi cuello es sanado ahora.", :category => "AMARILLO"},
            {:text => "Por el poder de Jesús mi intestino es sanado y en paz.", :category => "AMARILLO"},
            {:text => "Por el poder de Jesús mi mente es sanada de toda ansiedad.", :category => "AZUL"},
            {:text => "Mi cuerpo y mente responden a la gracia; Él sana mis dolencias.", :category => "VERDE"},
            {:text => "Esto es incómodo, no peligroso. Bajo mis hombros y suelto mi mandíbula.", :category => "AMARILLO"},
            {:text => "Mi sistema nervioso está activado; respiro y bajo la intensidad ahora.", :category => "AMARILLO"},
            {:text => "Es tensión, no daño grave. Mi cuerpo está en alerta y puedo bajarla.", :category => "AMARILLO"},
            {:text => "Luz de mañana y ritmo de sueño: mi cuerpo se alinea con la paz de Dios.", :category => "VERDE"},
            {:text => "Estabilizo mi azúcar: desayuno con proteína y cuido mi energía hoy.", :category => "VERDE"},
            {:text => "Caminata de 10 min tras comer: mi cuerpo procesa el estrés y sana.", :category => "AMARILLO"},
            {:text => "Micro-movimientos: estiro mi cuerpo y rompo la tensión ahora.", :category => "AMARILLO"},
            {:text => "Mi cuerpo no es una máquina, es un templo que necesita ritmo y luz.", :category => "VERDE"},
            {:text => "Dejo el café y las energías falsas; mi paz viene de un sistema tranquilo.", :category => "VERDE"},
            {:text => "Cuido mi azúcar en sangre: elijo proteínas y grasas sanas.", :category => "VERDE"},
            {:text => "No me salto comidas; un cuerpo bien alimentado es una mente resiliente.", :category => "VERDE"},
            {:text => "Mi corazón apacible es vida para mi cuerpo. (Prov. 14:30)", :category => "VERDE"},
            {:text => "Mi cuerpo y mi pelo reflejan a una mujer que sana y crece hoy.", :category => "AMARILLO"},
            {:text => "Bástate mi gracia; mi poder se perfecciona en tu debilidad. (2 Cor. 12:9)", :category => "AMARILLO"},
            {:text => "Tengo vida en abundancia porque Jesús me la ha dado (Juan 10:10)", :category => "VERDE"},
            {:text => "El gozo del Señor es mi fortaleza y me llena de energía (Nehemías 8:10)", :category => "VERDE"},
            {:text => "Dios me da salud, abrigo y alimento porque busco primero Su reino.", :category => "AZUL"},
            {:text => "Dios me da un cuerpo sano porque me ama y busco primero Su reino.", :category => "VERDE"},
            {:text => "Cierro la respuesta de estrés: 5 min de respiración y estiramiento.", :category => "AMARILLO"},
            {:text => "Reduzco la luz azul; preparo mi mente para el sueño que Dios me da.", :category => "AMARILLO"}
        ];
    }

    // --- TEMA 3: TRABAJO, ÉXITO Y SENIORITY (VERDE / AZUL) ---
    static function getTemaTrabajo() {
        return [
            {:text => "Soy la respuesta a la necesidad de este equipo. Estoy aquí por propósito, no por azar.", :category => "VERDE"},
            {:text => "Dios me ha preparado para este momento; tengo lo que se necesita para cumplir mi propósito hoy.", :category => "VERDE"},
            {:text => "Mi competencia no viene de mí, sino de Dios. (2 Cor. 3:5)", :category => "VERDE"},
            {:text => "Todo lo que hago, lo hago de corazón como para el Señor (Col. 3:23)", :category => "VERDE"},
            {:text => "El Señor me recompensará con la herencia; a Cristo sirvo. (Col. 3:24)", :category => "VERDE"},
            {:text => "Hacer menos no me hace menos. Mi valor no depende de cuánto produzco.", :category => "VERDE"},
            {:text => "Soy suficiente incluso si hoy no rindo al máximo.", :category => "VERDE"},
            {:text => "Me están evaluando, no juzgando como persona. El rechazo es información.", :category => "AZUL"},
            {:text => "No necesito saberlo todo; solo mostrar cómo pienso con claridad.", :category => "AZUL"},
            {:text => "Si no resulta, sigo siendo valiosa, capaz y con experiencia.", :category => "PURPURA"},
            {:text => "Soy inteligente, aprendo rápido y explico lo complejo de forma simple.", :category => "AZUL"},
            {:text => "Si no quedo en un empleo, es que Dios tiene un lugar mejor preparado.", :category => "VERDE"},
            {:text => "Soy encantadora y profesional; valoran mi claridad y talento.", :category => "AZUL"},
            {:text => "Mi valor no depende de resultados laborales; descanso en Su aceptación.", :category => "AMARILLO"},
            {:text => "Dios me da trabajo y soy bien recompensada porque busco Su reino.", :category => "AZUL"},
            {:text => "Dios me da una mente brillante porque me ama y busco primero Su reino.", :category => "VERDE"},
            {:text => "Dios me da capacidad ante cualquier obstáculo porque busco Su reino.", :category => "PURPURA"},
            {:text => "Dios me da habilidades para cumplir Su propósito y glorificarlo.", :category => "AZUL"},
            {:text => "Dios me da inteligencia y discernimiento porque busco Su reino.", :category => "VERDE"},
            {:text => "Dios abre oportunidades para mí porque me ama y busco Su reino.", :category => "VERDE"},
            {:text => "No llevo la carga del resultado; soy un instrumento del Maestro.", :category => "VERDE"},
            {:text => "Mi integridad nace de saber quién soy, sin necesidad de aplausos.", :category => "AZUL"},
            {:text => "Hago tesoros en el cielo, donde nada se corrompe. (Mat. 6:20)", :category => "VERDE"},
            {:text => "Estoy firme y constante, sabiendo que mi trabajo no es en vano.", :category => "VERDE"},
            {:text => "Si en lo poco soy fiel, sobre mucho me pondrá el Señor. (Mat. 25:21)", :category => "VERDE"},
            {:text => "Prosigo a la meta, al premio del supremo llamamiento en Cristo.", :category => "VERDE"},
            {:text => "Sigo avanzando hacia la meta para ganar el premio que Dios ofrece.", :category => "AZUL"},
            {:text => "El malvado obtiene ganancia ilusoria; el que siembra justicia, recompensa.", :category => "VERDE"}
        ];
    }

    // --- TEMA 4: METANOIA Y MENTE (PURPURA / AZUL) ---
    static function getTemaMetanoia() {
        return [
            {:text => "Metanoia: cambio mi mentalidad por la de Cristo.", :category => "PURPURA"},
            {:text => "Llevo cautivo todo pensamiento a la obediencia a Cristo. (2 Cor. 10:5)", :category => "PURPURA"},
            {:text => "No creas todo lo que piensas; cuestiona las historias que te cuentas.", :category => "AZUL"},
            {:text => "Dejo de asumir lo que otros piensan; no tengo evidencia, solo proyecciones.", :category => "AZUL"},
            {:text => "Renuncio a la mentira de ser un fracaso; soy creación intencional.", :category => "PURPURA"},
            {:text => "No soy mi pasado; soy la persona que hoy elige sanar y crecer.", :category => "PURPURA"},
            {:text => "Yo ahora soy la adulta. Tú no tienes que defender a nadie ni pelear sola.", :category => "PURPURA"},
            {:text => "No estoy en la mesa de mi infancia; ahora puedo elegir distinto.", :category => "PURPURA"},
            {:text => "Rompo el acuerdo con la soledad; soy profundamente amada por Dios.", :category => "AZUL"},
            {:text => "Arrepentirse es alinear mis pensamientos con los pensamientos de Dios.", :category => "AZUL"},
            {:text => "Cierro toda puerta legal al desánimo al cambiar mi mente.", :category => "VERDE"},
            {:text => "Mi lenguaje interno refleja mi cambio de mente: hablo vida, no muerte.", :category => "AZUL"},
            {:text => "Cuestiono mis historias: ¿Esta versión de los hechos me construye?", :category => "PURPURA"},
            {:text => "Tomo control de mi narrativa; Dios escribe una nueva historia en mi mente.", :category => "VERDE"},
            {:text => "No me conformo a este siglo; transformo mi mente. (Rom. 12:2)", :category => "PURPURA"},
            {:text => "No me juzgo a mí misma; el que me juzga es el Señor. (1 Cor. 4:4)", :category => "AZUL"},
            {:text => "Observo quién soy ahora: una mujer que enfrenta sus retos con valentía.", :category => "AZUL"},
            {:text => "No soy una víctima; soy una adulta con recursos emocionales.", :category => "PURPURA"},
            {:text => "¿Quién soy hoy? Mis resultados recientes muestran que soy valiosa.", :category => "PURPURA"},
            {:text => "Mi realidad se crea con mis historias; hoy decido contarme éxito.", :category => "PURPURA"},
            {:text => "Tengo el poder de influenciar mi vida siendo intencional en mi fe.", :category => "AZUL"},
            {:text => "No ocupo mi mente en la carne, sino en el Espíritu. (Romanos 8:6)", :category => "PURPURA"},
            {:text => "En todo lo verdadero, honesto y puro pongo mi pensamiento. (Filipenses 4:8)", :category => "AZUL"},
            {:text => "Tu palabra me fue por gozo y por alegría de mi corazón. (Jeremías 15:16)", :category => "VERDE"},
            {:text => "Guardo la pureza de mi mente; no contamino mi visión con lo que daña.", :category => "PURPURA"}
        ];
    }

    // --- TEMA 5: PAZ, DESCANSO Y CONFIANZA (AMARILLO / AZUL / VERDE) ---
    static function getTemaPaz() {
        return [
            {:text => "Tú me guardas en paz perfecta porque mi mente se enfoca en Ti. (Isa. 26:3)", :category => "AZUL"},
            {:text => "Jesús me hace descansar; Su yugo es fácil y ligero. (Mat. 11:30)", :category => "AMARILLO"},
            {:text => "Dios da el sueño a Su amada; descanso en paz. (Sal. 127:2)", :category => "AMARILLO"},
            {:text => "Estad quietos, y conoced que yo soy Dios. (Sal. 46:10)", :category => "AMARILLO"},
            {:text => "La paz de Dios guarda mi corazón y mis pensamientos. (Fil. 4:7)", :category => "AZUL"},
            {:text => "No todo es urgente. Puedo esperar 60 segundos antes de reaccionar.", :category => "VERDE"},
            {:text => "Descansar no es perder tiempo; es un acto de fe y autonomía.", :category => "AMARILLO"},
            {:text => "Renuncio a la alerta constante; Dios es mi refugio y vivo confiada.", :category => "AMARILLO"},
            {:text => "No necesito respuesta inmediata para estar bien; yo me sostengo.", :category => "AZUL"},
            {:text => "La incertidumbre no es peligro; es el espacio donde Dios obra.", :category => "VERDE"},
            {:text => "Ritual de cierre: suelto los estímulos y preparo mi descanso sin culpa.", :category => "AMARILLO"},
            {:text => "Sé los planes que tengo para ti; bienestar y esperanza. (Jer. 29:11)", :category => "AZUL"},
            {:text => "Tengo esta esperanza como ancla del alma, firme y segura. (Heb. 6:19)", :category => "AZUL"},
            {:text => "El Dios de esperanza me llena de alegría y paz al confiar. (Romanos 15:13)", :category => "VERDE"},
            {:text => "Jehová es mi pastor, nada me faltará; en Cristo soy sostenida.", :category => "VERDE"},
            {:text => "Puedo detenerme sin miedo; Dios gobierna incluso cuando descanso.", :category => "AMARILLO"},
            {:text => "Su presencia va conmigo y me da descanso. (Éxo. 33:14)", :category => "AMARILLO"},
            {:text => "No vivo bajo amenaza, vivo bajo el cuidado amoroso de mi Padre.", :category => "VERDE"},
            {:text => "La paz de Jesús gobierna mi corazón y nada me turba (Juan 14:27)", :category => "AZUL"},
            {:text => "Confío en el Señor y no me apoyo en mi propia prudencia (Prov. 3:5)", :category => "VERDE"},
            {:text => "En el mundo hay aflicción, pero confío: Jesús ya venció al mundo.", :category => "VERDE"},
            {:text => "Dios es mi refugio y mi fortaleza, siempre presente (Salmo 46:1)", :category => "AZUL"},
            {:text => "Si Dios viste a las flores, cuidará de mí hoy (Mateo 6:30)", :category => "VERDE"},
            {:text => "Mi Padre sabe lo que necesito antes de pedirlo; descanso en Él.", :category => "VERDE"},
            {:text => "Por nada estoy afanosa; hago conocidas mis peticiones ante Dios.", :category => "AZUL"},
            {:text => "En la multitud de mis pensamientos, tus consolaciones alegran mi alma.", :category => "VERDE"},
            {:text => "Jehová es la fortaleza de mi vida; ¿de quién he de temer? (Salmo 27:1)", :category => "AZUL"},
            {:text => "Por la mañana hazme oír tu misericordia, porque en ti confío.", :category => "AMARILLO"},
            {:text => "Pido y recibo; busco y encuentro; llamo y se me abre. (Mateo 7:7)", :category => "VERDE"},
            {:text => "Jesus viene pronto. Trae consigo su recompensa. (Apoc. 22:12)", :category => "AZUL"}
        ];
    }

    // --- TEMA 6: RELACIONES Y LÍMITES (VERDE / PURPURA / AZUL) ---
    static function getTemaRelaciones() {
        return [
            {:text => "En cuanto dependa de mí, estoy en paz con todos. (Rom. 12:18)", :category => "VERDE"},
            {:text => "No busco validación en los demás; mi aprobación viene de mi Creador.", :category => "PURPURA"},
            {:text => "No le voy a agradar a todos, y eso está bien. Mi paz no es negociable.", :category => "VERDE"},
            {:text => "Si me ofendo, es porque tocaron una herida que debo sanar con Dios.", :category => "PURPURA"},
            {:text => "Acepto a quienes no puedo cambiar y cambio a quien sí puedo: a mí misma.", :category => "VERDE"},
            {:text => "Expreso mis sentimientos con claridad. Dios me da dominio propio.", :category => "AMARILLO"},
            {:text => "Perdonar es un acto de Metanoia: cambio el juicio por la paz.", :category => "VERDE"},
            {:text => "Suelto el derecho a la ofensa; mi salud mental es prioridad del cielo.", :category => "AMARILLO"},
            {:text => "Como otros me tratan es problema de sus inseguridades, no de mi valor.", :category => "VERDE"},
            {:text => "Soy capaz de hablar calmadamente y establecer límites sanos.", :category => "VERDE"},
            {:text => "Airaos, pero no pequéis; no se ponga el sol sobre vuestro enojo. (Efe. 4:26)", :category => "VERDE"},
            {:text => "Sustituyo mi necesidad de tener la razón por el deseo de mantener la paz.", :category => "VERDE"},
            {:text => "Respondo con gracia ante la ofensa; mi paz no depende de otros.", :category => "AZUL"},
            {:text => "Si alguien reacciona mal, es su historia, no la mía. Respondo con amor.", :category => "AMARILLO"},
            {:text => "Nadie me conoce tanto como Dios; no acepto juicios ajenos como verdades.", :category => "AZUL"},
            {:text => "Muestro interés real por otros y atraigo relaciones sanas a mi vida.", :category => "AZUL"},
            {:text => "Conexión social: un mensaje o una charla baja mi cortisol. No estoy sola.", :category => "AZUL"},
            {:text => "No amo solo de palabra, sino de hecho y en verdad. (1 Juan 3:18)", :category => "PURPURA"},
            {:text => "Soy paciente y bondadosa, porque el amor vive en mí. (1 Cor. 13:4)", :category => "VERDE"},
            {:text => "Sin amor nada soy; el amor es mi guía hoy. (1 Cor. 13:2)", :category => "PURPURA"},
            {:text => "Hago bien a quienes me hacen mal. (Lucas 6:33)", :category => "PURPURA"},
            {:text => "Hallo gracia y buena opinión ante Dios y los hombres (Prov. 3:4)", :category => "AZUL"},
            {:text => "Nunca abandono el amor y la verdad: los llevo alrededor de mi cuello.", :category => "VERDE"}
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

    // --- NUEVA FUNCIÓN PRINCIPAL ---
    static function getNextSequentialMessage() {
        var temaId = Storage.getValue("selected_tema");
        if (temaId == null) { temaId = "IDENTIDAD"; }

        var userArray = Properties.getValue("messageList");
        var userSize = (userArray != null) ? userArray.size() : 0;
        
        var selected = null;
        var totalSize = 0;
        var index = Storage.getValue("last_msg_index");
        if (index == null) { index = 0; }

        // CASO 1: Solo mensajes personales
        if (temaId.equals("PERSONAL")) {
            totalSize = userSize;
            if (totalSize == 0) { return null; }
            if (index >= totalSize) { index = 0; }
            
            selected = getSpecificUserMessage(index, userArray);
        } 
        // CASO 2: Mezcla (Usuario + Tema del sistema)
        else {
            var defMessages = getTemaById(temaId);
            totalSize = userSize + defMessages.size();
            if (totalSize == 0) { return null; }
            if (index >= totalSize) { index = 0; }

            if (index < userSize) {
                selected = getSpecificUserMessage(index, userArray);
            } else {
                var defIndex = index - userSize;
                selected = defMessages[defIndex];
            }
        }

        // Actualizar índice para la próxima vez
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
        Storage.deleteValue("msg_for_bg");
        Storage.deleteValue("cat_for_bg");
        Storage.deleteValue("last_sent_index");
        Storage.deleteValue("last_sent_total");
    }
}