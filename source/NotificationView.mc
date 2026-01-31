import Toybox.WatchUi;
import Toybox.Graphics;

class NotificationView extends WatchUi.View {
    private var _messageObj;
    private var _index;
    private var _total;

    function initialize(messageObj, index, total) {
        View.initialize();
        _messageObj = messageObj;
        _index = index;
        _total = total;
    }

    function onUpdate(dc) {
        // 1. Fondo dinámico
        var backgroundColor = Settings.getColor(_messageObj, _index, _total);
        dc.setColor(backgroundColor, backgroundColor);
        dc.clear();

        // 2. Preparar el texto
        var text = _messageObj[:text];
        if (text == null) { text = ""; }
        
        // 3. Dibujar el área de texto
        // Usamos un margen de seguridad un poco mayor para pantallas redondas
        var margin = dc.getWidth() * 0.12; // 12% de margen
        var textArea = new WatchUi.TextArea({
            :text => text,
            :color => Graphics.COLOR_WHITE,
            :font => Graphics.FONT_SYSTEM_SMALL, // or Graphics.FONT_SYSTEM_TINY
            :locX => margin,
            :locY => margin,
            :width => dc.getWidth() - (margin * 2),
            :height => dc.getHeight() - (margin * 2) - 20, // Espacio para el contador
            :justification => Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        });
      
        textArea.draw(dc);

        // 4. Dibujar el Contador (X / Total)
        var progressText = (_index + 1).toString() + " / " + _total;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        
        // Ubicación relativa al alto de la pantalla para evitar cortes
        dc.drawText(
            dc.getWidth() / 2, 
            dc.getHeight() - (dc.getHeight() * 0.15), // 15% desde abajo
            Graphics.FONT_SYSTEM_XTINY, 
            progressText, 
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }
}