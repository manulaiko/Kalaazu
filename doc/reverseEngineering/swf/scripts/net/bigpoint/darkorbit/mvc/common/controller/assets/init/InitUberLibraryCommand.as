package net.bigpoint.darkorbit.mvc.common.controller.assets.init {

import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;

import package_84.class_1134;

public class InitUberLibraryCommand extends class_1134 implements ICommand {


    public function InitUberLibraryCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        UberAssetsLib.instance.init(commandComplete);
    }
}
}
