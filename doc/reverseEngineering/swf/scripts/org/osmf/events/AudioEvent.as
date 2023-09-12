package org.osmf.events {

import flash.events.Event;

public class AudioEvent extends Event {

    public static const VOLUME_CHANGE: String = "volumeChange";

    public static const MUTED_CHANGE: String = "mutedChange";

    public static const PAN_CHANGE: String = "panChange";


    private var _muted: Boolean;

    private var _volume: Number;

    private var _pan: Number;

    public function AudioEvent(param1: String, param2: Boolean, param3: Boolean, param4: Boolean = false, param5: Number = NaN, param6: Number = NaN) {
        super(param1, param2, param3);
        this._muted = param4;
        this._volume = param5;
        this._pan = param6;
    }

    public function get muted(): Boolean {
        return this._muted;
    }

    public function get volume(): Number {
        return this._volume;
    }

    public function get pan(): Number {
        return this._pan;
    }

    override public function clone(): Event {
        return new AudioEvent(type, bubbles, cancelable, this._muted, this._volume, this._pan);
    }
}
}
