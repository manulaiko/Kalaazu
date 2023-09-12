package net.bigpoint.darkorbit.mvc.common.controller.assets {

import flash.system.System;

import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.mvc.common.model.assets.UnloadFinisherProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_181.class_1104;

import package_266.DOTexturesProxy;

import package_282.TexturesCache;

public class FileCollectionCleanupCommand extends SimpleCommand {


    public function FileCollectionCleanupCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        TexturesCache.cleanup();
        class_1104.clearCache();
        try {
            (facade.retrieveProxy(UnloadFinisherProxy.NAME) as UnloadFinisherProxy).unloadAllFinisher();
            (facade.retrieveProxy(DOTexturesProxy.NAME) as DOTexturesProxy).method_4991();
        } catch (e: Error) {
        }
        sendNotification(AssetNotifications.CLEAR_COLLECTION, AssetsProxy.ACHIEVEMENTS);
        sendNotification(AssetNotifications.CLEAR_COLLECTION, AssetsProxy.LOCALIZED);
        System.pauseForGCIfCollectionImminent(0.5);
    }
}
}
