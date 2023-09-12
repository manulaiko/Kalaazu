package package_212 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_259.class_1658;

import package_260.class_1659;

import package_38.class_499;
import package_38.class_929;

public class class_1334 extends class_1240 {


    public function class_1334() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_499 = param1.getBody() as class_499;
        var _loc3_: Vector.<class_1659> = method_4097(new <class_929>[new class_929(_loc2_)]);
        sendNotification(class_1658.const_1562, _loc3_[0]);
    }

    override protected function method_262(): void {
    }
}
}
