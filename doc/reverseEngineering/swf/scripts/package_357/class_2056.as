package package_357 {

import net.bigpoint.darkorbit.map.model.traits.class_287;
import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_22.class_1090;
import package_22.class_198;
import package_22.class_426;

import package_27.class_82;

import package_36.class_98;

public class class_2056 {


    public function class_2056(param1: class_1206, param2: class_98) {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        super();
        if (param2.attacker != null && param2.target != null) {
            _loc3_ = param2.attacker.method_1954(class_299) as class_299;
            if ((_loc4_ = !!_loc3_.rocketLauncher ? int(_loc3_.rocketLauncher.rocketClassId) : -1) != -1) {
                if (_loc5_ = class_198.method_4446(_loc4_, param2.typeID) || class_198.method_4446(0, 1)) {
                    if (_loc5_.method_3142() != -1) {
                        class_82.playSoundEffect(_loc5_.method_3142(), false, false, param2.attacker.position.x, param2.attacker.position.y, true);
                    }
                    _loc6_ = class_198.var_4122[param2.method_5769];
                    param1.fxLayer.addChild(new class_2356(param2.attacker.method_1954(class_299) as class_299, param2.target.method_1954(class_287) as class_287, param2.name_56, _loc5_, _loc6_, param2.name_40));
                }
            }
        }
    }
}
}
