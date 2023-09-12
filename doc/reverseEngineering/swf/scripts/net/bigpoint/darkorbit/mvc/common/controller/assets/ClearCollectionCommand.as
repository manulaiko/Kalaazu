package net.bigpoint.darkorbit.mvc.common.controller.assets {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class ClearCollectionCommand extends SimpleCommand {


    public function ClearCollectionCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: String = param1.getBody() as String;
        var _loc3_: AssetsProxy = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
        _loc3_.clearFileCollection(_loc2_);
    }
}
}
