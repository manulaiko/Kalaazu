package package_345 {

import flash.events.Event;

public class class_1932 extends Event {

    public static const INVITATION_BEHAVIOR_TOGGLE: String = "INVITATION_BEHAVIOR_TOGGLE";


    private var _mode: int;

    public function class_1932(param1: String, param2: int, param3: Boolean = false, param4: Boolean = false) {
        this._mode = param2;
        super(param1, param3, param4);
    }

    public function get mode(): int {
        return this._mode;
    }
}
}
