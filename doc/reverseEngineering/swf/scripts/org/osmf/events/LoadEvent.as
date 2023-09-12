package org.osmf.events {

import flash.events.Event;

public class LoadEvent extends Event {

    public static const LOAD_STATE_CHANGE: String = "loadStateChange";

    public static const BYTES_LOADED_CHANGE: String = "bytesLoadedChange";

    public static const BYTES_TOTAL_CHANGE: String = "bytesTotalChange";


    private var _loadState: String;

    private var _bytes: Number;

    public function LoadEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: String = null, param5: Number = NaN) {
        super(param1, param2, param3);
        this._loadState = param4;
        this._bytes = param5;
    }

    override public function clone(): Event {
        return new LoadEvent(type, bubbles, cancelable, this.loadState, this.bytes);
    }

    public function get loadState(): String {
        return this._loadState;
    }

    public function get bytes(): Number {
        return this._bytes;
    }
}
}
