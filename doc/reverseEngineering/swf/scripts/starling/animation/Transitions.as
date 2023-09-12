package starling.animation {

import flash.utils.Dictionary;

import starling.errors.AbstractClassError;

public class Transitions {

    public static const LINEAR: String = "linear";

    public static const EASE_IN: String = "easeIn";

    public static const EASE_OUT: String = "easeOut";

    public static const EASE_IN_OUT: String = "easeInOut";

    public static const EASE_OUT_IN: String = "easeOutIn";

    public static const EASE_IN_BACK: String = "easeInBack";

    public static const EASE_OUT_BACK: String = "easeOutBack";

    public static const EASE_IN_OUT_BACK: String = "easeInOutBack";

    public static const EASE_OUT_IN_BACK: String = "easeOutInBack";

    public static const EASE_IN_ELASTIC: String = "easeInElastic";

    public static const EASE_OUT_ELASTIC: String = "easeOutElastic";

    public static const EASE_IN_OUT_ELASTIC: String = "easeInOutElastic";

    public static const EASE_OUT_IN_ELASTIC: String = "easeOutInElastic";

    public static const EASE_IN_BOUNCE: String = "easeInBounce";

    public static const EASE_OUT_BOUNCE: String = "easeOutBounce";

    public static const EASE_IN_OUT_BOUNCE: String = "easeInOutBounce";

    public static const EASE_OUT_IN_BOUNCE: String = "easeOutInBounce";

    private static var sTransitions: Dictionary;


    public function Transitions() {
        super();
        throw new AbstractClassError();
    }

    public static function getTransition(param1: String): Function {
        if (sTransitions == null) {
            registerDefaults();
        }
        return sTransitions[param1];
    }

    public static function register(param1: String, param2: Function): void {
        if (sTransitions == null) {
            registerDefaults();
        }
        sTransitions[param1] = param2;
    }

    private static function registerDefaults(): void {
        sTransitions = new Dictionary();
        register(LINEAR, linear);
        register(EASE_IN, easeIn);
        register(EASE_OUT, easeOut);
        register(EASE_IN_OUT, easeInOut);
        register(EASE_OUT_IN, easeOutIn);
        register(EASE_IN_BACK, easeInBack);
        register(EASE_OUT_BACK, easeOutBack);
        register(EASE_IN_OUT_BACK, easeInOutBack);
        register(EASE_OUT_IN_BACK, easeOutInBack);
        register(EASE_IN_ELASTIC, easeInElastic);
        register(EASE_OUT_ELASTIC, easeOutElastic);
        register(EASE_IN_OUT_ELASTIC, easeInOutElastic);
        register(EASE_OUT_IN_ELASTIC, easeOutInElastic);
        register(EASE_IN_BOUNCE, easeInBounce);
        register(EASE_OUT_BOUNCE, easeOutBounce);
        register(EASE_IN_OUT_BOUNCE, easeInOutBounce);
        register(EASE_OUT_IN_BOUNCE, easeOutInBounce);
    }

    protected static function linear(param1: Number): Number {
        return param1;
    }

    protected static function easeIn(param1: Number): Number {
        return param1 * param1 * param1;
    }

    protected static function easeOut(param1: Number): Number {
        var _loc2_: Number = param1 - 1;
        return _loc2_ * _loc2_ * _loc2_ + 1;
    }

    protected static function easeInOut(param1: Number): Number {
        return easeCombined(easeIn, easeOut, param1);
    }

    protected static function easeOutIn(param1: Number): Number {
        return easeCombined(easeOut, easeIn, param1);
    }

    protected static function easeInBack(param1: Number): Number {
        return Math.pow(param1, 2) * (2.70158 * param1 - 1.70158);
    }

    protected static function easeOutBack(param1: Number): Number {
        var _loc2_: Number = param1 - 1;
        return Math.pow(_loc2_, 2) * (2.70158 * _loc2_ + 1.70158) + 1;
    }

    protected static function easeInOutBack(param1: Number): Number {
        return easeCombined(easeInBack, easeOutBack, param1);
    }

    protected static function easeOutInBack(param1: Number): Number {
        return easeCombined(easeOutBack, easeInBack, param1);
    }

    protected static function easeInElastic(param1: Number): Number {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        if (param1 == 0 || param1 == 1) {
            return param1;
        }
        _loc2_ = 0.3;
        _loc3_ = _loc2_ / 4;
        _loc4_ = param1 - 1;
        return -1 * Math.pow(2, 10 * _loc4_) * Math.sin((_loc4_ - _loc3_) * 0 / _loc2_);
    }

    protected static function easeOutElastic(param1: Number): Number {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        if (param1 == 0 || param1 == 1) {
            return param1;
        }
        _loc2_ = 0.3;
        _loc3_ = _loc2_ / 4;
        return Math.pow(2, -10 * param1) * Math.sin((param1 - _loc3_) * 0 / _loc2_) + 1;
    }

    protected static function easeInOutElastic(param1: Number): Number {
        return easeCombined(easeInElastic, easeOutElastic, param1);
    }

    protected static function easeOutInElastic(param1: Number): Number {
        return easeCombined(easeOutElastic, easeInElastic, param1);
    }

    protected static function easeInBounce(param1: Number): Number {
        return 1 - easeOutBounce(1 - param1);
    }

    protected static function easeOutBounce(param1: Number): Number {
        var _loc4_: Number = NaN;
        if (param1 < 0.36363636363636365) {
            _loc4_ = 7.5625 * Math.pow(param1, 2);
        } else if (param1 < 0.7272727272727273) {
            param1 -= 0.5454545454545454;
            _loc4_ = 7.5625 * Math.pow(param1, 2) + 0.75;
        } else if (param1 < 0.9090909090909091) {
            param1 -= 0.8181818181818182;
            _loc4_ = 7.5625 * Math.pow(param1, 2) + 0.9375;
        } else {
            param1 -= 0.9545454545454546;
            _loc4_ = 7.5625 * Math.pow(param1, 2) + 0.984375;
        }
        return _loc4_;
    }

    protected static function easeInOutBounce(param1: Number): Number {
        return easeCombined(easeInBounce, easeOutBounce, param1);
    }

    protected static function easeOutInBounce(param1: Number): Number {
        return easeCombined(easeOutBounce, easeInBounce, param1);
    }

    protected static function easeCombined(param1: Function, param2: Function, param3: Number): Number {
        if (param3 < 0.5) {
            return 0.5 * param1(param3 * 2);
        }
        return 0.5 * param2((param3 - 0.5) * 2) + 0.5;
    }
}
}
