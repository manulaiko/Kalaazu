package package_183 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;

public class class_1584 extends Condition {


    private var var_2269: Array;

    private var var_209: String = "";

    private var var_2634: Array;

    private var var_622: String = "";

    private var var_159: Array;

    public function class_1584() {
        this.var_2269 = [];
        this.var_2634 = [];
        this.var_159 = [];
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        var _loc2_: Vector.<String> = param1;
        var _loc3_: int = parseInt(_loc2_.shift());
        var _loc4_: Vector.<String> = _loc2_.splice(0, _loc3_);
        var _loc5_: int = parseInt(_loc2_.shift());
        var _loc6_: Vector.<String> = _loc2_.splice(0, _loc5_);
        var _loc7_: Array = class_126.instance.method_1221;
        var _loc8_: int = 0;
        while (_loc8_ < _loc4_.length) {
            this.var_2634[_loc8_] = parseInt(_loc4_[_loc8_]);
            if (_loc7_[this.var_2634[_loc8_]] != null) {
                this.var_622 += ", " + _loc7_[this.var_2634[_loc8_]];
            }
            _loc8_++;
        }
        this.var_622 = this.var_622.substring(2);
        var _loc9_: Array = class_126.instance.method_2919;
        var _loc10_: int = 0;
        while (_loc10_ < _loc6_.length) {
            this.var_2269[_loc10_] = parseInt(_loc6_[_loc10_]);
            this.var_209 += ", " + _loc9_[this.var_2269[_loc10_]];
            _loc10_++;
        }
        this.var_209 = this.var_209.substring(2);
        var _loc11_: * = "q2_condition_undefined";
        if (this.var_2634.length > 0) {
            _loc11_ += "_ship";
        }
        if (this.var_2269.length > 0) {
            _loc11_ += "_faction";
        }
        if (this.var_159.length > 0) {
            _loc11_ += "_avatar";
        }
        if (_target == 0) {
            _loc11_ += "_challenge";
        } else {
            var_106 = "/" + _target;
        }
        _description = class_88.getItem(_loc11_);
        _description = description.replace(/%types%/, this.var_622);
        _description = description.replace(/%faction%/, this.var_209);
        if (this.var_2634.length > 0) {
            var_3277 = method_6395(class_126.instance.method_758[this.var_2634[0]] + "_icon.png");
        }
    }

    override public function get method_1303(): String {
        return String(_current);
    }
}
}
