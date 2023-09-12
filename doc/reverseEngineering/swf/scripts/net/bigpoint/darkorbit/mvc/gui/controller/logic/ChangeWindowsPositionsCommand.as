package net.bigpoint.darkorbit.mvc.gui.controller.logic {

import com.bigpoint.utils.class_73;

import flash.geom.Rectangle;

import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_46.class_131;

import package_84.class_243;

public class ChangeWindowsPositionsCommand extends class_243 {


    public function ChangeWindowsPositionsCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        for (_loc2_ in guiManager.windows) {
            _loc3_ = guiManager.windows[_loc2_] as class_131;
            _loc4_ = guiProxy.getFeatureWindowById(_loc3_.id);
            _loc5_ = name_47.name_118;
            _loc6_ = _loc4_.size;
            _loc7_ = _loc4_.position;
            _loc8_ = ScreenScaleUtils.getRealPosFromPercentagePos(_loc5_, _loc6_, _loc7_);
            if (_loc3_.maximized) {
                _loc3_.x = _loc8_.x;
                _loc3_.y = _loc8_.y;
            }
        }
        sendNotification(GuiNotifications.SAVE_BARS_SETTINGS);
    }

    protected function get stageRectangle(): Rectangle {
        return new Rectangle(0, 0, name_47.stageWidth, name_47.stageHeight);
    }
}
}
