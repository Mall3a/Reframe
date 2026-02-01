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
        var ts = Storage.getValue("proximo_timestamp");
        var frase = Storage.getValue("proxima_frase");
        // Leemos la categoría guardada por la App
        var categoria = Storage.getValue("cat_for_bg");
        
        var horaStr = "--:--";
        if (ts != null) {
            var info = Gregorian.info(new Time.Moment(ts), Time.FORMAT_MEDIUM);
            horaStr = Lang.format("$1$:$2$ ($3$)", [
                info.hour.format("%02d"),
                info.min.format("%02d"),
                info.day_of_week
            ]);
        }

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var h = dc.getHeight();
        var fTiny = Graphics.FONT_TINY;
        var fXTiny = Graphics.FONT_XTINY;
        var x = 2; 

        // LÍNEA 1: Título
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, 2, fXTiny, "PRÓXIMO MENSAJE EN:", Graphics.TEXT_JUSTIFY_LEFT);

        // LÍNEA 2: Hora
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        var yHora = (h / 2) - (dc.getFontHeight(fTiny) / 2);
        dc.drawText(x, yHora, fTiny, horaStr, Graphics.TEXT_JUSTIFY_LEFT);

        // LÍNEA 3: Frase (Color Dinámico)
        if (frase != null) {
            // Aplicamos el color guardado o azul por defecto
            dc.setColor(getGlanceColor(categoria), Graphics.COLOR_TRANSPARENT);
            
            var anchoMax = dc.getWidth() - 15; 
            var fraseFinal = truncarTexto(dc, frase, anchoMax, fXTiny);
            
            var yFrase = h - dc.getFontHeight(fXTiny) - 2;
            dc.drawText(x, yFrase, fXTiny, fraseFinal, Graphics.TEXT_JUSTIFY_LEFT);
        }
    }

    // Función para obtener el color sin acceder a la clase Settings (evita OOM)
    function getGlanceColor(cat) {
        if (cat == null) { return 0x00AAFF; } // Azul por defecto
        if (cat.equals("AZUL")) { return 0x00AAFF; }
        if (cat.equals("VERDE")) { return 0x55FF00; }
        if (cat.equals("PURPURA")) { return 0xAA55FF; }
        if (cat.equals("AMARILLO")) { return 0xFFFF00; }
        return 0x00AAFF;
    }

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