package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_309.class_1774;
import package_309.class_2663;

import package_385.class_2237;
import package_385.class_2251;

public class class_2484 extends class_1780 {


    private var var_1118: class_2663;

    public function class_2484(param1: uint = 0, param2: Number = 1, param3: Boolean = true, param4: Boolean = false) {
        super();
        var_746 = new Vector.<class_1774>();
        this.var_1118 = new class_2663(param1, param2, param3, param4);
        var_746.push(this.var_1118);
    }

    override arcane function initVO(param1: class_2252): void {
        param1.var_10 = true;
    }

    public function get method_4631(): Boolean {
        return this.var_1118.method_4631;
    }

    public function set method_4631(param1: Boolean): void {
        this.var_1118.method_4631 = param1;
    }

    public function get method_3357(): uint {
        return this.var_1118.method_3357;
    }

    public function set method_3357(param1: uint): void {
        this.var_1118.method_3357 = param1;
    }

    public function get outlineSize(): Number {
        return this.var_1118.outlineSize;
    }

    public function set outlineSize(param1: Number): void {
        this.var_1118.outlineSize = param1;
    }

    override arcane function reset(): void {
        super.arcane::reset();
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
    }

    override arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        return "";
    }
}
}
