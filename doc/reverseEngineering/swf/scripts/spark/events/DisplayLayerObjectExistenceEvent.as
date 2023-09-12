package spark.events {

import flash.display.DisplayObject;
import flash.events.Event;

import mx.core.mx_internal;

public class DisplayLayerObjectExistenceEvent extends Event {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static const OBJECT_ADD: String = "objectAdd";

    public static const OBJECT_REMOVE: String = "objectRemove";


    public var index: int;

    public var object: DisplayObject;

    public function DisplayLayerObjectExistenceEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: DisplayObject = null, param5: int = -1) {
        super(param1, param2, param3);
        this.object = param4;
        this.index = param5;
    }

    override public function clone(): Event {
        return new DisplayLayerObjectExistenceEvent(type, bubbles, cancelable, this.object, this.index);
    }
}
}
