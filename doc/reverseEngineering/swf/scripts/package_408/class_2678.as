package package_408 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_320.InfluenceWindowNotifications;

import package_321.InfluenceWindowProxy;

import package_84.class_243;

public class class_2678 extends class_243 {


    public function class_2678() {
        super();
    }

    override public function execute(param1: INotification): void {
        facade.removeProxy(InfluenceWindowProxy.NAME);
        facade.removeCommand(InfluenceWindowNotifications.UPDATE_VIEW_FULL);
        registerCommand(InfluenceWindowNotifications.INIT, class_2311);
    }
}
}
