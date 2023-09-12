package package_210 {

import net.bigpoint.darkorbit.mvc.sectorControlWindow.SectorControlWindowNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_158.class_1008;

import package_159.SectorControlLobbyWindowEvent;

import package_267.SectorControlProxy;

public class class_2676 extends SimpleCommand {


    public function class_2676() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_1008 = param1.getBody() as class_1008;
        var _loc3_: SectorControlProxy = facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy;
        _loc3_.method_5402 = _loc2_;
        this.method_2628(_loc2_, _loc3_.method_3856);
    }

    private function method_2628(param1: class_1008, param2: int): void {
        var _loc3_: * = null;
        if (param2 < 0) {
            _loc3_ = "null";
        } else if (param1.matchID == param2) {
            _loc3_ = "null";
        } else {
            _loc3_ = "null";
        }
        sendNotification(SectorControlWindowNotifications.SET_JOIN_LEAVE_BUTTON_STATE, _loc3_);
    }
}
}
