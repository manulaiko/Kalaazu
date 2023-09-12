package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_385.class_2237;
import package_385.class_2251;

public class class_2611 extends class_2246 {


    private var var_2285: class_2251;

    private var var_3557: Number;

    public function class_2611(param1: Number = 0.5) {
        super();
        this.method_2648 = param1;
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_2285 = null;
    }

    public function get method_2648(): Number {
        return this.var_3557;
    }

    public function set method_2648(param1: Number): void {
        this.var_3557 = param1;
        this.var_3557 = 1 / (param1 + 1);
    }

    override arcane function method_1029(param1: class_2252, param2: class_2237): String {
        var _loc3_: * = null;
        _loc3_ = super.arcane::method_1029(param1, param2);
        var_3130 = true;
        this.var_2285 = param2.method_1853();
        param1.var_4227 = Number(this.var_2285.index) * 4;
        return _loc3_;
    }

    override arcane function method_4161(param1: class_2252, param2: class_2251, param3: class_2251, param4: class_2237): String {
        var _loc6_: * = null;
        var _loc5_: String = "";
        if (var_3130) {
            _loc6_ = var_800;
        } else {
            _loc6_ = param4.method_4834();
            param4.method_4539(_loc6_, 1);
        }
        _loc5_ += "dp3 " + _loc6_ + ".x, " + param2 + ".xyz, " + var_1283.var_3779 + ".xyz\n" + "add " + _loc6_ + ".y, " + _loc6_ + ".x, " + this.var_2285 + ".x\n" + "mul " + _loc6_ + ".y, " + _loc6_ + ".y, " + this.var_2285 + ".y\n" + "sat " + _loc6_ + ".w, " + _loc6_ + ".y\n" + "mul " + _loc6_ + ".xz, " + _loc6_ + ".w, " + param2 + ".wz\n";
        if (arcane::var_366 != null) {
            _loc5_ += arcane::var_366(param1, _loc6_, param4, var_1283);
        }
        _loc5_ += "mul " + _loc6_ + ", " + _loc6_ + ".x, " + param3 + "\n";
        if (!var_3130) {
            _loc5_ += "add " + var_800 + ".xyz, " + var_800 + ".xyz, " + _loc6_ + ".xyz\n";
            param4.method_771(_loc6_);
        }
        var_3130 = false;
        return _loc5_;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        super.arcane::activate(param1, param2);
        var _loc3_: int = int(param1.var_4227);
        var _loc4_: Vector.<Number>;
        (_loc4_ = param1.var_3329)[_loc3_] = this.var_3557;
        _loc4_[_loc3_ + 1] = 1 / (this.var_3557 + 1);
    }
}
}
