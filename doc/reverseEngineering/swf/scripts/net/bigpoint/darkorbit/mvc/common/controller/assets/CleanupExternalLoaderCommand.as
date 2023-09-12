package net.bigpoint.darkorbit.mvc.common.controller.assets {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class CleanupExternalLoaderCommand extends SimpleCommand {


    public function CleanupExternalLoaderCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        super.execute(param1);
        if (facade.hasProxy(AssetsProxy.NAME)) {
            _loc2_ = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
            _loc2_.cleanupExternalLoader();
        }
    }
}
}
