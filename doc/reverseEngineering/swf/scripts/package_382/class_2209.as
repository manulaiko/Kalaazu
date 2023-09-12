package package_382 {

import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_22.class_1080;
import package_22.class_198;

import package_36.class_1835;

public class class_2209 {


    public function class_2209(param1: class_1211, param2: class_1835) {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        super();
        if (Boolean(param2.attacker) && Boolean(param2.target)) {
            _loc3_ = int(class_299(param2.attacker.method_1954(class_299)).laser.laserClassID);
            if (_loc3_ != -1) {
                if (_loc4_ = class_198.method_1337(_loc3_, param2.var_3196)) {
                    _loc5_ = 0;
                    while (_loc5_ < _loc4_.var_2701.length) {
                        class_2485.method_284(new class_2485(param2.attacker, param2.target, _loc4_.var_2701[_loc5_], param2.var_1286, param2.var_2935, param2.debug));
                        _loc5_++;
                    }
                }
            }
        }
    }
}
}
