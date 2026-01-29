import Toybox.WatchUi;
import Toybox.Graphics;

class SleepPicker extends WatchUi.Picker {
    function initialize(titleText) {
        // Título del Picker
        var title = new WatchUi.Text({
            :text=>titleText,
            :locX=>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_TOP,
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_SMALL // Fuente estándar, no requiere Rez
        });

        var factory = new NumberFactory(0, 23, 1, {:format => "%02d"});
        var now = System.getClockTime();
        System.println("Hora actual segun getClockTime: "+ now.hour);

        Picker.initialize({
            :title=>title,
            :pattern=>[factory],
            :defaults=>[now.hour] 
        });
    }

    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        Picker.onUpdate(dc);
    }
}