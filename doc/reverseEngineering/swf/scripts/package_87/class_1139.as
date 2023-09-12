package package_87 {

import flash.events.Event;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_13.class_51;

import package_16.class_56;

import package_84.class_1134;

import package_95.class_1685;

public class class_1139 extends class_1134 {


    public function class_1139() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_51 = param1.getBody() as class_51;
        facade.registerCommand(class_56.const_2687, class_1685);
        _loc2_.main.forwardEventDispatch(new Event(Event.COMPLETE));
        commandComplete();
    }
}
}
