package package_205 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_258.class_1657;

import package_38.class_951;

import package_84.class_243;

public class class_1369 extends class_243 {


    public function class_1369() {
        super();
    }

    override public function execute(param1: INotification): void {
        sendNotification(class_1657.UPDATE_ROUND_NUMBER, (param1.getBody() as class_951).var_276);
    }
}
}
