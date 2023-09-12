package package_221 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_220.class_1270;

import package_37.class_363;

import package_38.class_571;
import package_38.class_613;

public class class_1330 extends class_1270 {


    public function class_1330() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc3_: * = null;
        super.execute(param1);
        var _loc2_: class_613 = param1.getBody() as class_613;
        method_2479.method_3595(_loc2_.id, _loc2_.name_113.length, _loc2_.var_1633, _loc2_.var_1389.mode, 0);
        for each(_loc3_ in _loc2_.name_113) {
            class_363.execute(_loc3_);
        }
        method_2479.method_2568(_loc2_.var_4575);
    }
}
}
