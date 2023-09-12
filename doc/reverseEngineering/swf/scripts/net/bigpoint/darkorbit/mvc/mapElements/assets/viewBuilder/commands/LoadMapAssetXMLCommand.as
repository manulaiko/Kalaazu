package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.commands {

import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.ViewCreateDTO;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_38;

import package_9.ResourceManager;

public class LoadMapAssetXMLCommand extends AsyncCommand {


    public function LoadMapAssetXMLCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc3_: * = null;
        super.execute(param1);
        var _loc2_: ViewCreateDTO = param1.getBody() as ViewCreateDTO;
        if (_loc2_.xmlData) {
            commandComplete();
        } else {
            if (_loc2_.clearCache) {
                _loc3_ = ResourceManager.name_15.getFinisher(_loc2_.xml);
                if (_loc3_) {
                    _loc3_.dispose();
                }
            }
            sendNotification(AssetNotifications.LOAD_ASSET, [_loc2_.xml, this.handleXMLLoaded]);
        }
    }

    private function handleXMLLoaded(param1: class_38): void {
        commandComplete();
    }
}
}
