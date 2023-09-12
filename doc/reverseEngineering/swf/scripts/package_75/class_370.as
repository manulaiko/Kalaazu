package package_75 {

import package_22.class_339;

import package_29.class_85;

import package_35.Effect;
import package_35.class_338;
import package_35.class_348;

public class class_370 extends class_348 {


    private var var_274: int = 0;

    private var var_672: int = 0;

    public function class_370(param1: class_85, param2: int, param3: int = 0, param4: int = 0) {
        super(class_338.const_2606, param1, param2, new class_339(class_338.const_2606, "shield0"));
        this.var_274 = param3;
        this.var_672 = param3;
    }

    public function get name_114(): int {
        return this.var_274;
    }

    public function get name_88(): int {
        return this.var_672;
    }

    override public function method_5571(param1: Effect): void {
        var _loc2_: class_370 = param1 as class_370;
        this.var_274 = _loc2_.name_114;
        this.var_672 = _loc2_.name_88;
    }
}
}
