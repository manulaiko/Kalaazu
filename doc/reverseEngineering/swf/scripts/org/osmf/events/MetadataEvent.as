package org.osmf.events {

import flash.events.Event;

public class MetadataEvent extends Event {

    public static const VALUE_ADD: String = "valueAdd";

    public static const VALUE_REMOVE: String = "valueRemove";

    public static const VALUE_CHANGE: String = "valueChange";


    private var _key: String;

    private var _value;

    private var _oldValue;

    public function MetadataEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: String = null, param5: * = null, param6: * = null) {
        super(param1, param2, param3);
        this._key = param4;
        this._value = param5;
        this._oldValue = param6;
    }

    public function get key(): String {
        return this._key;
    }

    public function get value(): * {
        return this._value;
    }

    public function get oldValue(): * {
        return this._oldValue;
    }

    override public function clone(): Event {
        return new MetadataEvent(type, bubbles, cancelable, this._key, this._value, this._oldValue);
    }
}
}
