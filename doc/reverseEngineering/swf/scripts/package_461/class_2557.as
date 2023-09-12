package package_461 {

import flash.events.Event;

import package_459.class_2551;

public class class_2557 extends Event {

    public static var var_1341: String = "particleCreated";

    public static var var_1584: String = "particleDead";

    public static var var_2230: String = "particleAdded";

    public static var var_1581: String = "particlesCollision";

    public static var var_3690: String = "zoneCollision";

    public static var var_2560: String = "boundingBoxCollision";


    public var particle: class_2551;

    public var var_716;

    public function class_2557(param1: String, param2: class_2551 = null, param3: Boolean = false, param4: Boolean = false) {
        super(param1, param3, param4);
        this.particle = param2;
    }

    override public function clone(): Event {
        var _loc1_: class_2557 = new class_2557(type, this.particle, bubbles, cancelable);
        _loc1_.var_716 = this.var_716;
        return _loc1_;
    }
}
}
