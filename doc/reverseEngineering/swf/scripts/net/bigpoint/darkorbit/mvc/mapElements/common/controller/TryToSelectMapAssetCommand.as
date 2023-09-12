package net.bigpoint.darkorbit.mvc.mapElements.common.controller {

import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_38.class_940;

public class TryToSelectMapAssetCommand extends SimpleCommand {


    public function TryToSelectMapAssetCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc4_: * = null;
        var _loc2_: Array = param1.getBody() as Array;
        if (_loc2_ == null || _loc2_.length != 5) {
            return;
        }
        var _loc3_: int = int(_loc2_[0]);
        _loc2_[1] = int(_loc2_[1]);
        _loc2_[2] = int(_loc2_[2]);
        _loc2_[3] = int(_loc2_[3]);
        _loc2_[4] = int(_loc2_[4]);
        (_loc4_ = new class_940(_loc3_)).name_141 = _loc2_[1];
        _loc4_.name_18 = _loc2_[2];
        _loc4_.var_4787 = _loc2_[3];
        _loc4_.var_2295 = _loc2_[4];
        _loc4_.name_18 -= (_loc4_.name_141 + _loc4_.name_18 + _loc4_.var_4787) % 3;
        facade.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, _loc4_);
    }
}
}
