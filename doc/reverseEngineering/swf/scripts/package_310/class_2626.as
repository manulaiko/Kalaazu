package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_385.class_2237;
import package_385.class_2250;
import package_385.class_2251;

public class class_2626 extends class_2612 {


    private var var_3020: uint;

    private var var_1339: class_2251;

    private var var_2552: Number = 0.1;

    public function class_2626(param1: uint = 3, param2: class_2246 = null) {
        super(this.method_1086, param2);
        this.var_3020 = param1;
    }

    override arcane function method_4956(param1: class_2252): void {
        var _loc2_: Vector.<Number> = param1.var_3329;
        var _loc3_: int = int(param1.var_4227);
        super.arcane::method_4956(param1);
        _loc2_[_loc3_ + 1] = 1;
        _loc2_[_loc3_ + 2] = 0;
    }

    public function get method_5890(): uint {
        return this.var_3020;
    }

    public function set method_5890(param1: uint): void {
        this.var_3020 = param1;
    }

    public function get smoothness(): Number {
        return this.var_2552;
    }

    public function set smoothness(param1: Number): void {
        this.var_2552 = param1;
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_1339 = null;
    }

    override arcane function method_1029(param1: class_2252, param2: class_2237): String {
        this.var_1339 = param2.method_1853();
        param1.var_4227 = Number(this.var_1339.index) * 4;
        return super.arcane::method_1029(param1, param2);
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        super.arcane::activate(param1, param2);
        var _loc3_: Vector.<Number> = param1.var_3329;
        var _loc4_: int = int(param1.var_4227);
        _loc3_[_loc4_] = this.var_3020;
        _loc3_[_loc4_ + 3] = this.var_2552;
    }

    private function method_1086(param1: class_2252, param2: class_2251, param3: class_2237, param4: class_2250): String {
        return "mul " + param2 + ".w, " + param2 + ".w, " + this.var_1339 + ".x\n" + "frc " + param2 + ".z, " + param2 + ".w\n" + "sub " + param2 + ".y, " + param2 + ".w, " + param2 + ".z\n" + "mov " + param2 + ".x, " + this.var_1339 + ".x\n" + "sub " + param2 + ".x, " + param2 + ".x, " + this.var_1339 + ".y\n" + "rcp " + param2 + ".x," + param2 + ".x\n" + "mul " + param2 + ".w, " + param2 + ".y, " + param2 + ".x\n" + "sub " + param2 + ".y, " + param2 + ".w, " + param2 + ".x\n" + "div " + param2 + ".z, " + param2 + ".z, " + this.var_1339 + ".w\n" + "sat " + param2 + ".z, " + param2 + ".z\n" + "mul " + param2 + ".w, " + param2 + ".w, " + param2 + ".z\n" + "sub " + param2 + ".z, " + this.var_1339 + ".y, " + param2 + ".z\n" + "mul " + param2 + ".y, " + param2 + ".y, " + param2 + ".z\n" + "add " + param2 + ".w, " + param2 + ".w, " + param2 + ".y\n" + "sat " + param2 + ".w, " + param2 + ".w\n";
    }
}
}
