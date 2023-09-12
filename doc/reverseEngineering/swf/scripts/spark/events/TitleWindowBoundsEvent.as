package spark.events {

import flash.events.Event;
import flash.geom.Rectangle;

import mx.core.mx_internal;

public class TitleWindowBoundsEvent extends Event {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static const WINDOW_MOVE_START: String = "windowMoveStart";

    public static const WINDOW_MOVING: String = "windowMoving";

    public static const WINDOW_MOVE: String = "windowMove";

    public static const WINDOW_MOVE_END: String = "windowMoveEnd";


    public var beforeBounds: Rectangle;

    public var afterBounds: Rectangle;

    public function TitleWindowBoundsEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: Rectangle = null, param5: Rectangle = null) {
        super(param1, param2, param3);
        this.beforeBounds = param4;
        this.afterBounds = param5;
    }

    override public function clone(): Event {
        return new TitleWindowBoundsEvent(type, bubbles, cancelable, this.beforeBounds, this.afterBounds);
    }
}
}
