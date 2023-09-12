package package_75 {

import package_29.class_85;

import package_35.class_338;
import package_35.class_348;

public class class_349 extends class_348 {


    private var var_1715: int;

    private var var_4515: int;

    private var var_1074: Boolean;

    private var var_1563: Boolean;

    public function class_349(param1: class_85, param2: int, param3: int = 0, param4: Boolean = false, param5: Boolean = true) {
        this.var_1563 = param5;
        this.var_1074 = param4;
        this.var_4515 = param3;
        this.var_1715 = param2;
        super(class_338.const_88, param1, const_925);
    }

    public function get method_5516(): int {
        return this.var_1715;
    }

    public function get method_390(): int {
        return this.var_4515;
    }

    public function get method_515(): Boolean {
        return this.var_1074;
    }

    public function get method_4902(): Boolean {
        return this.var_1563;
    }

    override public function get method_5314(): Boolean {
        return true;
    }
}
}
