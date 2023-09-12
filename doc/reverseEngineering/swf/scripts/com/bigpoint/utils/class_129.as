package com.bigpoint.utils {

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_140.class_967;

public class class_129 {

    private static var var_2714: String = ":";


    public function class_129() {
        super();
    }

    public static function method_1101(param1: int, param2: Boolean = true): String {
        var _loc3_: * = "";
        var _loc4_: int;
        if ((_loc4_ = Math.floor(param1 / 3600)) > 0) {
            _loc3_ += _loc4_ + var_2714;
        }
        param1 -= _loc4_ * 3600;
        var _loc5_: int = Math.floor(param1 / 60);
        if (param2) {
            if (_loc4_ > 0 && _loc5_ < 10) {
                _loc3_ += "0";
            }
            _loc3_ += _loc5_ + var_2714;
        }
        param1 -= _loc5_ * 60;
        if (param1 < 10) {
            _loc3_ += "0";
        }
        return _loc3_ + String(param1);
    }

    public static function method_156(param1: int, param2: Boolean = true, param3: Boolean = false): class_967 {
        var _loc9_: int = 0;
        var _loc4_: int = param1 % 60;
        var _loc5_: int = param1 / 60;
        var _loc6_: int = Math.floor(_loc5_ / 1440);
        if (param3 && _loc6_ > 0) {
            _loc5_ -= _loc6_ * 1440;
        }
        if (param2) {
            _loc9_ = Math.floor(_loc5_ / 60);
            _loc5_ -= _loc9_ * 60;
        }
        var _loc7_: int = _loc5_;
        return new class_967(_loc6_, _loc9_, _loc7_, _loc4_);
    }

    public static function method_3157(param1: int, param2: Boolean = false): String {
        var _loc3_: * = "";
        var _loc4_: int = Math.floor(param1 / 1440);
        if (param2 && _loc4_ > 0) {
            param1 -= _loc4_ * 1440;
            _loc3_ += class_88.getItem("abbreviation_days").replace("%VALUE%", _loc4_);
        }
        var _loc5_: int;
        if ((_loc5_ = Math.floor(param1 / 60)) > 0) {
            if (_loc3_.length > 0) {
                _loc3_ += " ";
            }
            _loc3_ += class_88.getItem("abbreviation_hours").replace("%VALUE%", _loc5_);
        }
        var _loc6_: int;
        if ((_loc6_ = param1 % 60) >= 0) {
            if (_loc3_.length > 0) {
                _loc3_ += " ";
            }
            _loc3_ += class_88.getItem("abbreviation_minutes").replace("%VALUE%", _loc6_);
        }
        return _loc3_;
    }
}
}
