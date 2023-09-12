package package_36 {

import package_29.class_85;

import package_35.Effect;
import package_35.class_338;

import package_75.class_417;

import package_9.class_50;

public class class_409 extends Effect {


    private var var_1231: class_85;

    private var var_759: Array;

    public function class_409(param1: class_85, param2: Array) {
        super(class_338.const_1506, const_925, pattern);
        this.var_1231 = param1;
        this.var_759 = param2;
    }

    public function get attacker(): class_85 {
        return this.var_1231;
    }

    public function get method_1610(): Array {
        return this.var_759;
    }

    override public function isValid(): Boolean {
        return super.isValid() && this.var_1231 != null && this.var_759.length > 0;
    }

    public function method_5614(param1: int): void {
        var _loc2_: class_85 = class_50.getInstance().map.method_327(param1);
        class_50.getInstance().map.effects.method_5565(new class_417(_loc2_));
    }

    override public function get method_5314(): Boolean {
        return true;
    }
}
}
