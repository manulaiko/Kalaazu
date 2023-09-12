package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_385.class_2237;
import package_385.class_2251;

public class class_2637 extends class_1780 {


    private var _matrix: Array;

    public function class_2637(param1: Array) {
        super();
        if (param1.length != 20) {
            throw new Error("Matrix length must be 20!");
        }
        this._matrix = param1;
    }

    public function get method_2398(): Array {
        return this._matrix;
    }

    public function set method_2398(param1: Array): void {
        this._matrix = param1;
    }

    override arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc5_: * = null;
        var _loc4_: String = "";
        _loc5_ = param2.method_1853();
        param2.method_1853();
        param2.method_1853();
        param2.method_1853();
        var _loc6_: class_2251 = param2.method_1853();
        param1.var_2676 = Number(_loc5_.index) * 4;
        return _loc4_ + ("m44 " + param3 + ", " + param3 + ", " + _loc5_ + "\n" + "add " + param3 + ", " + param3 + ", " + _loc6_ + "\n");
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        var _loc3_: Array = this._matrix;
        var _loc4_: int = int(param1.var_2676);
        var _loc5_: Vector.<Number>;
        (_loc5_ = param1.var_3329)[_loc4_] = _loc3_[0];
        _loc5_[_loc4_ + 1] = _loc3_[1];
        _loc5_[_loc4_ + 2] = _loc3_[2];
        _loc5_[_loc4_ + 3] = _loc3_[3];
        _loc5_[_loc4_ + 4] = _loc3_[5];
        _loc5_[_loc4_ + 5] = _loc3_[6];
        _loc5_[_loc4_ + 6] = _loc3_[7];
        _loc5_[_loc4_ + 7] = _loc3_[8];
        _loc5_[_loc4_ + 8] = _loc3_[10];
        _loc5_[_loc4_ + 9] = _loc3_[11];
        _loc5_[_loc4_ + 10] = _loc3_[12];
        _loc5_[_loc4_ + 11] = _loc3_[13];
        _loc5_[_loc4_ + 12] = _loc3_[15];
        _loc5_[_loc4_ + 13] = _loc3_[16];
        _loc5_[_loc4_ + 14] = _loc3_[17];
        _loc5_[_loc4_ + 15] = _loc3_[18];
        _loc5_[_loc4_ + 16] = _loc3_[4];
        _loc5_[_loc4_ + 17] = _loc3_[9];
        _loc5_[_loc4_ + 18] = _loc3_[14];
        _loc5_[_loc4_ + 19] = _loc3_[19];
    }
}
}
