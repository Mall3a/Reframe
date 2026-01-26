using Toybox.WatchUi;
using Toybox.Application.Storage;

class FrequencyMenu extends WatchUi.Menu {

    function initialize() {
        Menu.initialize();
        addItem("Cada 5 minutos", :min5);
        addItem("Cada 15 minutos", :min15);
        addItem("Cada 30 minutos", :min30);
        addItem("Cada 1 hora", :min60);
        addItem("Cada 2 horas", :min120);
        addItem("Cada 3 horas", :min180);
    }

    function onSelect(item) {
        return true;
    }
}