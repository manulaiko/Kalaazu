package package_124 {

import package_37.class_170;

import package_38.class_960;

import package_67.AbilitiesModel;

public class class_1431 extends class_170 {


    public function class_1431() {
        super();
    }

    public static function run(param1: class_960): void {
        if (var_574.method_4489().var_396 != null) {
            var_574.method_4489().var_396.method_2609(param1.var_3869, param1.var_3079);
        } else {
            var_574.method_4489().var_396 = new AbilitiesModel(var_574);
            var_574.method_4489().var_396.method_2609(param1.var_3869, param1.var_3079);
        }
    }
}
}
