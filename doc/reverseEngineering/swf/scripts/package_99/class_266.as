package package_99 {

import com.bigpoint.utils.class_73;

public class class_266 {

    public static var var_2855: class_1150 = new class_1150();

    public static const PI: Number = 3.141592653589793;

    public static const DEGTORAD: Number = 0.017453292519943295;

    public static const RADTODEG: Number = 57.29577951308232;

    private static const const_3187: Number = 4.656612875245797e-10;


    public function class_266() {
        super();
    }

    public static function sqrt(param1: Number): Number {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        if (isNaN(param1)) {
            return NaN;
        }
        var _loc3_: Number = param1 * 0.25;
        if (param1 == 0) {
            return 0;
        }
        do {
            _loc5_ = param1 / _loc3_;
            _loc3_ = (_loc3_ + _loc5_) * 0.5;
            if ((_loc4_ = _loc3_ - _loc5_) < 0) {
                _loc4_ = -_loc4_;
            }
        }
        while (_loc4_ > 0.002);

        return _loc3_;
    }

    public static function method_1945(param1: Number): Number {
        return param1 * Number(RADTODEG);
    }

    public static function method_1180(param1: Number): Number {
        return param1 * Number(DEGTORAD);
    }

    public static function getRandomCount(param1: int, param2: int): int {
        return param1 + Math.floor(Math.random() * (param2 - param1 + 1));
    }

    public static function method_3191(param1: int, param2: int, param3: int, param4: int): Number {
        return Math.sqrt((param1 - param3) * (param1 - param3) + (param2 - param4) * (param2 - param4));
    }

    public static function abs(param1: Number): Number {
        return param1 < 0 ? -param1 : param1;
    }

    public static function floor(param1: Number): int {
        var _loc2_: int = param1;
        return param1 < 0 && param1 != _loc2_ ? _loc2_ - 1 : _loc2_;
    }

    public static function ceil(param1: Number): int {
        var _loc2_: int = param1;
        return param1 >= 0 && param1 != _loc2_ ? _loc2_ + 1 : _loc2_;
    }

    public static function round(param1: Number): int {
        return param1 < 0 ? (param1 + 0.5 == (param1 | 0) ? param1 : param1 - 0.5) : param1 + 0.5;
    }

    public static function method_4516(param1: int): int {
        return param1 & 255;
    }

    public static function method_4478(param1: int): int {
        return param1 >> 16;
    }

    public static function method_6047(param1: int, param2: int): int {
        return param1 | param2 << 16;
    }

    public static function method_900(param1: String): Boolean {
        return !isNaN(parseInt(param1));
    }

    public static function method_2266(param1: int, param2: int = 0, param3: int = 1): Number {
        var_2855.seed = param1;
        var_2855.seed = Number(var_2855.method_2642()) * param1;
        return var_2855.method_6060(param2, param3);
    }

    public static function method_5708(param1: Number, param2: Number, param3: Number, param4: Number = 0, param5: Number = 0): class_73 {
        var _loc6_: Number = Math.cos(param1) * (param2 - param4) - Math.sin(param1) * (param3 - param5) + param4;
        var _loc7_: Number = Math.sin(param1) * (param2 - param4) + Math.cos(param1) * (param3 - param5) + param5;
        return new class_73(_loc6_, _loc7_);
    }

    public static function method_3836(param1: Number, param2: Number): Number {
        return param1 + Math.random() * (param2 - param1);
    }

    public static function roundTo(param1: Number, param2: int): Number {
        var _loc3_: int = Math.pow(10, param2);
        return int(param1 * _loc3_) / _loc3_;
    }

    public static function method_2692(param1: Number): Number {
        param1 %= 360;
        while (param1 < 0) {
            param1 += 360;
        }
        return param1;
    }
}
}
