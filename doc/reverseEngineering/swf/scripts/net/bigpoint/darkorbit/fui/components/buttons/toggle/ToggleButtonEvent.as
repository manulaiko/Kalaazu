package net.bigpoint.darkorbit.fui.components.buttons.toggle {

import flash.events.Event;

public class ToggleButtonEvent extends Event {

    public static const EVENT_STATE_CHANGED: String = "stateChanged";


    private var _state: Boolean;

    public function ToggleButtonEvent(param1: Boolean) {
        super(EVENT_STATE_CHANGED, true, true);
        this._state = param1;
    }

    public function get state(): Boolean {
        return this._state;
    }
}
}
