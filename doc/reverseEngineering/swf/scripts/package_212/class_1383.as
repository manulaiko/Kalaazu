package package_212 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_185.class_1113;

import package_259.class_1658;

import package_84.class_243;

public class class_1383 extends class_243 {


    public function class_1383() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        (facade.retrieveProxy(class_1113.NAME) as class_1113).method_3704();
        sendNotification(class_1658.const_2683);
    }
}
}
