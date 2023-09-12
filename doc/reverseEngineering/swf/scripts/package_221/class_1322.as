package package_221 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_220.class_1270;

import package_38.class_719;

public class class_1322 extends class_1270 {


    public function class_1322() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_719 = param1.getBody() as class_719;
        method_2479.method_4732(_loc2_.mode);
    }
}
}
