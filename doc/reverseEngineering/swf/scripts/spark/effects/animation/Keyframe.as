package spark.effects.animation {

import mx.core.mx_internal;

import spark.effects.easing.IEaser;
import spark.effects.easing.Linear;

public class Keyframe {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var linearEaser: IEaser = new Linear();


    public var value: Object;

    public var time: Number;

    mx_internal var timeFraction: Number;

    public var easer: IEaser;

    public var valueBy: Object;

    public function Keyframe(param1: Number = NaN, param2: Object = null, param3: Object = null) {
        this.easer = linearEaser;
        super();
        this.value = param2;
        this.time = param1;
        this.valueBy = param3;
    }

    public function clone(): Keyframe {
        var _loc1_: Keyframe = new Keyframe(this.time, this.value, this.valueBy);
        _loc1_.easer = this.easer;
        _loc1_.mx_internal::timeFraction = this.mx_internal::timeFraction;
        return _loc1_;
    }
}
}
