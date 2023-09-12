package package_124 {

import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
import net.bigpoint.darkorbit.net.class_53;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_38.class_488;

public class class_1283 extends SimpleCommand {


    public function class_1283() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_488 = param1.getBody() as class_488;
        var _loc3_: class_53 = (facade.retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy).connectionManager;
        _loc3_.method_2707();
    }
}
}
