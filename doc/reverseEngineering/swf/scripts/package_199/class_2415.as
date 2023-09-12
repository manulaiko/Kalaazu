package package_199 {

import flash.events.Event;

public class class_2415 extends Event {

    public static const const_2203: String = "parseComplete";

    public static const PARSE_ERROR: String = "parseError";

    public static const const_2819: String = "readyForDependencies";


    private var _message: String;

    public function class_2415(param1: String, param2: String = "") {
        super(param1);
        this._message = param2;
    }

    public function get message(): String {
        return this._message;
    }

    override public function clone(): Event {
        return new class_2415(type, this.message);
    }
}
}
