using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application;
using Toybox.Application.Storage;


class NotificationViewDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onBack() {
        System.println("onBack clicked");
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }

    function onDrag(dragEvent as WatchUi.DragEvent)  {
        System.println("onDrag: " + dragEvent);
        return true;  
    }

     function onSelect() {
        System.println("onSelect clicked with pushView");
        WatchUi.pushView(new SettingsMenu(), new SettingsMenuInputDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onFlick(flickEvent as WatchUi.FlickEvent)  {
        System.println("onFlick clicked");
        return true;
    }

    function onSettingsChanged() {
        // Esto refresca la pantalla si el usuario cambia algo en el móvil con la app abierta
        WatchUi.requestUpdate(); 
    }
}