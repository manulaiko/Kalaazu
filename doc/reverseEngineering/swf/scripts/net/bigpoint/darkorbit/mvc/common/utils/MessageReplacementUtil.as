package net.bigpoint.darkorbit.mvc.common.utils {

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_38.class_943;

public class MessageReplacementUtil {


    public function MessageReplacementUtil() {
        super();
    }

    public static function repaceAll(param1: String, param2: Vector.<class_943>): String {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc3_: int = param2.length;
        var _loc6_: int = 0;
        while (_loc6_ < _loc3_) {
            _loc4_ = param2[_loc6_];
            _loc5_ = new RegExp(_loc4_.var_2148);
            param1 = param1.replace(_loc5_, _loc4_.value);
            _loc6_++;
        }
        return param1;
    }

    public static function repaceAllWithTextKey(param1: String, param2: Vector.<class_943>): String {
        return repaceAll(class_88.getItem(param1), param2);
    }
}
}
