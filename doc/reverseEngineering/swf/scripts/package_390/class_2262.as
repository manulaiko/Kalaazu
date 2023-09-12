package package_390 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_392.class_2265;

import package_448.class_2506;

public class class_2262 extends class_2261 {


    public function class_2262() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: Array = param1.getBody() as Array;
        var _loc3_: class_2265 = _loc2_[0];
        var _loc4_: String = _loc2_[1];
        var _loc5_: class_2506;
        if (_loc5_ = _loc3_.content.method_882(_loc4_)) {
            method_348(_loc5_.command, _loc3_);
            method_2496(_loc5_);
        }
    }
}
}
