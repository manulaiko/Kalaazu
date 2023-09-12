package net.bigpoint.darkorbit.mvc.gui.controller.logic {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_39.class_100;

public class CloseKillscreenCommand extends SimpleCommand {


    public function CloseKillscreenCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_100 = class_100.getInstance();
        if (_loc2_.method_503) {
            _loc2_.method_4332();
        }
    }
}
}
