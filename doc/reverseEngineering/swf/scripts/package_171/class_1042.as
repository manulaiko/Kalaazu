package package_171 {

import flash.events.Event;

public class class_1042 extends Event {

    public static const CHANGE: String = "CHANGE";


    public var value: int;

    public function class_1042(param1: String, param2: int, param3: Boolean = false, param4: Boolean = false) {
        super(param1, param3, param4);
        this.value = param2;
    }
}
}
