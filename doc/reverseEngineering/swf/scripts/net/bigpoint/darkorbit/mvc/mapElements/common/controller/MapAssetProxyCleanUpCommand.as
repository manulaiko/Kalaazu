package net.bigpoint.darkorbit.mvc.mapElements.common.controller {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_108.GroupProxy;

import package_84.class_243;

public class MapAssetProxyCleanUpCommand extends class_243 {


    public function MapAssetProxyCleanUpCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: GroupProxy = facade.retrieveProxy(GroupProxy.NAME) as GroupProxy;
        if (_loc2_) {
            _loc2_.method_3586(-1, "");
        }
    }
}
}
