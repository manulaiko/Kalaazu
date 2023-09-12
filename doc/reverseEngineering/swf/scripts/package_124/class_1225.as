package package_124 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.model.traits.class_1783;

import package_29.class_84;

import package_37.class_170;

import package_38.class_603;
import package_38.class_950;

import package_9.class_50;

public class class_1225 extends class_170 {


    public function class_1225() {
        super();
    }

    public static function run(param1: class_950): void {
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: class_84 = class_50.getInstance().map.method_328(class_1783);
        for each(_loc5_ in _loc4_.traits) {
            if ((_loc6_ = Math.abs(Number(_loc5_.owner.position.x) - Number(param1.var_1844)) + Math.abs(Number(_loc5_.owner.position.y) - Number(param1.var_4412))) < _loc2_) {
                _loc2_ = _loc6_;
                _loc3_ = _loc5_;
            }
        }
        if (_loc3_ != null) {
            class_1403.run(new class_603(class_126.const_1423, _loc3_.owner.id, new <int>[param1.name_150]));
        }
    }
}
}
