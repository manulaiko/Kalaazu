package package_223 {

import package_135.class_391;

import package_267.SectorControlProxy;

import package_312.class_1785;

import package_313.class_1786;

import package_37.class_170;

import package_38.class_655;

public class class_1292 extends class_170 {


    public function class_1292() {
        super();
    }

    public static function run(param1: class_655): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        if (param1.var_971 == true) {
            var_271.method_2407(class_391.const_1421, param1.var_3355);
            _loc2_ = int((var_271.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy).method_3110(param1.var_3355));
            _loc3_ = map.method_327(_loc2_) as class_1785;
            if (_loc3_ != null) {
                _loc4_ = Number(_loc3_.method_1548) * 100;
                var_271.method_2407(class_391.const_613, new class_1786(param1.var_3355, class_1786.const_813, _loc3_.name_75.value, _loc4_));
            }
        } else if (param1.var_971 == false) {
            var_271.method_2407(class_391.const_1421, null);
        }
    }
}
}
