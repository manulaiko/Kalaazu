package spark.events {

import flash.events.Event;

import mx.core.mx_internal;

public class DropDownEvent extends Event {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static const CLOSE: String = "close";

    public static const OPEN: String = "open";


    public var triggerEvent: Event;

    public function DropDownEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: Event = null) {
        super(param1, param2, param3);
        this.triggerEvent = param4;
    }

    override public function clone(): Event {
        return new DropDownEvent(type, bubbles, cancelable, this.triggerEvent);
    }
}
}
