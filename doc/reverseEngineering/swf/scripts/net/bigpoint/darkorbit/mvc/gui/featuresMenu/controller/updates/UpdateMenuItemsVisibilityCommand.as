package net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.updates {

import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.FeaturesMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureItemVO;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_865;

import package_84.class_243;

public class UpdateMenuItemsVisibilityCommand extends class_243 {


    public function UpdateMenuItemsVisibilityCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_865 = param1.getBody() as class_865;
        var _loc3_: FeatureItemVO = this.menuProxy.getFeatureItemVOById(_loc2_.itemId);
        if (_loc3_.visible != _loc2_.visible) {
            _loc3_.visible = _loc2_.visible;
            sendNotification(FeaturesMenuNotifications.DATA_READY);
        }
    }

    protected function get menuProxy(): FeaturesMenuProxy {
        return retrieveProxy(FeaturesMenuProxy.NAME) as FeaturesMenuProxy;
    }
}
}
