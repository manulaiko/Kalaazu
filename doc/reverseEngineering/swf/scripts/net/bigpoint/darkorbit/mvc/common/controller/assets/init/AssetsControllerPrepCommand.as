package net.bigpoint.darkorbit.mvc.common.controller.assets.init {

import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.common.controller.assets.ClearCollectionCommand;
import net.bigpoint.darkorbit.mvc.common.controller.assets.LazyLoadAssetCommand;
import net.bigpoint.darkorbit.mvc.common.controller.assets.LoadAssetCommand;
import net.bigpoint.darkorbit.mvc.common.controller.assets.LoadExternalCommand;

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_98.MapNotification;

public class AssetsControllerPrepCommand extends SimpleCommand implements ICommand {


    public function AssetsControllerPrepCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        facade.registerCommand(AssetNotifications.LOAD_ASSET, LoadAssetCommand);
        facade.registerCommand(AssetNotifications.CLEAR_COLLECTION, ClearCollectionCommand);
        facade.registerCommand(AssetNotifications.LOAD_EXTERNAL, LoadExternalCommand);
        facade.registerCommand(AssetNotifications.PRELOAD_LIST, PreloadListCommand);
        facade.registerCommand(AssetNotifications.LAZY_LOAD_ASSET, LazyLoadAssetCommand);
        facade.registerCommand(MapNotification.CLEANUP, CleanUpAssetsProxy);
    }
}
}
