import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class NumberFactory extends WatchUi.PickerFactory {
    private var _start as Lang.Number;
    private var _stop as Lang.Number;
    private var _increment as Lang.Number;
    private var _format as Lang.String;

    function initialize(start as Lang.Number, stop as Lang.Number, increment as Lang.Number, options as { :format as Lang.String } or Null) {
        PickerFactory.initialize();
        _start = start;
        _stop = stop;
        _increment = increment;

        if (options != null && options.hasKey(:format)) {
            _format = options.get(:format) as Lang.String;
        } else {
            _format = "%d";
        }
    }

    function getSize() as Lang.Number {
        return (_stop - _start) / _increment + 1;
    }

    // Cambiado de Any a Lang.Object? para compatibilidad total
    function getValue(index as Lang.Number) as Lang.Object? {
        return (_start + (index * _increment)) as Lang.Object;
    }

    function getDrawable(index as Lang.Number, selected as Lang.Boolean) as WatchUi.Drawable? {
        var value = getValue(index);
        var text = "";
        
        if (value instanceof Lang.Number) {
            text = value.format(_format);
        } else if (value != null) {
            text = value.toString();
        }

        return new WatchUi.Text({
            :text => text,
            :color => Graphics.COLOR_WHITE,
            :font => Graphics.FONT_NUMBER_MEDIUM,
            :locX => WatchUi.LAYOUT_HALIGN_CENTER,
            :locY => WatchUi.LAYOUT_VALIGN_CENTER
        });
    }
}