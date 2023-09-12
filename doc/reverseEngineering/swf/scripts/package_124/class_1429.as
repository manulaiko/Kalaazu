package package_124 {

import package_37.ICommand;
import package_37.class_170;
import package_37.class_363;

import package_38.class_487;

public class class_1429 extends class_170 {


    public function class_1429() {
        super();
    }

    public static function run(param1: class_487): void {
        var _loc2_: * = null;
        for each(_loc2_ in param1.var_1768) {
            class_363.execute(_loc2_);
        }
    }
}
}
