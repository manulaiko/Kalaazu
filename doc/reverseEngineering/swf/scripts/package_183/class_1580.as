package package_183 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;

public class class_1580 extends Condition {


    private var var_2671: int;

    private var var_1397: Array;

    private var var_3472: String = "";

    private var var_1933: int;

    private var var_3230: int;

    public function class_1580() {
        this.var_1397 = [];
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        var _loc2_: Vector.<String> = param1;
        this.var_2671 = int(_loc2_.shift());
        var _loc3_: Vector.<String> = _loc2_.splice(0, this.var_2671);
        this.var_1933 = int(_loc2_.shift());
        this.var_3230 = int(_loc2_.shift());
        var _loc4_: Array = class_126.instance.method_1789;
        var _loc5_: int = 0;
        while (_loc5_ < _loc3_.length) {
            this.var_1397[_loc5_] = int(_loc3_[_loc5_]);
            if (_loc4_[this.var_1397[_loc5_]] != null) {
                this.var_3472 += ", " + _loc4_[this.var_1397[_loc5_]];
            }
            _loc5_++;
        }
        this.var_3472 = this.var_3472.substring(2);
        var _loc6_: * = "q2_condition_undefined";
        if (this.var_2671 > 0) {
            _loc6_ += "_spec";
        }
        _loc6_ += "_" + class_126.instance.method_1595[this.var_3230];
        if (_target > 0) {
            var_106 = "/" + _target;
        }
        _description = class_88.getItem(_loc6_);
        _description = description.replace(/%npcs%/, this.var_3472);
        if (this.var_2671 > 0) {
            var_3277 = method_6395(class_126.instance.method_3582[this.var_1397[0]] + "_icon.png");
        }
    }

    override public function get method_1303(): String {
        return String(_current);
    }
}
}
