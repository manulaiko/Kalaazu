package package_210 {

import net.bigpoint.darkorbit.mvc.sectorControlWindow.SectorControlWindowNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_267.SectorControlProxy;

import package_38.class_469;

public class class_1236 extends SimpleCommand {


    public function class_1236() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_469 = param1.getBody() as class_469;
        var _loc3_: SectorControlProxy = facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy;
        _loc3_.updateMatchOverview(_loc2_);
        if (_loc3_.method_2588) {
            _loc3_.method_2588 = false;
            facade.sendNotification(SectorControlWindowNotifications.const_3040);
        }
    }
}
}
