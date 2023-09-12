package package_18 {

import flash.events.Event;

public class class_2562 extends Event {

    public static const ASSET_LOADED: String = "ASSET_LOADED";


    public var resKey: String;

    public function class_2562(param1: String, param2: String = null, param3: Boolean = false, param4: Boolean = false) {
        super(param1, param3, param4);
        this.resKey = param2;
    }
}
}
