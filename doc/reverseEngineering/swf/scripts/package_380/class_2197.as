package package_380 {

import net.bigpoint.darkorbit.map.model.traits.class_287;
import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_114.class_318;

import package_22.class_1090;
import package_22.class_198;
import package_22.class_426;

import package_27.class_82;

import package_36.class_98;

public class class_2197 {


    public function class_2197(param1: class_1211, param2: class_98) {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        super();
        if (param2.attacker != null && param2.target != null) {
            _loc3_ = class_299(param2.attacker.method_1954(class_299)).rocketLauncher;
            if ((_loc4_ = int(_loc3_.rocketClassId)) != -1) {
                if ((_loc5_ = class_198.method_4446(_loc4_, param2.typeID) || class_198.method_4446(0, 1)).method_3142() != -1) {
                    class_82.playSoundEffect(_loc5_.method_3142(), false, false, param2.attacker.position.x, param2.attacker.position.y, true);
                }
                _loc6_ = class_198.var_4122[param2.method_5769];
                param1.method_1616.addChild(new class_2482(param2.attacker.method_1954(class_299) as class_299, param2.target.method_1954(class_287) as class_287, param2.name_56, _loc5_, _loc6_, param2.name_40));
            }
        }
    }
}
}
