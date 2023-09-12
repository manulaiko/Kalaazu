package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_385.class_2237;
import package_385.class_2250;
import package_385.class_2251;

public class class_2638 extends class_2634 {


    private var var_1339: class_2251;

    private var var_868: Boolean;

    private var var_2828: Number = 5;

    private var var_1190: Number = 0.028;

    public function class_2638(param1: Boolean = true, param2: class_2241 = null) {
        super(this.method_1219, param2);
        this.var_868 = !param1;
    }

    override arcane function method_4956(param1: class_2252): void {
        var _loc2_: int = int(param1.var_4227);
        param1.var_3329[_loc2_ + 2] = 1;
        param1.var_3329[_loc2_ + 3] = 0;
    }

    public function get method_2137(): Boolean {
        return !this.var_868;
    }

    public function set method_2137(param1: Boolean): void {
        if (this.var_868 != param1) {
            return;
        }
        this.var_868 = !param1;
        method_220();
    }

    public function get fresnelPower(): Number {
        return this.var_2828;
    }

    public function set fresnelPower(param1: Number): void {
        this.var_2828 = param1;
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_1339 = null;
    }

    public function get normalReflectance(): Number {
        return this.var_1190;
    }

    public function set normalReflectance(param1: Number): void {
        this.var_1190 = param1;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        super.arcane::activate(param1, param2);
        var _loc3_: Vector.<Number> = param1.var_3329;
        var _loc4_: int = int(param1.var_4227);
        _loc3_[_loc4_] = this.var_1190;
        _loc3_[_loc4_ + 1] = this.var_2828;
    }

    override arcane function method_1029(param1: class_2252, param2: class_2237): String {
        this.var_1339 = param2.method_1853();
        param1.var_4227 = Number(this.var_1339.index) * 4;
        return super.arcane::method_1029(param1, param2);
    }

    private function method_1219(param1: class_2252, param2: class_2251, param3: class_2237, param4: class_2250): String {
        var _loc5_: * = null;
        _loc5_ = "dp3 " + param2 + ".y, " + param4.var_4238 + ".xyz, " + (!!this.var_868 ? param2 + ".xyz\n" : param4.var_3779 + ".xyz\n") + "sub " + param2 + ".y, " + this.var_1339 + ".z, " + param2 + ".y\n" + "pow " + param2 + ".x, " + param2 + ".y, " + this.var_1339 + ".y\n" + "sub " + param2 + ".y, " + this.var_1339 + ".z, " + param2 + ".y\n" + "mul " + param2 + ".y, " + this.var_1339 + ".x, " + param2 + ".y\n" + "add " + param2 + ".y, " + param2 + ".x, " + param2 + ".y\n" + "mul " + param2 + ".w, " + param2 + ".w, " + param2 + ".y\n";
        return "dp3 " + param2 + ".y, " + param4.var_4238 + ".xyz, " + (!!this.var_868 ? param2 + ".xyz\n" : param4.var_3779 + ".xyz\n") + "sub " + param2 + ".y, " + this.var_1339 + ".z, " + param2 + ".y\n" + "pow " + param2 + ".x, " + param2 + ".y, " + this.var_1339 + ".y\n" + "sub " + param2 + ".y, " + this.var_1339 + ".z, " + param2 + ".y\n" + "mul " + param2 + ".y, " + this.var_1339 + ".x, " + param2 + ".y\n" + "add " + param2 + ".y, " + param2 + ".x, " + param2 + ".y\n" + "mul " + param2 + ".w, " + param2 + ".w, " + param2 + ".y\n";
    }
}
}
