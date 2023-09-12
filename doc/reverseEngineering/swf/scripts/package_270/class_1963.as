package package_270 {

import net.bigpoint.darkorbit.mvc.events.model.EventProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_132.class_382;

public class class_1963 extends SimpleCommand {


    public function class_1963() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: EventProxy = facade.retrieveProxy(EventProxy.NAME) as EventProxy;
        var _loc3_: class_382 = param1.getBody() as class_382;
        _loc2_.method_3722(_loc3_);
    }
}
}
