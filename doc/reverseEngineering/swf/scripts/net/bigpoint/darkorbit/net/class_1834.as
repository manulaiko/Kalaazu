package net.bigpoint.darkorbit.net {

import com.greensock.TweenLite;

import net.bigpoint.darkorbit.class_81;

import package_38.class_585;
import package_38.class_890;

public class class_1834 extends class_96 {

    private static var instance: class_1834;


    public function class_1834(param1: Function) {
        super();
        if (param1 !== method_336) {
            throw new Error("AbilityButtonAssembly is a Singleton and can only be accessed through AbilityButtonAssembly.getInstance()");
        }
    }

    private static function method_336(): void {
    }

    public static function getInstance(): class_1834 {
        if (instance == null) {
            instance = new class_1834(method_336);
        }
        return instance;
    }

    public function method_2177(param1: class_585): void {
        var _loc2_: int = int(param1.var_2632);
        class_112.getInstance().method_3219(param1.var_4266, _loc2_, true);
        if (Boolean(param1.var_1062) && param1.var_4266 == class_81.userID) {
            TweenLite.delayedCall(1, class_112.getInstance().method_3219, [param1.var_4266, _loc2_, false]);
        }
        if (param1.var_4266 == class_81.userID) {
            var_574.method_4489().var_396.method_4289(_loc2_, true);
        } else {
            var_574.method_4489().var_396.method_5312(_loc2_, true);
        }
    }

    public function method_1003(param1: class_890): void {
        class_112.getInstance().method_3219(param1.var_4266, param1.var_2632, false);
        if (param1.var_4266 == class_81.userID) {
            if (var_574.method_4489().var_396 != null) {
                var_574.method_4489().var_396.method_4289(param1.var_2632, false);
            }
        } else if (var_574.method_4489().var_396 != null) {
            var_574.method_4489().var_396.method_5312(param1.var_2632, false);
        }
    }
}
}
