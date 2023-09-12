package package_86 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_260.class_1659;

public class class_1960 extends class_245 {


    public function class_1960() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: int = int((param1.getBody() as Array)[0]);
        var _loc3_: String = (param1.getBody() as Array)[1];
        var _loc4_: class_1659 = new class_1659(_loc3_, class_1659.const_539, _loc2_);
        method_435.method_4501(_loc4_);
    }
}
}
