import Toybox.WatchUi;
import Toybox.Graphics;

class ReframeView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {
        var backgroundColor = Graphics.COLOR_BLACK; 
        dc.setColor(backgroundColor, backgroundColor);
        dc.clear();
        var textArea = new WatchUi.TextArea({
            :text => "Agrega tus mensajes a través de Garmin Connect",
            :color => Graphics.COLOR_WHITE,
            :font => Graphics.FONT_SYSTEM_MEDIUM,
            :locX => 25,
            :locY => 25,
            :width => dc.getWidth() - 50,
            :height => dc.getHeight() - 50,
            :justification => Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        });
        textArea.draw(dc);
    }
}