package package_199 {

import flash.events.Event;

import package_294.class_1750;

public class class_2126 extends Event {

    public static const const_2608: String = "visiblityUpdated";

    public static const const_2488: String = "scenetransformChanged";

    public static const const_579: String = "sceneChanged";

    public static const const_1108: String = "positionChanged";

    public static const const_2014: String = "rotationChanged";

    public static const const_2083: String = "scaleChanged";


    public var object: class_1750;

    public function class_2126(param1: String, param2: class_1750) {
        super(param1);
        this.object = param2;
    }

    override public function clone(): Event {
        return new class_2126(type, this.object);
    }
}
}
