package fl.events {

import flash.events.Event;

public class DataChangeEvent extends Event {

    public static const PRE_DATA_CHANGE: String = "preDataChange";

    public static const DATA_CHANGE: String = "dataChange";


    protected var _items: Array;

    protected var _changeType: String;

    protected var _startIndex: uint;

    protected var _endIndex: uint;

    public function DataChangeEvent(param1: String, param2: String, param3: Array, param4: int = -1, param5: int = -1) {
        super(param1);
        _changeType = param2;
        _startIndex = param4;
        _items = param3;
        _endIndex = param5 == -1 ? _startIndex : param5;
    }

    public function get items(): Array {
        return _items;
    }

    public function get changeType(): String {
        return _changeType;
    }

    public function get startIndex(): uint {
        return _startIndex;
    }

    public function get endIndex(): uint {
        return _endIndex;
    }

    override public function toString(): String {
        return formatToString("DataChangeEvent", "type", "changeType", "startIndex", "endIndex", "bubbles", "cancelable");
    }

    override public function clone(): Event {
        return new DataChangeEvent(type, _changeType, _items, _startIndex, _endIndex);
    }
}
}
