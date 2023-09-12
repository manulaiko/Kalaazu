package net.bigpoint.darkorbit.mvc.common.controller.net {

import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_37.ICommand;

public class SendNettyRequest extends SimpleCommand {


    public function SendNettyRequest() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: ConnectionProxy = facade.retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy;
        _loc2_.sendNettyRequest(param1.getBody() as ICommand);
    }
}
}
