package net.bigpoint.darkorbit.mvc.common.controller.assets {

import net.bigpoint.darkorbit.mvc.common.AssetNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class InitUnloadFinisherCommand extends SimpleCommand {


    public function InitUnloadFinisherCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        facade.registerCommand(AssetNotifications.ADD_UNLOAD_FINISHER, AddUnloadFinisherCommand);
    }
}
}
