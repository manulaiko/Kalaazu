package package_124 {

import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_37.class_170;

import package_38.class_559;

public class class_1345 extends class_170 {


    public function class_1345() {
        super();
    }

    public static function run(param1: class_559): void {
        var _loc2_: class_86 = var_574.name_47.map.method_1203().method_2455(param1.uid);
        if (_loc2_) {
            _loc2_.drones.const_1693.value = param1.var_3597;
        }
    }
}
}
