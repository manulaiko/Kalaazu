package package_36 {

import package_29.class_85;

import package_35.Effect;
import package_35.class_338;

public class class_1149 extends Effect {


    private var var_1231: class_85;

    public function class_1149(param1: class_85) {
        super(class_338.const_3171, const_925);
        this.var_1231 = param1;
    }

    public function get attacker(): class_85 {
        return this.var_1231;
    }

    override public function isValid(): Boolean {
        return super.isValid() && this.var_1231 != null;
    }
}
}
