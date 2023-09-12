package net.bigpoint.darkorbit.net {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_101.class_271;

import package_29.class_85;

import package_35.EffectManager;
import package_35.class_338;

import package_38.class_890;

import package_9.class_50;

public class class_1842 extends class_96 {

    private static var instance: class_1842;


    public function class_1842(param1: Function) {
        super();
        if (param1 !== method_336) {
            throw new Error("AbilityEffectDeactivationAssembly is a Singleton and can only be accessed through AbilityEffectDeactivationAssembly.getInstance()");
        }
    }

    private static function method_336(): void {
    }

    public static function getInstance(): class_1842 {
        if (instance == null) {
            instance = new class_1842(method_336);
        }
        return instance;
    }

    public function method_5074(param1: class_890): void {
        var _loc2_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        _loc2_ = var_574.name_47;
        var _loc3_: EffectManager = _loc2_.map.effects;
        switch (param1.var_2632) {
            case class_126.const_1423:
                _loc3_.method_3217(param1.var_4266, class_338.const_3069);
                break;
            case class_126.const_806:
                _loc3_.method_3217(param1.var_4266, class_338.const_2047);
                break;
            case class_126.const_437:
                _loc3_.method_3217(param1.var_4266, class_338.const_3083);
                break;
            case class_126.const_448:
                _loc3_.method_3217(param1.var_4266, class_338.const_1034);
                break;
            case class_126.const_3104:
                _loc3_.method_3217(param1.var_4266, class_338.const_547);
                break;
            case class_126.const_1752:
                if ((Boolean(_loc4_ = _loc2_.map.method_327(param1.var_4266))) && _loc4_ is class_86) {
                    class_86(_loc4_).cloaked.value = false;
                    break;
                }
                break;
            case class_126.const_1685:
                if (_loc5_ = map.hero.method_1954(class_271) as class_271) {
                    _loc5_.method_6432();
                    break;
                }
        }
    }
}
}
