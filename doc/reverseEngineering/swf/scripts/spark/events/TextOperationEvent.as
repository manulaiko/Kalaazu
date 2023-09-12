package spark.events {

import flash.events.Event;

import flashx.textLayout.operations.FlowOperation;

import mx.core.mx_internal;

public class TextOperationEvent extends Event {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static const CHANGING: String = "changing";

    public static const CHANGE: String = "change";


    public var operation: FlowOperation;

    public function TextOperationEvent(param1: String, param2: Boolean = false, param3: Boolean = true, param4: FlowOperation = null) {
        super(param1, param2, param3);
        this.operation = param4;
    }

    override public function clone(): Event {
        return new TextOperationEvent(type, bubbles, cancelable, this.operation);
    }
}
}
