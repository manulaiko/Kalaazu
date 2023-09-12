package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.logic {

import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.ManageConfigModeCommand;

import org.puremvc.as3.multicore.interfaces.INotification;

public class ConfigModeCommand extends ManageConfigModeCommand {


    public function ConfigModeCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        manageConfigMode(menuProxy.configMode);
    }
}
}
