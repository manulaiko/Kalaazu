package package_203 {

import package_119.class_327;

import package_38.class_689;

public class class_1350 extends class_1216 {


    public function class_1350() {
        super();
    }

    public static function run(param1: class_689): void {
        var _loc2_: Boolean = Boolean(param1.running);
        var _loc3_: class_327 = method_580();
        if (_loc3_ != null) {
            if (_loc2_) {
                _loc3_.method_4515();
            } else {
                _loc3_.method_5247();
                _loc3_.cleanup();
            }
        }
    }
}
}
