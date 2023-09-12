package package_87 {

import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
import net.bigpoint.darkorbit.net.class_53;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_13.class_51;

public class class_247 extends AsyncCommand {


    public function class_247() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_51 = param1.getBody() as class_51;
        var _loc3_: class_53 = new class_53(_loc2_.main);
        var _loc4_: ConnectionProxy;
        (_loc4_ = facade.retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy).setData(_loc3_);
        commandComplete();
    }
}
}
