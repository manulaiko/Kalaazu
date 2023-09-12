package net.bigpoint.darkorbit.fui.components.list.dropdownbox {

import flash.events.Event;

public class DropDownBoxEvent extends Event {

    public static const DROPPED_DOWN: String = "DROPPED_DOWN";

    public static const SELECTED_ENTRY_CHANGED: String = "SELECTED_ENTRY_CHANGED";


    private var _index: int;

    public function DropDownBoxEvent(param1: String, param2: int = -1) {
        super(param1);
        this._index = param2;
    }

    public function get index(): int {
        return this._index;
    }
}
}
