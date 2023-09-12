package net.bigpoint.darkorbit.mvc.common.controller.net {

import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class NetControllerPrepCommand extends SimpleCommand implements ICommand {


    public function NetControllerPrepCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        facade.registerCommand(ConnectionNotifications.SEND_COMMAND, SendCommandCommand);
        facade.registerCommand(ConnectionNotifications.SEND_NETTY_REQUEST, SendNettyRequest);
    }
}
}
