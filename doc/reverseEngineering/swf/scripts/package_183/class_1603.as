package package_183 {

import com.bigpoint.utils.class_122;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;

public class class_1603 extends Condition {


    public function class_1603() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc11_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: int = 0;
        var _loc17_: int = 0;
        var _loc2_: * = "q2_condition_undefined";
        var _loc3_: class_126 = class_126.getInstance();
        _loc4_ = param1;
        _loc5_ = int(_loc4_.shift());
        var _loc6_: int = int(_loc4_.shift());
        switch (_loc6_) {
            case 1:
                _loc7_ = int(_loc4_.shift());
                _loc14_ = _loc4_.splice(0, _loc7_);
                break;
            case 2:
                _loc8_ = int(_loc4_.shift());
                _loc15_ = _loc4_.splice(0, _loc8_);
        }
        _loc9_ = "";
        if (_loc5_ > 0) {
            _loc9_ = _loc3_.method_1789[_loc5_];
            _loc2_ += "_npc";
        } else {
            _loc2_ += "_anynpc";
        }
        var _loc10_: * = [];
        _loc11_ = "";
        if (_loc7_ > 0) {
            _loc2_ += "_laser";
            for each(_loc16_ in _loc14_) {
                _loc10_.push(_loc3_.var_680[_loc16_]);
            }
            _loc11_ = _loc10_.join(", ");
        }
        var _loc12_: * = [];
        var _loc13_: String = "";
        if (_loc8_ > 0) {
            _loc2_ += "_rocket";
            for each(_loc17_ in _loc15_) {
                _loc12_.push(_loc3_.var_2195[_loc17_]);
            }
            _loc13_ = _loc12_.join(", ");
        }
        var_106 = "/" + class_122.round(_target);
        _description = class_88.getItem(_loc2_);
        _description = _description.replace(/%npc%/, _loc9_);
        _description = _description.replace(/%laser%/, _loc11_);
        _description = _description.replace(/%rocket%/, _loc13_);
        if (_loc5_ > 0) {
            var_3277 = method_6395(_loc3_.method_3582[_loc5_] + "_icon.png");
        }
    }

    override public function get method_1303(): String {
        return String(_current);
    }
}
}
