package package_404 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_406.SettingsWindowFUIProxy;

import package_84.class_243;

public class class_2294 extends class_243 {


    public function class_2294() {
        super();
    }

    override public function execute(param1: INotification): void {
        (facade.retrieveProxy(SettingsWindowFUIProxy.NAME) as SettingsWindowFUIProxy).method_4606();
    }
}
}
