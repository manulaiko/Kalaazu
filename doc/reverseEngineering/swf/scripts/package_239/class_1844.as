package package_239 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_176.class_1847;

import package_333.TargetedOfferWindowMediator;

import package_334.class_1845;

import package_84.class_243;

public class class_1844 extends class_243 {


    public function class_1844() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        facade.removeProxy(class_1847.NAME);
        facade.removeMediator(TargetedOfferWindowMediator.NAME);
        facade.removeCommand(class_1845.CLEANUP);
    }
}
}
