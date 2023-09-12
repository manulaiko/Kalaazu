package package_124 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.boosterstation.notification.BoosterStationViewNotification;
import net.bigpoint.darkorbit.net.class_112;
import net.bigpoint.darkorbit.net.class_116;
import net.bigpoint.darkorbit.net.class_1486;
import net.bigpoint.darkorbit.net.class_1487;
import net.bigpoint.darkorbit.net.class_74;

import package_37.class_170;

import package_38.class_315;
import package_38.class_603;
import package_38.class_890;

public class class_392 extends class_170 {


    public function class_392() {
        super();
    }

    public static function run(param1: class_315): void {
        var _loc2_: * = null;
        var _loc3_: String = "";
        if (param1.activated) {
            _loc3_ = "null";
        } else {
            _loc3_ = "null";
        }
        switch (param1.var_2708) {
            case class_315.const_2996:
                _loc2_ = ["0", class_74.const_74, class_74.const_3307, _loc3_, class_126.const_1124, param1.name_128];
                class_112.getInstance().method_3891(_loc2_);
                break;
            case class_315.const_2129:
                _loc2_ = ["0", class_74.const_74, class_74.const_3307, _loc3_, class_126.const_1779, param1.name_128];
                class_112.getInstance().method_3891(_loc2_);
                break;
            case class_315.const_1432:
            case class_315.const_1099:
                _loc2_ = ["0", class_74.const_74, class_74.const_3307, _loc3_, class_126.const_1583, param1.name_128];
                class_112.getInstance().method_3891(_loc2_);
                break;
            case class_315.SINGULARITY:
            case class_315.const_196:
                _loc2_ = ["0", class_74.const_74, class_74.const_3307, _loc3_, class_126.const_1250, param1.name_128];
                class_112.getInstance().method_3891(_loc2_);
                break;
            case class_315.const_3239:
                if (param1.activated) {
                    class_1486.getInstance().method_1485(new class_603(class_126.const_448, param1.name_128, null));
                    break;
                }
                class_1407.run(new class_890(class_126.const_448, param1.name_128, null));
                break;
            case class_315.const_1051:
                if (param1.activated) {
                    class_1486.getInstance().method_1485(new class_603(class_126.const_3104, param1.name_128, null));
                    break;
                }
                class_1407.run(new class_890(class_126.const_3104, param1.name_128, null));
                break;
            case class_315.INVINCIBILITY:
                if (param1.activated) {
                    _loc3_ = "null";
                } else {
                    _loc3_ = "null";
                }
                class_116.getInstance().method_5080(["0", class_74.const_74, class_74.const_1572, _loc3_, class_74.const_1953, param1.name_128]);
                break;
            case class_315.const_3057:
                var_271.sendNotification(BoosterStationViewNotification.RING_EFFECT, param1);
                break;
            default:
                class_1487.getInstance().method_3743(param1);
        }
        class_1487.getInstance().method_337(param1);
    }
}
}
