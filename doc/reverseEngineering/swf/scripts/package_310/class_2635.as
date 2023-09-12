package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_385.class_2237;
import package_385.class_2250;
import package_385.class_2251;

public class class_2635 extends class_2634 {


    private var var_1339: class_2251;

    private var var_2552: Number = 0.1;

    private var var_3394: Number = 0.1;

    public function class_2635(param1: Number = 0.5, param2: class_2241 = null) {
        super(this.method_3860, param2);
        this.var_3394 = param1;
    }

    public function get smoothness(): Number {
        return this.var_2552;
    }

    public function set smoothness(param1: Number): void {
        this.var_2552 = param1;
    }

    public function get method_5379(): Number {
        return this.var_3394;
    }

    public function set method_5379(param1: Number): void {
        this.var_3394 = param1;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        super.arcane::activate(param1, param2);
        var _loc3_: int = int(param1.var_4227);
        var _loc4_: Vector.<Number>;
        (_loc4_ = param1.var_3329)[_loc3_] = this.var_2552;
        _loc4_[_loc3_ + 1] = this.var_3394;
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_1339 = null;
    }

    private function method_3860(param1: class_2252, param2: class_2251, param3: class_2237, param4: class_2250): String {
        param1 = param1;
        param3 = param3;
        param4 = param4;
        return "sub " + param2 + ".y, " + param2 + ".w, " + this.var_1339 + ".y\n" + "div " + param2 + ".y, " + param2 + ".y, " + this.var_1339 + ".x\n" + "sat " + param2 + ".y, " + param2 + ".y\n" + "sge " + param2 + ".w, " + param2 + ".w, " + this.var_1339 + ".y\n" + "mul " + param2 + ".w, " + param2 + ".w, " + param2 + ".y\n";
    }

    override arcane function method_1029(param1: class_2252, param2: class_2237): String {
        this.var_1339 = param2.method_1853();
        param1.var_4227 = Number(this.var_1339.index) * 4;
        return super.arcane::method_1029(param1, param2);
    }
}
}
