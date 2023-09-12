package net.bigpoint.darkorbit.mvc.common.controller.assets.init {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_23.FileCollectionEvent;

public class InitFileCollectionBaseCommand extends AsyncCommand {


    public function InitFileCollectionBaseCommand() {
        super();
    }

    protected function get assetsProxy(): AssetsProxy {
        return facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
    }

    protected function onError(param1: FileCollectionEvent): void {
    }
}
}
