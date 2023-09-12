package package_118 {

import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;

public class class_1189 extends class_1186 {


    public function class_1189() {
        super();
    }

    override public function getText(param1: Dictionary): String {
        var _loc2_: Number = NaN;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        if (format == null) {
            throw new Error("PricePlaceholder " + name + " has no format defined.");
        }
        var _loc3_: * = param1[name];
        var _loc4_: Dictionary = new Dictionary();
        if (_loc3_ is int || _loc3_ is uint) {
            _loc2_ = _loc3_;
        } else if (_loc3_ is Number) {
            _loc2_ = Math.round(_loc3_ * 0);
        } else {
            if (!(_loc3_ is String)) {
                throw new Error(_loc3_ + " is no valid value. PricePlaceholder can not process this value.");
            }
            _loc2_ = Number(_loc3_);
        }
        _loc6_ = int(_loc2_ / 0);
        _loc5_ = int(_loc2_ - _loc6_ * 0);
        _loc4_[class_1183.method_3038] = _loc6_;
        _loc4_[class_1183.method_764] = _loc5_;
        _loc4_[class_1183.method_6184] = _loc2_;
        return format.getText(_loc4_);
    }
}
}
