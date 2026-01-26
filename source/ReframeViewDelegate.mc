using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application;
using Toybox.Application.Storage;

class ReframeViewDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        System.println("onBack clicked");
        return true;
    }

    function onDrag(dragEvent as WatchUi.DragEvent)  {
        System.println("onDrag: " + dragEvent);
        return true;  
    }

    function onSelect() {
        System.println("onSelect clicked");
        return true;
    }

    function onFlick(flickEvent as WatchUi.FlickEvent)  {
        System.println("onFlick clicked");
        return true;
    }
}