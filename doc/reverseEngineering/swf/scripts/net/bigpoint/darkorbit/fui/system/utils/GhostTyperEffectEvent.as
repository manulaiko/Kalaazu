package net.bigpoint.darkorbit.fui.system.utils {

import flash.events.Event;

public class GhostTyperEffectEvent extends Event {

    public static const UPDATE_EVENT: String = "GhostTyperEffectEvent.updateEvent";


    private var _text: String = "";

    public function GhostTyperEffectEvent(param1: String, param2: String) {
        super(param1);
        this._text = param2;
    }

    public function get text(): String {
        return this._text;
    }
}
}
