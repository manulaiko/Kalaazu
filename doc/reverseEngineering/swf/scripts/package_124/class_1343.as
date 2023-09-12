package package_124 {

import package_37.ICommand;
import package_37.class_170;
import package_37.class_363;

import package_38.class_618;

import package_39.class_100;

public class class_1343 extends class_170 {


    public function class_1343() {
        super();
    }

    public static function run(param1: class_618): void {
        var _loc3_: * = null;
        var _loc2_: class_100 = class_100.getInstance();
        _loc2_.method_1253();
        for each(_loc3_ in param1.options) {
            class_363.execute(_loc3_);
        }
        _loc2_.method_3317();
    }
}
}
