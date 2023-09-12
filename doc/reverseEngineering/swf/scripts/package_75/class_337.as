package package_75 {

import com.bigpoint.utils.class_73;

import package_35.Effect;
import package_35.class_338;

public class class_337 extends Effect {


    private var var_4046: class_73;

    private var var_3120: class_73;

    public function class_337(param1: class_73, param2: class_73) {
        this.var_3120 = param2;
        this.var_4046 = param1;
        super(class_338.const_606, const_2311, null);
    }

    public function get method_1567(): class_73 {
        return this.var_4046;
    }

    public function get name_67(): class_73 {
        return this.var_3120;
    }

    override public function method_5571(param1: Effect): void {
        var _loc2_: class_337 = param1 as class_337;
        this.var_3120 = _loc2_.name_67;
        this.var_4046 = _loc2_.method_1567;
    }
}
}
