package org.osmf.events {

import flash.events.Event;

public class BufferEvent extends Event {

    public static const BUFFERING_CHANGE: String = "bufferingChange";

    public static const BUFFER_TIME_CHANGE: String = "bufferTimeChange";


    private var _buffering: Boolean;

    private var _bufferTime: Number;

    public function BufferEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: Boolean = false, param5: Number = NaN) {
        super(param1, param2, param3);
        this._buffering = param4;
        this._bufferTime = param5;
    }

    public function get buffering(): Boolean {
        return this._buffering;
    }

    public function get bufferTime(): Number {
        return this._bufferTime;
    }

    override public function clone(): Event {
        return new BufferEvent(type, bubbles, cancelable, this._buffering, this._bufferTime);
    }
}
}
