package package_222 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_446;

import package_84.class_243;

public class class_1448 extends class_243 {


    public function class_1448() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_446 = param1.getBody() as class_446;
        name_47.minimap.method_845(_loc2_.uid);
    }
}
}
