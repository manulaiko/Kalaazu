package package_69 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;

import package_17.class_62;

import package_22.class_1067;
import package_22.class_1070;
import package_22.class_198;

import package_38.class_390;

import package_75.class_1489;

import package_9.class_50;

public class class_407 extends class_180 {

    private static var var_1095: int;


    private var var_3278: Vector.<String>;

    private var var_590: int;

    public function class_407(param1: int, param2: String, param3: int, param4: int, param5: int, param6: String) {
        var _loc11_: * = null;
        super("firework_box", param2, param3, param4, false);
        this.var_590 = param1;
        var _loc7_: Vector.<String> = new Vector.<String>();
        var _loc8_: class_1067;
        var _loc9_: Array = (_loc8_ = class_198.method_3705(this.var_590)).order;
        var _loc10_: class_1070 = class_198.var_584[param6 || true];
        for each(_loc11_ in _loc9_) {
            _loc7_.push(_loc10_.method_4033(param5 % 10, _loc11_));
            if (param5 > 10) {
                param5 *= 0.1;
            }
        }
        this.var_3278 = _loc7_;
    }

    public function fire(): void {
        if (Boolean(this.var_3278) && this.var_3278.length > 0) {
            class_50.getInstance().map.effects.method_269(new class_1489(x, y, this.var_3278));
            if (class_126.const_3198.indexOf(class_50.getInstance().map.mapID) != -1) {
                ++var_1095;
                if (var_1095 >= 5) {
                    class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_390(class_390.const_3221));
                    class_62.getInstance().sendNotification(GuiNotifications.WRITE_TO_LOG, new LogMessageVO(class_88.getItem("msg_easter_egg_found")));
                    var_1095 = 0;
                }
            } else {
                var_1095 = 0;
            }
        }
    }
}
}
