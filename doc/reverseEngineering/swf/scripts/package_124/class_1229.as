package package_124 {

import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_108.GroupProxy;

import package_259.class_1658;

import package_35.Effect;

import package_37.class_170;

import package_38.class_961;

import package_75.class_370;

public class class_1229 extends class_170 {


    public function class_1229() {
        super();
    }

    public static function run(param1: class_961): void {
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc2_: int = int(param1.name_128);
        var _loc3_: int = int(param1.shield);
        var _loc4_: int = int(param1.name_105);
        var _loc5_: int = int(param1.name_90);
        var _loc6_: int = int(param1.name_37);
        var _loc7_: int = int(param1.var_2217);
        var _loc8_: int = int(param1.var_1574);
        var _loc9_: Boolean = Boolean(param1.var_3310);
        if (_loc2_ != -1) {
            if (map != null) {
                _loc10_ = map.method_1203().method_5236(_loc2_, _loc5_, _loc6_, _loc3_, _loc4_, _loc7_, _loc8_);
                if (_loc9_) {
                    map.effects.method_269(new class_370(_loc10_, Effect.const_925));
                }
                _loc11_ = method_1395(_loc10_);
                (var_271.retrieveProxy(GroupProxy.NAME) as GroupProxy).method_3586(_loc2_, _loc11_);
                if (Boolean(_loc10_) && !_loc10_.isNPC) {
                    var_271.sendNotification(class_1658.const_179, [_loc2_, _loc11_]);
                }
            }
        }
    }

    private static function method_1395(param1: class_86): String {
        var _loc2_: String = "";
        if (param1) {
            _loc2_ = !param1.isNPC ? param1.info.name_148.value : "";
        }
        return _loc2_;
    }
}
}
