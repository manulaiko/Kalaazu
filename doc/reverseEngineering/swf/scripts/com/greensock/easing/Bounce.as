package com.greensock.easing {

public class Bounce {


    public function Bounce() {
        super();
    }

    public static function easeOut(param1: Number, param2: Number, param3: Number, param4: Number): Number {
        var _loc5_: * = param1 / param4;
        param1 /= param4;
        if (_loc5_ < 0.36363636363636365) {
            return param3 * (7.5625 * param1 * param1) + param2;
        }
        if (param1 < 0.7272727272727273) {
            _loc5_ = param1 - 0.5454545454545454;
            param1 -= 0.5454545454545454;
            return param3 * (7.5625 * _loc5_ * param1 + 0.75) + param2;
        }
        if (param1 < 0.9090909090909091) {
            _loc5_ = param1 - 0.8181818181818182;
            param1 -= 0.8181818181818182;
            return param3 * (7.5625 * _loc5_ * param1 + 0.9375) + param2;
        }
        _loc5_ = param1 - 0.9545454545454546;
        param1 -= 0.9545454545454546;
        return param3 * (7.5625 * _loc5_ * param1 + 0.984375) + param2;
    }

    public static function easeIn(param1: Number, param2: Number, param3: Number, param4: Number): Number {
        return param3 - easeOut(param4 - param1, 0, param3, param4) + param2;
    }

    public static function easeInOut(param1: Number, param2: Number, param3: Number, param4: Number): Number {
        if (param1 < param4 * 0.5) {
            return easeIn(param1 * 2, 0, param3, param4) * 0.5 + param2;
        }
        return easeOut(param1 * 2 - param4, 0, param3, param4) * 0.5 + param3 * 0.5 + param2;
    }
}
}
