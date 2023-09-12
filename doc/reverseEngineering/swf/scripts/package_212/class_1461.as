package package_212 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_37.class_363;

import package_38.class_766;
import package_38.class_929;

import package_84.class_243;

public class class_1461 extends class_243 {


    public function class_1461() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_929 = param1.getBody() as class_929;
        var _loc3_: class_766 = new class_766(new <class_929>[_loc2_]);
        class_363.execute(_loc3_);
    }
}
}
