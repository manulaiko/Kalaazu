package package_408 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.IProxy;

import package_320.InfluenceWindowNotifications;

import package_321.InfluenceWindowProxy;
import package_321.class_2269;

import package_84.class_1134;

public class class_2542 extends class_1134 {


    public function class_2542() {
        super();
    }

    override public function execute(param1: INotification): void {
        facade.removeCommand(param1.getName());
        var _loc2_: IProxy = new InfluenceWindowProxy(new class_2269());
        facade.removeCommand(param1.getName());
        registerProxy(_loc2_);
        registerCommand(InfluenceWindowNotifications.UPDATE_VIEW_FULL, class_2677);
        commandComplete();
    }
}
}
