import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang; // Importante para usar .toString() de forma segura

class NotificationView extends WatchUi.View {
    private var _messageObj;
    private var _index;
    private var _total;

    function initialize(messageObj, index, total) {
        View.initialize();
        _messageObj = messageObj;
        
        // Validamos que sean números. Si vienen null, usamos valores por defecto.
        _index = (index != null) ? index : 0;
        _total = (total != null) ? total : 0;
    }

    function onUpdate(dc) {
        // 1. Fondo dinámico
        var backgroundColor = Settings.getColor(_messageObj, _index, _total);
        dc.setColor(backgroundColor, backgroundColor);
        dc.clear();

        // 2. Preparar el texto
        var text = "";
        if (_messageObj != null && _messageObj[:text] != null) {
            text = _messageObj[:text];
        }
        
        // 3. Dibujar el área de texto
        var margin = dc.getWidth() * 0.12; 
        var textArea = new WatchUi.TextArea({
            :text => text,
            :color => Graphics.COLOR_WHITE,
            :font => (text.length() > 120) ? Graphics.FONT_SYSTEM_TINY : Graphics.FONT_SYSTEM_SMALL,
            :locX => margin,
            :locY => margin,
            :width => dc.getWidth() - (margin * 2),
            :height => dc.getHeight() - (margin * 2) - 20, 
            :justification => Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        });
      
        textArea.draw(dc);

        // 4. Dibujar el Contador (X / Total) - LÍNEA 43 PROTEGIDA
        // Aseguramos que _index sea un número antes de sumar
        var displayIndex = (_index instanceof Toybox.Lang.Number) ? (_index + 1) : 1;
        var displayTotal = (_total != null) ? _total : 0;
        
        var progressText = displayIndex.toString() + " / " + displayTotal.toString();
        
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        
        dc.drawText(
            dc.getWidth() / 2, 
            dc.getHeight() - (dc.getHeight() * 0.15), 
            Graphics.FONT_SYSTEM_XTINY, 
            progressText, 
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }
}