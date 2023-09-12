package net.bigpoint.darkorbit.mvc.gui.controller.requests {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_450;

import package_84.class_243;

public class SendWindowUpdateRequest extends class_243 {


    public function SendWindowUpdateRequest() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc5_: * = null;
        var _loc2_: IWindow = param1.getBody() as IWindow;
        var _loc3_: class_73 = ScreenScaleUtils.getPercentagePosFromRealPos(name_47.name_118, _loc2_.position, _loc2_.size);
        var _loc4_: FeatureWindowVO;
        (_loc4_ = guiProxy.getFeatureWindowById(_loc2_.id)).update(_loc3_, _loc2_.size, _loc2_.maximized);
        sendNotification(GuiNotifications.TOGGLE_ALL_WINDOWS, _loc4_);
        if (_loc4_.saveSettingsOnServer) {
            _loc5_ = new class_450(_loc4_.id, _loc4_.position.x, _loc4_.position.y, _loc4_.size.x, _loc4_.size.y, _loc4_.maximized);
            connectionProxy.sendNettyRequest(_loc5_);
        }
    }
}
}
