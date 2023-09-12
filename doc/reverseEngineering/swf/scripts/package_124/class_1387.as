package package_124 {

import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.net.class_74;

import package_112.class_420;

import package_17.class_62;

import package_37.class_170;

import package_38.class_573;

public class class_1387 extends class_170 {


    public function class_1387() {
        super();
    }

    public static function run(param1: class_573): void {
        method_4185(param1.name_128, param1.x, param1.y, param1.var_3446);
    }

    private static function method_4185(param1: int, param2: int, param3: int, param4: int): void {
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc5_: class_86;
        if ((_loc5_ = map.method_327(param1) as class_86) == null) {
            class_62.getInstance().sendNotification(ConnectionNotifications.SEND_COMMAND, [class_74.const_3271, [param1]]);
        } else if (param4 == 0) {
            _loc5_.method_3507();
            _loc5_.position.setTo(param2, param3, 0);
        } else if ((_loc6_ = map.method_5806(param1, class_420) as class_420) != null && Boolean(_loc6_.method_244)) {
            _loc7_ = 150;
            _loc8_ = (Math.random() - 0.5) * _loc7_ + param2;
            _loc9_ = (Math.random() - 0.5) * _loc7_ + param3;
            _loc5_.goto(_loc8_, _loc9_, method_4185, [param1, param2, param3, param4], param4 * 0.002);
        } else {
            _loc5_.goto(param2, param3, null, null, param4 * 0.001);
        }
    }
}
}
