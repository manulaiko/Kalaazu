package package_124 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_326.PlagueWindowNotifications;

import package_327.PlagueWindowProxy;

import package_38.class_574;

import package_84.class_243;

public class class_1331 extends class_243 {


    public function class_1331() {
        super();
    }

    override public function execute(param1: INotification): void {
        sendNotification(PlagueWindowNotifications.INIT);
        var _loc2_: class_574 = param1.getBody() as class_574;
        var _loc3_: PlagueWindowProxy = facade.retrieveProxy(PlagueWindowProxy.NAME) as PlagueWindowProxy;
        _loc3_.method_2659(_loc2_.var_2697);
        _loc3_.method_1131(_loc2_.var_1152);
        _loc3_.method_5449(_loc2_.var_1675);
        _loc3_.updateView();
    }
}
}
