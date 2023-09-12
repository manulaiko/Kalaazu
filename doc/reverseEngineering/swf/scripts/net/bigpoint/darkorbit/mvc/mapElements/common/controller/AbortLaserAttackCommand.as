package net.bigpoint.darkorbit.mvc.mapElements.common.controller {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_36.class_1149;

import package_38.class_848;

import package_84.class_243;

public class AbortLaserAttackCommand extends class_243 {


    public function AbortLaserAttackCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: Boolean = Boolean(param1.getBody()[0]);
        var _loc3_: int = int(param1.getBody()[1]);
        var _loc4_: Boolean = Boolean(param1.getBody()[2]);
        var _loc5_: class_86;
        if (!(_loc5_ = map.method_1203().method_2455(_loc3_))) {
            return;
        }
        map.effects.method_269(new class_1149(_loc5_));
        if (_loc2_) {
            facade.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_848());
        }
        var _loc6_: class_86 = map.method_4929.target as class_86;
        if (_loc4_ && Boolean(_loc6_)) {
            class_58.instance.writeToLog(class_88.getItem("attstop").replace(/%!/, _loc6_.info.name_148.value));
        }
        var _loc7_: class_299;
        if (_loc7_ = _loc5_.method_1954(class_299) as class_299) {
            _loc7_.target = null;
        }
    }
}
}
