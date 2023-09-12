package package_223 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.model.class_90;

import package_120.class_431;

import package_135.class_391;

import package_267.SectorControlProxy;

import package_312.class_1785;

import package_313.class_1786;

import package_37.class_170;

import package_38.class_911;

public class class_1276 extends class_170 {


    public function class_1276() {
        super();
    }

    public static function run(param1: class_911): void {
        if (var_574.name_47.map == null) {
            return;
        }
        var _loc2_: class_431 = var_574.name_47.map.method_2402.method_1978(param1.var_3355);
        if (_loc2_ == null) {
            return;
        }
        var _loc3_: int = int((var_271.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy).method_3110(param1.var_3355));
        if (_loc3_ == int.MIN_VALUE) {
            _loc3_ = 0;
            (var_271.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy).method_664(param1.var_3355, _loc3_);
        }
        var _loc4_: class_1785;
        (_loc4_ = map.method_327(_loc3_) as class_1785).name_167.value = param1.name_167;
        _loc4_.name_75.value = param1.name_75.faction;
        _loc4_.name_153.value = Vector.<Object>(param1.name_153);
        _loc4_.name_4 = param1.name_4;
        var _loc5_: String;
        if ((_loc5_ = class_126.getInstance().method_2276[param1.name_75.faction]) == null || !_loc4_.const_2579.value) {
            _loc5_ = "NONE";
        }
        _loc2_.zoneTypeSpecification.value = _loc5_;
        var _loc6_: int = int(method_621(_loc4_));
        var_271.method_2407(class_391.const_613, new class_1786(param1.var_3355, _loc6_, _loc4_.name_75.value, Number(_loc4_.method_1548) * 100));
    }

    private static function method_621(param1: class_1785): int {
        var _loc2_: int = 0;
        if (param1.method_4671) {
            _loc2_ = 0;
        } else if (Boolean(param1.const_822.value) && !param1.const_2579.value) {
            _loc2_ = 0;
        }
        return _loc2_;
    }
}
}
