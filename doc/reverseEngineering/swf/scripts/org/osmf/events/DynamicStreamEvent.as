package org.osmf.events {

import flash.events.Event;

public class DynamicStreamEvent extends Event {

    public static const SWITCHING_CHANGE: String = "switchingChange";

    public static const NUM_DYNAMIC_STREAMS_CHANGE: String = "numDynamicStreamsChange";

    public static const AUTO_SWITCH_CHANGE: String = "autoSwitchChange";


    private var _switching: Boolean;

    private var _autoSwitch: Boolean;

    public function DynamicStreamEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: Boolean = false, param5: Boolean = false) {
        super(param1, param2, param3);
        this._switching = param4;
        this._autoSwitch = param5;
    }

    public function get switching(): Boolean {
        return this._switching;
    }

    public function get autoSwitch(): Boolean {
        return this._autoSwitch;
    }

    override public function clone(): Event {
        return new DynamicStreamEvent(type, bubbles, cancelable, this._switching, this._autoSwitch);
    }
}
}
