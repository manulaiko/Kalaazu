package package_257 {

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;

import package_184.TraininggroundsProxy;

import package_84.class_243;

public class class_1656 extends class_243 implements ICommand {


    public function class_1656() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: TraininggroundsProxy = facade.retrieveProxy(TraininggroundsProxy.NAME) as TraininggroundsProxy;
        _loc2_.method_1950();
    }
}
}
