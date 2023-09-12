package package_204 {

import net.bigpoint.darkorbit.gui.class_194;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
import net.bigpoint.darkorbit.mvc.gui.model.GuiProxy;

import package_17.class_62;

import package_37.class_170;

import package_38.class_498;

public class class_1221 extends class_170 {


    public function class_1221() {
        super();
    }

    public static function run(param1: class_498): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: class_194 = class_194.getInstance();
        if (_loc2_.method_977()) {
            _loc2_.closeWindow(null);
            _loc3_ = class_62.getInstance();
            (_loc5_ = (_loc4_ = _loc3_.retrieveProxy(GuiProxy.NAME) as GuiProxy).getFeatureWindowById(GuiConstants.SHIP_WARP_WINDOW)).maximized = false;
            _loc3_.sendNotification(FeaturesMenuNotifications.UPDATE_BTNS_SELECTIONS);
        }
    }
}
}
