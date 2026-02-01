using Toybox.Application;
using Toybox.Application.Storage;
using Toybox.Application.Properties;
using Toybox.Lang;
using Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;

(:background)
class Settings {

    // Lista de mensajes por defecto
static var defaultMessages = [
       {:text => "Todo lo puedo en Cristo que me fortalece (Filipenses 4:13)", :category => "AZUL"},
       {:text => "Dios me ama profunda y eternamente", :category => "VERDE"},
       {:text => "Soy valiosa para Dios, Su tesoro especial", :category => "PURPURA"},
       {:text => "Soy la luz del mundo; tengo la luz de la vida (Juan 8:12)", :category => "AZUL"},
       {:text => "Soy amiga de Jesús; Él me dio a conocer todo lo del Padre (Juan 15:15)", :category => "VERDE"},
       {:text => "He sido elegida por Dios para dar fruto permanente (Juan 15:16)", :category => "PURPURA"},
       {:text => "Como el Padre amó a Jesús, así Él me ama; permanezco en Su amor (Juan 15:9)", :category => "AZUL"},
       {:text => "Soy más que vencedora por medio de Aquel que me amó (Romanos 8:37)", :category => "VERDE"},
       {:text => "La paz de Jesús gobierna mi corazón y nada me turba (Juan 14:27)", :category => "AZUL"},
       {:text => "Confío en el Señor y no me apoyo en mi propia prudencia (Proverbios 3:5)", :category => "VERDE"},
       {:text => "Mi corazón no se turba ni tiene miedo; acepto la paz de Cristo (Juan 14:27)", :category => "AZUL"},
       {:text => "En el mundo hay aflicción, pero confío: Jesús ya venció al mundo (Juan 16:33)", :category => "VERDE"},
       {:text => "Conozco la Verdad de Jesús, y esa Verdad me hace libre hoy (Juan 8:32)", :category => "PURPURA"},
       {:text => "El amor de Dios ha sido derramado en mi corazón por el Espíritu Santo (Romanos 5:5)", :category => "VERDE"},
       {:text => "El Espíritu de Verdad vive en mí y me guía a toda verdad (Juan 16:13)", :category => "PURPURA"},
       {:text => "No me afano por el mañana, Dios cuida de mí hoy (Mateo 6:34)", :category => "AZUL"},
       {:text => "Para mí todo es posible porque he decidido creer (Marcos 9:23)", :category => "AZUL"},
       {:text => "Tengo vida en abundancia porque Jesús me la ha dado (Juan 10:10)", :category => "VERDE"},
       {:text => "El gozo del Señor es mi fortaleza y me llena de energía (Nehemías 8:10)", :category => "VERDE"},
       {:text => "Dios es mi refugio y mi fortaleza, siempre presente (Salmo 46:1)", :category => "AZUL"},
       {:text => "Camino por fe y no por vista, confiando en Dios (2 Corintios 5:7)", :category => "AZUL"},
       {:text => "Permanezco en la Vid; por eso hoy llevo mucho fruto (Juan 15:5)", :category => "VERDE"},
       {:text => "Si Dios viste a las flores, cuidará de mí hoy (Mateo 6:30)", :category => "VERDE"},
       {:text => "Recibo poder del Espíritu Santo para ser testigo de Su gracia (Hechos 1:8)", :category => "PURPURA"},
       {:text => "Todo lo que pido creyendo que ya lo he recibido, me vendrá (Marcos 11:24)", :category => "AZUL"},
       {:text => "Pido con fe y recibo, porque mi Padre me ama (Mateo 7:7)", :category => "VERDE"},
       {:text => "Soy libre de toda carga, Su yugo es fácil y ligero (Mateo 11:30)", :category => "AMARILLO"},
       {:text => "Busco primero Su reino y todo lo demás me es añadido (Mateo 6:33)", :category => "AZUL"},
       {:text => "El Señor es mi pastor, nada me faltará (Salmo 23:1)", :category => "VERDE"},
       {:text => "Dios me da sabiduría y entendimiento para decidir bien (Santiago 1:5)", :category => "AZUL"},
       {:text => "Jesús me eligió a mí para que mi fruto permanezca (Juan 15:16)", :category => "VERDE"},
       {:text => "Tengo fe en Dios; si digo a esta montaña 'quítate', me obedece (Marcos 11:23)", :category => "AZUL"},
       {:text => "Mi Padre sabe lo que necesito antes de pedirlo; descanso en Él (Mateo 6:8)", :category => "VERDE"},
       {:text => "No me conformo a este mundo; me transformo renovando mi mente (Romanos 12:2)", :category => "PURPURA"},
       {:text => "Dios no me dio espíritu de temor, sino de poder, amor y dominio propio (2 Timoteo 1:7)", :category => "VERDE"},
       {:text => "En todo lo verdadero, honesto y puro pongo mi pensamiento (Filipenses 4:8)", :category => "AZUL"},
       {:text => "Por nada estoy afanosa; sean conocidas mis peticiones ante Dios (Filipenses 4:6)", :category => "AZUL"},
       {:text => "La paz de Dios, que sobrepasa todo entendimiento, guarda mi corazón (Filipenses 4:7)", :category => "AZUL"},
       {:text => "No ocupo mi mente en la carne, sino en el Espíritu, que es vida y paz (Romanos 8:6)", :category => "PURPURA"},
       {:text => "Dios me escogió en Él para que fuese santa y sin mancha ante Él (Efesios 1:4)", :category => "AZUL"},
       {:text => "Antes que me formase en el vientre me conoció y me santificó (Jeremías 1:5)", :category => "VERDE"},
       {:text => "La gracia de Dios se ha manifestado trayendo salvación para mí (Tito 2:11)", :category => "PURPURA"},
       {:text => "Al que a Jesús viene, Él no le echa fuera; voy confiada (Juan 6:37)", :category => "AZUL"},
       {:text => "Dios comenzó la buena obra en mí y la perfeccionará (Filipenses 1:6)", :category => "VERDE"},
       {:text => "Soy justa, porque Dios obra a través de mí", :category => "AZUL"},
       {:text => "Busco a Dios porque Él puso ese deseo en mí", :category => "VERDE"},
       {:text => "Entiendo, porque Dios ha permitido que entienda", :category => "AZUL"},
       {:text => "He enderezado mi camino porque Dios lo ha permitido", :category => "VERDE"},
       {:text => "Hago lo bueno y soy bondadosa porque Dios lo hace a través de mí", :category => "PURPURA"},
       {:text => "Hablo con sinceridad, verdad, rectitud y gracia", :category => "VERDE"},
       {:text => "Digo bendiciones y palabras dulces y de vida", :category => "PURPURA"},
       {:text => "Soy rápida para buscar la paz, proteger la vida y hacer el bien", :category => "AZUL"},
       {:text => "Camino con justicia, prosperidad, bendición y bienestar", :category => "AZUL"},
       {:text => "Camino en la senda de la paz, la armonía y la reconciliación", :category => "VERDE"},
       {:text => "Tengo reverencia y respeto profundo por Dios y Sus mandamientos", :category => "VERDE"},
       {:text => "Dios me da salud, abrigo y alimento porque busco primero Su reino", :category => "AZUL"},
       {:text => "Dios me da trabajo y soy bien recompensada porque busco Su reino", :category => "AZUL"},
       {:text => "Dios me da un cuerpo sano porque me ama y busco primero Su reino", :category => "VERDE"},
       {:text => "Dios me da una mente brillante porque me ama y busco primero Su reino", :category => "VERDE"},
       {:text => "Dios me da capacidad ante cualquier obstáculo porque busco Su reino", :category => "PURPURA"},
       {:text => "Dios me da habilidades para cumplir Su propósito y glorificarlo", :category => "AZUL"},
       {:text => "Dios me da inteligencia y discernimiento porque busco Su reino", :category => "VERDE"},
       {:text => "Dios renueva mi mente porque me ama y busco primero Su reino", :category => "AZUL"},
       {:text => "Dios abre oportunidades para mí porque me ama y busco Su reino", :category => "VERDE"},
       {:text => "Escucho Su voz, porque me ama y porque busco primero Su reino", :category => "AZUL"},
       {:text => "Todo lo que hago, lo hago de corazón como para el Señor (Colosenses 3:23)", :category => "VERDE"},
       {:text => "El Señor me recompensará con la herencia; a Cristo sirvo (Colosenses 3:24)", :category => "VERDE"},
       {:text => "Dios pagará a cada uno conforme a sus obras (Romanos 2:6)", :category => "AZUL"},
       {:text => "Estoy firme y constante, sabiendo que mi trabajo no es en vano (1 Corintios 15:58)", :category => "VERDE"},
       {:text => "No me canso de hacer el bien; a su tiempo segaré si no desmayo (Gálatas 6:9)", :category => "PURPURA"},
       {:text => "He sido fiel en lo poco, sobre mucho me pondrá el Señor (Mateo 25:21)", :category => "VERDE"},
       {:text => "Misericordia y verdad escribo en la tabla de mi corazón (Proverbios 3:3)", :category => "AZUL"},
       {:text => "Hallo gracia y buena opinión ante Dios y los hombres (Proverbios 3:4)", :category => "AZUL"},
       {:text => "Resisto la tentación y recibo la corona de vida (Santiago 1:12)", :category => "AMARILLO"},
       {:text => "Humildad y temor de Jehová son riquezas, honra y vida (Proverbios 22:4)", :category => "VERDE"},
       {:text => "Cuando hago misericordia, mi Padre que ve en lo secreto me recompensa (Mateo 6:3-4)", :category => "AZUL"},
       {:text => "Prosigo a la meta, al premio del supremo llamamiento en Cristo (Filipenses 3:14)", :category => "VERDE"},
       {:text => "Doy, y se me dará; medida buena, apretada y rebosante (Lucas 6:38)", :category => "AZUL"},
       {:text => "Pido, y se me dará; busco, y hallaré; llamo, y se abrirá (Mateo 7:7)", :category => "VERDE"},
       {:text => "Hago bien a los que me aborrecen y oro por los que me calumnian (Lucas 6:27-28)", :category => "PURPURA"},
       {:text => "Sin fe es imposible agradar a Dios; creo que Él es galardonador (Hebreos 11:6)", :category => "VERDE"},
       {:text => "Busco a Jehová con todo mi corazón y con toda mi alma (Deuteronomio 4:29)", :category => "PURPURA"},
       {:text => "Muchos primeros serán postreros, y postreros, primeros (Mateo 19:30)", :category => "AZUL"},
       {:text => "Jesús viene pronto y Su galardón con Él para recompensarme (Apocalipsis 22:12)", :category => "AZUL"},
       {:text => "El malvado obtiene ganancia ilusoria; el que siembra justicia, recompensa (Proverbios 11:18)", :category => "VERDE"},
       {:text => "Oro a mi Padre en lo secreto y Él me recompensará en público (Mateo 6:6)", :category => "VERDE"},
       {:text => "Me humillo bajo la poderosa mano de Dios para que Él me exalte (1 Pedro 5:6)", :category => "AZUL"},
       {:text => "Busco lo bueno para que viva y Jehová esté conmigo (Amós 5:14)", :category => "AZUL"},
       {:text => "Jehová prueba mi corazón para darme según el fruto de mis obras (Jeremías 17:10)", :category => "VERDE"},
       {:text => "Pido con fe, no dudando nada; recibo porque mi Padre me ama", :category => "VERDE"},
       {:text => "Justificada por la fe, tengo paz para con Dios por Jesucristo (Romanos 5:1)", :category => "AZUL"},
       {:text => "Tengo entrada por la fe a esta gracia en la cual estoy firme (Romanos 5:2)", :category => "VERDE"},
       {:text => "La tribulación produce paciencia; y la paciencia, esperanza (Romanos 5:3-4)", :category => "VERDE"},
       {:text => "La esperanza no avergüenza; Su amor llena mi corazón (Romanos 5:5)", :category => "PURPURA"},
       {:text => "Justificada en Su sangre, por Él seré salva de la ira (Romanos 5:9)", :category => "AZUL"},
       {:text => "Siendo reconciliada, mucho más seré salva por Su vida (Romanos 5:10)", :category => "AZUL"},
       {:text => "Me glorio en Dios por el Señor Jesús, por quien recibí la reconciliación (Romanos 5:11)", :category => "VERDE"},
       {:text => "Bástate mi gracia; Mi poder se perfecciona en tu debilidad (2 Corintios 12:9)", :category => "AMARILLO"},
       {:text => "Mi fe es mi creencia, certeza y confianza absoluta en Dios", :category => "PURPURA"},
       {:text => "En el día que temo, yo en Dios confío (Salmo 56:3)", :category => "AZUL"},
       {:text => "Dios guarda en paz a quien en Él persevera (Isaías 26:3)", :category => "VERDE"},
       {:text => "No me ha dado Dios espíritu de cobardía, sino de poder y amor (2 Timoteo 1:7)", :category => "PURPURA"},
       {:text => "Echo sobre Jehová mi carga, y Él me sustentará (Salmo 55:22)", :category => "AZUL"},
       {:text => "En la multitud de mis pensamientos, tus consolaciones alegran mi alma (Salmo 94:19)", :category => "VERDE"},
       {:text => "No temo, porque Dios está conmigo; Él me esfuerza y me ayuda (Isaías 41:10)", :category => "AZUL"},
       {:text => "Llevo cautivo todo pensamiento a la obediencia a Cristo (2 Corintios 10:5)", :category => "PURPURA"},
       {:text => "Jehová es la fortaleza de mi vida; ¿de quién he de temer? (Salmo 27:1)", :category => "AZUL"},
       {:text => "Tu palabra me fue por gozo y por alegría de mi corazón (Jeremías 15:16)", :category => "VERDE"},
       {:text => "Por la mañana hazme oír tu misericordia, porque en ti confío (Salmo 143:8)", :category => "AMARILLO"},
       // --- NUEVAS INCORPORACIONES (AFIRMACIONES DE RENOVACIÓN Y DESCANSO) ---
       {:text => "No me conformo a este siglo; transformo mi mente. (Rom. 12:2)", :category => "PURPURA"},
       {:text => "Soy hechura de Dios, creada para buenas obras. (Efe. 2:10)", :category => "AZUL"},
       {:text => "Dios me creó y me redimió; Suya soy yo. (Isa. 43:1)", :category => "AZUL"},
       {:text => "Soy una obra formidable y maravillosa de Dios. (Sal. 139:14)", :category => "AZUL"},
       {:text => "Ninguna condenación hay para mí en Cristo Jesús. (Rom. 8:1)", :category => "AZUL"},
       {:text => "No me juzgo a mí misma; el que me juzga es el Señor. (1 Cor. 4:4)", :category => "AZUL"},
       {:text => "Mi competencia no viene de mí, sino de Dios. (2 Cor. 3:5)", :category => "VERDE"},
       {:text => "Estoy completa en Cristo, sobre toda potestad. (Col. 2:10)", :category => "VERDE"},
       {:text => "Jehová es mi pastor; nada me faltará hoy. (Sal. 23:1)", :category => "VERDE"},
       {:text => "Dios me esfuerza, me ayuda y siempre me sustenta. (Isa. 41:10)", :category => "VERDE"},
       {:text => "Estoy contenta con lo que tengo; Él no me dejará. (Heb. 13:5)", :category => "VERDE"},
       {:text => "Jesús me hace descansar; Su yugo es fácil y ligero. (Mat. 11:30)", :category => "AMARILLO"},
       {:text => "Dios da el sueño a Su amada; descanso en paz. (Sal. 127:2)", :category => "AMARILLO"},
       {:text => "Su presencia va conmigo y me da descanso. (Éxo. 33:14)", :category => "AMARILLO"},
       {:text => "He entrado en el reposo de Dios hoy. (Heb. 4:10)", :category => "AMARILLO"},
       {:text => "El reposo fue hecho por causa de mí. (Mar. 2:27)", :category => "AMARILLO"},
       {:text => "Estoy quieta y conozco que Él es mi Dios. (Sal. 46:10)", :category => "AMARILLO"},
       {:text => "La paz de Dios guarda mi corazón y pensamientos. (Fil. 4:7)", :category => "AZUL"},
       {:text => "Tú me guardas en paz porque en Ti confío. (Isa. 26:3)", :category => "VERDE"},
       {:text => "Mi corazón apacible es vida para mi cuerpo. (Prov. 14:30)", :category => "VERDE"},
       {:text => "Tengo Su paz; mi corazón no tiene miedo. (Juan 14:27)", :category => "AZUL"},
       {:text => "Cristo vive en mí; vivo por la fe en el Hijo de Dios. (Gál. 2:20)", :category => "AZUL"},
       {:text => "Soy linaje escogido y nación santa para Dios. (1 Ped. 2:9)", :category => "AZUL"},
       {:text => "Permanezco en la Vid y hoy llevo mucho fruto. (Juan 15:5)", :category => "VERDE"},
       {:text => "He recibido el espíritu de adopción: ¡Abba, Padre! (Rom. 8:15)", :category => "PURPURA"},
       {:text => "Alma mía, en Dios solamente reposa mi esperanza. (Sal. 62:5)", :category => "AMARILLO"},
       {:text => "Llevo cautivo todo pensamiento a la obediencia a Cristo. (2 Cor. 10:5)", :category => "PURPURA"},
       // --- CONTRA EL RECHAZO Y ORFANDAD (IDENTIDAD HIJA) ---
       {:text => "No recibí espíritu de esclavitud, sino de adopción: ¡Abba, Padre! (Rom. 8:15)", :category => "PURPURA"},
       {:text => "Mirad cuál amor me ha dado el Padre, para ser llamada hija de Dios. (1 Juan 3:1)", :category => "AZUL"},
       {:text => "Dios me eligió antes de la creación para ser adoptada como Su hija. (Efe. 1:4-5)", :category => "AZUL"},
       {:text => "Aunque padre y madre me dejen, Jehová con todo me recogerá. (Sal. 27:10)", :category => "AZUL"},
       {:text => "No temo, Dios está conmigo; me sustenta con Su diestra justa. (Isa. 41:10)", :category => "VERDE"},
       {:text => "Cercano está Jehová a mi corazón quebrantado; Él me salva. (Sal. 34:18)", :category => "AZUL"},
       {:text => "Dios nunca me olvidará; me tiene esculpida en Sus palmas. (Isa. 49:15-16)", :category => "AZUL"},
       {:text => "Soy elegida de Dios y preciosa ante Sus ojos. (1 Ped. 2:4)", :category => "AZUL"},
       {:text => "Dios me hizo acepta en el Amado; soy totalmente bienvenida. (Efe. 1:6)", :category => "AZUL"},
       {:text => "Como Jesús, aunque sea desechada por hombres, soy piedra principal para Dios. (Mat. 21:42)", :category => "VERDE"},
       {:text => "Renuncio a todo rechazo; la sangre de Jesús me redime y Su gracia me basta. (2 Cor. 12:9)", :category => "PURPURA"},
       {:text => "Cambio mi percepción: no soy rechazada, soy profundamente amada y aceptada.", :category => "PURPURA"},
       // --- NUEVAS: AMOR, DISCERNIMIENTO Y ETERNIDAD ---
       {:text => "Permanezco fiel en la vocación a la que Dios me llamó. (1 Cor. 7:20)", :category => "VERDE"},
       {:text => "Busco la sabiduría de lo alto: pura, pacífica y amable. (Sant. 3:17)", :category => "AZUL"},
       {:text => "En cuanto dependa de mí, estoy en paz con todos. (Rom. 12:18)", :category => "VERDE"},
       {:text => "Mi amor no se goza de la injusticia, sino de la verdad. (1 Cor. 13:6)", :category => "PURPURA"},
       {:text => "No amo solo de palabra, sino de hecho y en verdad. (1 Juan 3:18)", :category => "PURPURA"},
       {:text => "Soy paciente y bondadosa, porque el amor vive en mí. (1 Cor. 13:4)", :category => "VERDE"},
       {:text => "Confío en el tiempo de Dios para entender lo que hoy no puedo. (Juan 16:12)", :category => "AZUL"},
       {:text => "Sobre toda cosa guardada, guardo mi corazón. (Prov. 4:23)", :category => "AMARILLO"},
       {:text => "Sin amor nada soy; el amor es mi guía hoy. (1 Cor. 13:2)", :category => "PURPURA"},
       {:text => "Soy cauta y velo para que nadie me engañe. (Mat. 24:4)", :category => "AZUL"},
       {:text => "Retengo la sana doctrina con fe y amor en Cristo. (2 Tim. 4:3)", :category => "PURPURA"},
       {:text => "Mi amor no se enfriará; mantengo mi fe encendida. (Mat. 24:12)", :category => "AZUL"},
       {:text => "La apariencia de este mundo pasa; mi esperanza es eterna. (1 Cor. 7:31)", :category => "AMARILLO"},
       {:text => "Hago tesoros en el cielo, donde nada se corrompe. (Mat. 6:20)", :category => "VERDE"},
       {:text => "Dios no es Dios de confusión, sino de paz en mi vida. (1 Cor. 14:33)", :category => "AZUL"},
       {:text => "Mi mente está siendo renovada ahora. Amén.", :category => "AMARILLO"}
   ];

    static function getNextSequentialMessage() {
        var userArray = Properties.getValue("messageList");
        var userSize = (userArray != null) ? userArray.size() : 0;
        var defSize = defaultMessages.size();
        var totalSize = userSize + defSize;

        if (totalSize == 0) { return null; }
        // TODO: Qué pasa aca cuando no hay mensajes?

        var index = Storage.getValue("last_msg_index");
        if (index == null || index >= totalSize) { index = 0; }

        // Extraer el mensaje usando la lógica de unión virtual
        var selected = getSpecificMessage(index, userArray, userSize);

        // Guardar el siguiente índice para la próxima ejecución
        Storage.setValue("last_msg_index", (index + 1) % totalSize);

        return {
            :msg => selected,
            :index => index,
            :total => totalSize
        };
    }

    // Función centralizada para obtener el mensaje sin duplicar arrays en RAM
    private static function getSpecificMessage(index, userArray, userSize) {
        if (userArray != null && index < userSize) {
            // Caso: El índice apunta a un mensaje personalizado del usuario
            var entry = userArray[index];
            return {
                :text => entry["msgText"],
                :category => mapCategory(entry["msgCat"])
            };
        } else {
            // Caso: El índice apunta a los mensajes por defecto (restamos el offset del usuario)
            var defIndex = index - userSize;
            return defaultMessages[defIndex];
        }
    }

    static function peekNextMessage() {
        var userArray = Properties.getValue("messageList");
        var userSize = (userArray != null) ? userArray.size() : 0;
        var totalSize = userSize + defaultMessages.size();

        var index = Storage.getValue("last_msg_index");
        if (index == null || index >= totalSize) { index = 0; }

        var selected = getSpecificMessage(index, userArray, userSize);
        return selected[:text]; 
    }

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

    static function clearData() {
        Properties.setValue("messageList", []);
        Storage.setValue("last_msg_index", 0);
    }
}