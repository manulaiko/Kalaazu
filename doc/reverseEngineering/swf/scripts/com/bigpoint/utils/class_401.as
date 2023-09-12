package com.bigpoint.utils {

import mx.utils.StringUtil;

import net.bigpoint.as3toolbox.bplocale.class_88;

public class class_401 {


    public var var_245: Array;

    public function class_401() {
        this.var_245 = [];
        super();
    }

    public static function method_26(param1: String): class_401 {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc8_: int = 0;
        var _loc2_: class_401 = new class_401();
        param1 = StringUtil.trim(param1);
        if (param1.charAt(0) == "[") {
            param1 = param1.substring(1, param1.length - 1);
        }
        if (param1.charAt(param1.length - 1) == "]") {
            param1.substring(0, param1.length - 2);
        }
        if (param1.charAt(0) == "{") {
            param1 = param1.substring(1, param1.length - 1);
        }
        if (param1.charAt(param1.length - 1) == "}") {
            param1.substring(0, param1.length - 2);
        }
        if (param1.indexOf("},{") > 0) {
            _loc3_ = param1.split("},{");
        } else {
            _loc3_ = [param1];
        }
        var _loc7_: int = 0;
        while (_loc7_ < _loc3_.length) {
            _loc4_ = new class_1488();
            _loc5_ = (_loc3_[_loc7_] as String).split(",");
            _loc8_ = 0;
            while (_loc8_ < _loc5_.length) {
                (_loc6_ = (_loc5_[_loc8_] as String).split(":"))[0] = StringUtil.trim(_loc6_[0]);
                _loc6_[1] = StringUtil.trim(_loc6_[1]);
                switch (_loc6_[0]) {
                    case "w":
                        _loc4_.wildcard = _loc6_[1];
                        break;
                    case "t":
                        _loc4_.type = int(_loc6_[1]);
                        break;
                    case "v":
                        _loc4_.value = _loc6_[1];
                        break;
                    case "p":
                        _loc4_.precision = int(_loc6_[1]);
                        break;
                }
                _loc8_++;
            }
            _loc2_.var_245.push(_loc4_);
            _loc7_++;
        }
        return _loc2_;
    }

    public function replace(param1: String): String {
        var _loc3_: * = null;
        var _loc2_: int = 0;
        while (_loc2_ < this.var_245.length) {
            _loc3_ = this.var_245[_loc2_];
            switch (_loc3_.type) {
                case class_1488.const_2305:
                    param1 = param1.replace(_loc3_.wildcard, _loc3_.value);
                    break;
                case class_1488.const_1153:
                    param1 = param1.replace(_loc3_.wildcard, class_122.round(int(_loc3_.value), _loc3_.precision));
                    break;
                case class_1488.const_312:
                    param1 = param1.replace(_loc3_.wildcard, class_88.getItem(_loc3_.value));
                    break;
                case class_1488.const_1968:
                    param1 = param1.replace(_loc3_.wildcard, class_129.method_1101(int(_loc3_.value)));
                    break;
            }
            _loc2_++;
        }
        return param1;
    }
}
}
