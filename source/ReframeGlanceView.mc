import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Application.Storage;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Lang;

(:glance)
class ReframeGlanceView extends WatchUi.GlanceView {
    
    function initialize() {
        GlanceView.initialize();
    }

    function onUpdate(dc) {
        // 1. Cargar datos del Storage
        var ts = Storage.getValue("proximo_timestamp");
        var frase = Storage.getValue("proxima_frase");
        
        // 2. Preparar el texto de la hora
        var horaStr = "--:--";
        if (ts != null) {
            var info = Gregorian.info(new Time.Moment(ts), Time.FORMAT_MEDIUM);
            horaStr = Lang.format("$1$:$2$ ($3$)", [
                info.hour.format("%02d"),
                info.min.format("%02d"),
                info.day_of_week
            ]);
        }

        // 3. Limpiar fondo para AMOLED
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // 4. Configuración de Layout
        var h = dc.getHeight();
        var fTiny = Graphics.FONT_TINY;
        var fXTiny = Graphics.FONT_XTINY;
        
        // El margen X lo maneja el sistema por el icono del manifest, 
        // pero usamos un pequeño offset de seguridad.
        var x = 2; 

        // --- DIBUJO DE LÍNEAS ---

        // LÍNEA 1: Título (Gris claro) - Arriba del todo
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, 2, fXTiny, "PRÓXIMO MENSAJE EN:", Graphics.TEXT_JUSTIFY_LEFT);

        // LÍNEA 2: Hora (Blanco) - Centrada verticalmente respecto al alto del Glance
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        var yHora = (h / 2) - (dc.getFontHeight(fTiny) / 2);
        dc.drawText(x, yHora, fTiny, horaStr, Graphics.TEXT_JUSTIFY_LEFT);

        // LÍNEA 3: Frase (Azul) - Abajo del todo
        if (frase != null) {
            dc.setColor(0x00AAFF, Graphics.COLOR_TRANSPARENT);
            
            // Margen de seguridad derecho para evitar el corte de la pantalla curva
            var anchoMax = dc.getWidth() - 15; 
            var fraseFinal = truncarTexto(dc, frase, anchoMax, fXTiny);
            
            var yFrase = h - dc.getFontHeight(fXTiny) - 2;
            dc.drawText(x, yFrase, fXTiny, fraseFinal, Graphics.TEXT_JUSTIFY_LEFT);
        }
    }

    // Función auxiliar para acortar texto con puntos suspensivos
    function truncarTexto(dc, texto, anchoMax, fuente) {
        if (dc.getTextWidthInPixels(texto, fuente) <= anchoMax) {
            return texto;
        }
        var res = texto;
        while (res.length() > 0 && dc.getTextWidthInPixels(res + "...", fuente) > anchoMax) {
            res = res.substring(0, res.length() - 1);
        }
        return res + "...";
    }
}