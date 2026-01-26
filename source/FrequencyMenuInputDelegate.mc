using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application.Storage;

class FrequencyMenuInputDelegate extends WatchUi.MenuInputDelegate {
    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        System.println("Frecuencia seleccionada: " + item);

        var minutes;
     
        if (item == :min5) {
            minutes = 5;
        } else if (item == :min15) {
            minutes = 15;
        } else if (item == :min30) {
            minutes = 30;   
        } else if (item == :min60) {
            minutes = 60;
        } else if (item == :min120) {
            minutes = 120;
        } else {
            minutes = 180;
        }
        Storage.setValue("frequency", minutes);
        System.println("Frecuencia establecida: " + minutes);
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}