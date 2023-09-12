package com.greensock.easing {

public class Quart {

    public static const power: uint = 3;


    public function Quart() {
        super();
    }

    public static function easeIn(param1: Number, param2: Number, param3: Number, param4: Number): Number {
        var _loc5_: * = param1 / param4;
        param1 /= param4;
        return param3 * _loc5_ * param1 * param1 * param1 + param2;
    }

    public static function easeOut(param1: Number, param2: Number, param3: Number, param4: Number): Number {
        return -param3 * ((param1 = param1 / param4 - 1) * param1 * param1 * param1 - 1) + param2;
    }

    public static function easeInOut(param1: Number, param2: Number, param3: Number, param4: Number): Number {
        var _loc5_: * = param1 / (param4 * 0.5);
        param1 /= param4 * 0.5;
        if (_loc5_ < 1) {
            return param3 * 0.5 * param1 * param1 * param1 * param1 + param2;
        }
        _loc5_ = param1 - 2;
        param1 -= 2;
        return -param3 * 0.5 * (_loc5_ * param1 * param1 * param1 - 2) + param2;
    }
}
}
