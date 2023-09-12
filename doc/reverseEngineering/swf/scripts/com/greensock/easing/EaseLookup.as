package com.greensock.easing {

public class EaseLookup {

    private static var _lookup: Object;


    public function EaseLookup() {
        super();
    }

    public static function find(param1: String): Function {
        if (_lookup == null) {
            buildLookup();
        }
        return _lookup[param1.toLowerCase()];
    }

    private static function buildLookup(): void {
        _lookup = {};
        addInOut(Back, ["back"]);
        addInOut(Bounce, ["bounce"]);
        addInOut(Circ, ["circ", "circular"]);
        addInOut(Cubic, ["cubic"]);
        addInOut(Elastic, ["elastic"]);
        addInOut(Expo, ["expo", "exponential"]);
        addInOut(Linear, ["linear"]);
        addInOut(Quad, ["quad", "quadratic"]);
        addInOut(Quart, ["quart", "quartic"]);
        addInOut(Quint, ["quint", "quintic", "strong"]);
        addInOut(Sine, ["sine"]);
        _lookup["linear.easenone"] = _lookup["lineareasenone"] = Linear.easeNone;
    }

    private static function addInOut(param1: Class, param2: Array): void {
        var _loc3_: * = null;
        var _loc4_: int = param2.length;
        while (_loc4_-- > 0) {
            _loc3_ = param2[_loc4_].toLowerCase();
            _lookup[_loc3_ + ".easein"] = _lookup[_loc3_ + "easein"] = param1.easeIn;
            _lookup[_loc3_ + ".easeout"] = _lookup[_loc3_ + "easeout"] = param1.easeOut;
            _lookup[_loc3_ + ".easeinout"] = _lookup[_loc3_ + "easeinout"] = param1.easeInOut;
        }
    }
}
}
