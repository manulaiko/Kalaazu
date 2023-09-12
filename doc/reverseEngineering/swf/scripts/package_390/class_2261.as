package package_390 {

import net.bigpoint.darkorbit.net.class_59;

import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_388.HintSystemNotifications;

import package_392.class_2265;

import package_448.class_2506;

public class class_2261 extends SimpleCommand {


    public function class_2261() {
        super();
    }

    protected function method_348(param1: Class, param2: class_2265): void {
        var _loc3_: * = null;
        if (param1 != null) {
            _loc3_ = "undefined." + String(param1);
            if (!facade.hasCommand(_loc3_)) {
                facade.registerCommand(_loc3_, param1);
            }
            facade.sendNotification(_loc3_, [param2, _loc3_]);
        }
    }

    protected function method_2496(param1: class_2506): void {
        var _loc2_: * = null;
        if (param1.method_5141 != null) {
            _loc2_ = param1.method_5141;
            class_59.call(class_59.const_1192, [_loc2_]);
        }
        if (param1.method_3977 != null) {
            class_59.method_958(param1.method_3977);
        }
    }
}
}
