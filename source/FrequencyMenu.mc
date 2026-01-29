import Toybox.WatchUi;

class FrequencyMenu extends WatchUi.Menu2 {

    function initialize() {
        // Le damos un título al menú
        Menu2.initialize({:title=>"Frecuencia"});

        // El tercer parámetro es el ID (aquí guardamos los minutos directamente)
        Menu2.addItem(new WatchUi.MenuItem("Cada 5 minutos", null, 5, {}));
        Menu2.addItem(new WatchUi.MenuItem("Cada 15 minutos", null, 15, {}));
        Menu2.addItem(new WatchUi.MenuItem("Cada 30 minutos", null, 30, {}));
        Menu2.addItem(new WatchUi.MenuItem("Cada 1 hora", null, 60, {}));
        Menu2.addItem(new WatchUi.MenuItem("Cada 2 horas", null, 120, {}));
        Menu2.addItem(new WatchUi.MenuItem("Cada 3 horas", null, 180, {}));
    }
}