package org.osmf.events {

import flash.events.Event;

public class TimeEvent extends Event {

    public static const CURRENT_TIME_CHANGE: String = "currentTimeChange";

    public static const DURATION_CHANGE: String = "durationChange";

    public static const COMPLETE: String = "complete";


    private var _time: Number;

    public function TimeEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: Number = NaN) {
        super(param1, param2, param3);
        this._time = param4;
    }

    public function get time(): Number {
        return this._time;
    }

    override public function clone(): Event {
        return new TimeEvent(type, bubbles, cancelable, this.time);
    }
}
}
