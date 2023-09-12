package package_297 {

import flash.geom.Vector3D;

public final class class_2157 {

    public static const PI: Number = 3.141592653589793;

    public static const const_2237: Number = 6.283185307179586;

    public static const E: Number = 2.718281828459045;

    public static const const_2849: Number = 0.017453292519943295;

    public static const const_1309: Number = 57.29577951308232;


    public function class_2157() {
        super();
    }

    public static function method_3356(param1: Number, param2: Number): Number {
        return param1 == param2 ? 0 : param1 + method_1073(param1, param2);
    }

    public static function method_2166(param1: Number, param2: Number): Number {
        var _loc3_: Number = (param2 - param1) % 360;
        if (_loc3_ != _loc3_ % 180) {
            _loc3_ = _loc3_ < 0 ? _loc3_ + 360 : _loc3_ - 360;
        }
        return _loc3_;
    }

    public static function method_1073(param1: Number, param2: Number): Number {
        var _loc3_: Number = (param2 - param1) % Number(const_2237);
        if (_loc3_ != _loc3_ % Number(PI)) {
            _loc3_ = _loc3_ < 0 ? _loc3_ + const_2237 : _loc3_ - Number(const_2237);
        }
        return _loc3_;
    }

    public static function method_142(param1: Number, param2: Number): Number {
        return Number(method_1073(param1 * Number(const_2849), param2 * Number(const_2849))) * Number(const_1309);
    }

    public static function method_2709(param1: Number, param2: Number, param3: Number = 1, param4: Vector3D = null): Vector3D {
        if (param4 == null) {
            param4 = new Vector3D();
        }
        param4.setTo(param3 * Math.sin(param1 * Number(const_2849)) * Math.sin(param2 * Number(const_2849)), param3 * Math.sin(param1 * Number(const_2849)) * Math.cos(param2 * Number(const_2849)), param3 * Math.cos(param1 * Number(const_2849)));
        return param4;
    }

    public static function sin(param1: Number): Number {
        return Math.sin(param1);
    }

    public static function cos(param1: Number): Number {
        return Math.cos(param1);
    }

    public static function tan(param1: Number): Number {
        return Math.tan(param1);
    }

    public static function asin(param1: Number): Number {
        return Math.asin(param1);
    }

    public static function acos(param1: Number): Number {
        return Math.acos(param1);
    }

    public static function atan(param1: Number): Number {
        return Math.atan(param1);
    }

    public static function method_2241(param1: Number): Number {
        return 1 / Math.sin(param1);
    }

    public static function method_2406(param1: Number): Number {
        return 1 / Math.cos(param1);
    }

    public static function method_1721(param1: Number): Number {
        return 1 / Math.tan(param1);
    }

    public static function method_4875(param1: Number): Number {
        return Math.asin(1 / param1);
    }

    public static function method_5666(param1: Number): Number {
        return Math.acos(1 / param1);
    }

    public static function method_5264(param1: Number): Number {
        if (param1 != 0) {
            return Math.atan(1 / param1);
        }
        return Number(PI) / 2;
    }

    public static function log(param1: Number, param2: Number): Number {
        return Math.log(param2) / Math.log(param1);
    }

    public static function ln(param1: Number): Number {
        return Math.log(param1);
    }

    public static function sqrt(param1: Number): Number {
        return Math.sqrt(param1);
    }

    public static function root(param1: Number, param2: Number): Number {
        return Math.pow(param1, 1 / param2);
    }

    public static function pow(param1: Number, param2: Number): Number {
        return Math.pow(param1, param2);
    }

    public static function exp(param1: Number): Number {
        return Math.exp(param1);
    }

    public static function abs(param1: Number): Number {
        return Math.abs(param1);
    }

    public static function round(param1: Number): Number {
        return Math.round(param1);
    }

    public static function ceil(param1: Number): Number {
        return Math.ceil(param1);
    }

    public static function floor(param1: Number): Number {
        return Math.floor(param1);
    }

    public static function gcd(param1: uint, param2: uint): uint {
        var _loc3_: * = 0;
        while (param2 != 0) {
            _loc3_ = param2;
            param2 = param1 % param2;
            param1 = _loc3_;
        }
        return param1;
    }

    public static function method_5945(param1: uint, param2: uint): uint {
        return param1 / Number(gcd(param1, param2)) * param2;
    }

    public static function random(param1: Number = 0, param2: Number = 1): Number {
        return param1 + Math.random() * (param2 - param1);
    }

    public static function method_4894(param1: uint): uint {
        var _loc2_: * = 1;
        while (param1 > 0) {
            _loc2_ *= param1--;
        }
        return _loc2_;
    }

    public static function method_1624(param1: uint, param2: uint): uint {
        return Number(method_4894(param1)) / Number(method_4894(param1 - param2));
    }

    public static function method_3686(param1: uint, param2: uint): uint {
        return Number(method_1624(param1, param2)) / Number(method_4894(param2));
    }
}
}
