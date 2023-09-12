package package_409 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_327.PlagueWindowProxy;
import package_327.class_2275;

import package_84.class_1134;

public class class_2544 extends class_1134 {


    public function class_2544() {
        super();
    }

    override public function execute(param1: INotification): void {
        facade.removeCommand(param1.getName());
        registerProxy(new PlagueWindowProxy(new class_2275()));
        commandComplete();
    }
}
}
