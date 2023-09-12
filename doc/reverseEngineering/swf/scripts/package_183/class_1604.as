package package_183 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;

public class class_1604 extends Condition {


    private var var_3023: Array;

    private var var_2792: String = "";

    private var var_285: Array;

    private var var_755: String = "";

    private var var_1327: Array;

    private var var_3230: int;

    public function class_1604() {
        this.var_3023 = [];
        this.var_285 = [];
        this.var_1327 = [];
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        var _loc2_: Vector.<String> = param1;
        var _loc3_: int = int(_loc2_.shift());
        var _loc4_: Vector.<String> = _loc2_.splice(0, _loc3_);
        var _loc5_: int = int(_loc2_.shift());
        var _loc6_: Vector.<String> = _loc2_.splice(0, _loc5_);
        var _loc7_: int = parseInt(_loc2_.shift());
        var _loc8_: Vector.<String> = _loc2_.splice(0, _loc7_);
        var _loc9_: int = int(_loc2_.shift());
        var _loc10_: Vector.<String> = _loc2_.splice(0, _loc9_);
        var _loc11_: Array = class_126.instance.method_1221;
        var _loc12_: int = 0;
        while (_loc12_ < _loc4_.length) {
            this.var_285[_loc12_] = int(_loc4_[_loc12_]);
            if (_loc11_[this.var_285[_loc12_]] != null) {
                this.var_755 += ", " + _loc11_[this.var_285[_loc12_]];
            }
            _loc12_++;
        }
        this.var_755 = this.var_755.substring(2);
        var _loc13_: Array = class_126.instance.method_2919;
        var _loc14_: int = 0;
        while (_loc14_ < _loc6_.length) {
            this.var_3023[_loc14_] = int(_loc6_[_loc14_]);
            this.var_2792 += ", " + _loc13_[this.var_3023[_loc14_]];
            _loc14_++;
        }
        this.var_2792 = this.var_2792.substring(2);
        var _loc15_: * = "q2_condition_undefined";
        if (this.var_285.length == 0 && this.var_3023.length == 0 && this.var_1327.length == 0) {
            _loc15_ += "_any";
        } else {
            if (this.var_285.length > 0) {
                _loc15_ += "_ships";
            }
            if (this.var_3023.length > 0) {
                if (this.var_3023[0] == class_126.const_828) {
                    _loc15_ += "_enemyfactions";
                } else {
                    _loc15_ += "_factions";
                }
            }
            if (this.var_1327.length > 0) {
                _loc15_ += "_avatar";
            }
        }
        if (_target > 0) {
            var_106 = "/" + _target;
        }
        _loc15_ += "_" + class_126.instance.method_1595[_loc10_[0]];
        _description = class_88.getItem(_loc15_);
        _description = description.replace(/%types%/, this.var_755);
        _description = description.replace(/%faction%/, this.var_2792);
        if (this.var_285.length > 0) {
            var_3277 = method_6395(class_126.instance.method_758[this.var_285[0]] + "_icon.png");
        }
    }

    override public function get method_1303(): String {
        return String(_current);
    }
}
}
