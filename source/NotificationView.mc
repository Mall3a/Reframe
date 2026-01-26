import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Application.Storage;

class NotificationView extends WatchUi.View {
    private var _message;
    private var _index;
    private var _total;

    function initialize(message, index, total) {
        View.initialize();
        _message = message;
        _index = index;
        _total = total;
    }

    function onUpdate(dc) {
        // Lógica de Colores PNL según el índice guardado
        var lastIndex = Storage.getValue("last_msg_index");
        if (lastIndex == null) { lastIndex = 0; }

        var backgroundColor = Graphics.COLOR_BLACK; 

        var ratio = (_index.toFloat() / _total);

        if (ratio < 0.25) {
            backgroundColor = 0x000055;
        } else if (ratio < 0.5) {
            backgroundColor = 0x003300;
        } else if (ratio < 0.75) {
            backgroundColor = 0x330066;
        } else {
            backgroundColor = 0x552200;
        }

        dc.setColor(backgroundColor, backgroundColor);
        dc.clear();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

        var font = Graphics.FONT_SYSTEM_MEDIUM;
        if (_message.length() > 70) {
            font = Graphics.FONT_SYSTEM_SMALL;
        }

        var textArea = new WatchUi.TextArea({
            :text => _message,
            :color => Graphics.COLOR_WHITE,
            :font => font,
            :locX => 25,
            :locY => 25,
            :width => dc.getWidth() - 50,
            :height => dc.getHeight() - 50,
            :justification => Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        });
      
        textArea.draw(dc);

        // Contador (X / 37)
        var progressText = (lastIndex).toString() + " / " + _total;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2, 
            dc.getHeight() - 35,
            Graphics.FONT_SYSTEM_XTINY, 
            progressText, 
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }
}