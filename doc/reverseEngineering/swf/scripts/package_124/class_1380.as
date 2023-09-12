package package_124 {

import package_120.class_328;
import package_120.class_431;

import package_193.class_1197;

import package_37.ICommand;
import package_37.class_170;

import package_38.class_646;

public class class_1380 extends class_170 {


    public function class_1380() {
        super();
    }

    public static function run(param1: ICommand): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (map != null) {
            _loc2_ = param1 as class_646;
            _loc3_ = map.method_2402;
            if ((Boolean(_loc4_ = _loc3_.method_1978(_loc2_.var_1818))) && _loc4_ is class_1197) {
                class_1197(_loc4_).radius.value = _loc2_.currentValue;
            }
        }
    }
}
}
