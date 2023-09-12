package package_183 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;

public class class_1641 extends Condition {


    public function class_1641() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: * = null;
        _loc3_ = [];
        _loc4_ = "";
        var _loc5_: Vector.<String> = param1;
        _loc2_ = parseInt(_loc5_.shift());
        var _loc6_: Array = class_126.instance.method_1221;
        var _loc7_: int = 0;
        while (_loc7_ < _loc5_.length) {
            _loc3_[_loc7_] = parseInt(_loc5_[_loc7_]);
            if (_loc6_[_loc3_[_loc7_]] != null) {
                _loc4_ += ", " + _loc6_[_loc3_[_loc7_]];
            }
            _loc7_++;
        }
        _loc4_ = _loc4_.substring(2);
        var _loc8_: * = "q2_condition_undefined";
        if (_loc4_.length > 0) {
            _loc8_ += "_ship";
        } else {
            _loc8_ += "_any";
        }
        if (_loc2_ > 0) {
            _loc8_ += "_faction";
        } else {
            _loc8_ += "_enemyfaction";
        }
        if (_target == 0) {
            _loc8_ += "_challenge";
        } else {
            var_106 = "/" + _target;
        }
        _description = class_88.getItem(_loc8_);
        _description = description.replace(/%ship%/, _loc4_);
        _description = description.replace(/%faction%/, class_126.instance.method_2919[_loc2_]);
        if (_loc3_.length > 0) {
            var_3277 = method_6395(class_126.instance.method_758[_loc3_[0]] + "_icon.png");
        }
    }

    override public function get method_1303(): String {
        return String(_current);
    }
}
}
