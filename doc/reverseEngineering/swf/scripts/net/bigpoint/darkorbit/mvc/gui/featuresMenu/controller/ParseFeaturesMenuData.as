package net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.abstract.model.vo.AbstractMenuBarVO;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.FeaturesMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureBarVO;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureItemVO;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_722;
import package_38.class_736;
import package_38.class_864;
import package_38.class_865;

import package_84.class_243;

public class ParseFeaturesMenuData extends class_243 {


    public function ParseFeaturesMenuData() {
        super();
    }

    override public function execute(param1: INotification): void {
        this.parseData(param1.getBody() as class_722);
    }

    private function parseData(param1: class_722): void {
        var _loc2_: * = null;
        this.menuProxy.menuBars = new Vector.<AbstractMenuBarVO>();
        for each(_loc2_ in param1.var_3926) {
            this.menuProxy.menuBars.push(this.parseFeatureBar(_loc2_));
        }
        sendNotification(FeaturesMenuNotifications.DATA_READY);
        sendNotification(FeaturesMenuNotifications.CHECK_BOUNDS_AND_SAVE_POS);
    }

    private function parseFeatureBar(param1: class_736): FeatureBarVO {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc2_: Vector.<FeatureItemVO> = new Vector.<FeatureItemVO>();
        var _loc3_: int = int(param1.var_5035.length);
        var _loc4_: String = FeaturesMenuConstants.MENUS_ID_MAP[param1.var_1484];
        var _loc5_: int = 0;
        while (_loc5_ != _loc3_) {
            _loc7_ = param1.var_5035[_loc5_] as class_864;
            _loc8_ = this.getFeatureWindow(_loc7_);
            _loc9_ = new FeatureItemVO(_loc7_.itemId, _loc4_, _loc7_.visible, _loc7_.toolTip, _loc8_);
            _loc2_.push(_loc9_);
            this.updateWindowVisibility(_loc9_);
            if (_loc8_) {
                if (_loc9_.visible && _loc8_.maximized) {
                    guiProxy.addVisibleWindow(_loc8_);
                } else if (!_loc9_.visible || !_loc8_.maximized) {
                    guiProxy.removeVisibleWindow(_loc8_);
                }
            }
            _loc5_++;
        }
        var _loc6_: class_73 = ParserUtility.parseStringCords(param1.var_2939)[0];
        return new FeatureBarVO(_loc4_, GuiConstants.LAYOUTS_MAP[int(param1.var_1153)], _loc6_, _loc2_);
    }

    private function getFeatureWindow(param1: class_864): FeatureWindowVO {
        var _loc2_: FeatureWindowVO = guiProxy.getFeatureWindowById(param1.itemId);
        var _loc3_: class_865 = param1 as class_865;
        if (Boolean(_loc3_) && Boolean(_loc2_)) {
            _loc2_.update(new class_73(_loc3_.var_4787, _loc3_.var_2295), new class_73(_loc3_.width, _loc3_.height), _loc3_.maximized, _loc3_.var_1711, _loc3_.helpText, _loc3_.toolTip);
            _loc2_.saveSettingsOnServer = true;
        }
        return _loc2_;
    }

    private function updateWindowVisibility(param1: FeatureItemVO): void {
        var _loc4_: Boolean = false;
        var _loc2_: IWindow = guiManager.windows[param1.id] as IWindow;
        var _loc3_: FeatureWindowVO = param1.featureWindowVO;
        if (_loc3_) {
            if (_loc2_) {
                if (_loc4_ = (!param1.visible || !param1.featureWindowVO.maximized) && _loc2_.maximized) {
                    _loc2_.minimize(false, true);
                } else if (param1.visible && param1.featureWindowVO.maximized && !_loc2_.maximized) {
                    _loc2_.maximize(false);
                }
            }
        }
    }

    private function get menuProxy(): FeaturesMenuProxy {
        return facade.retrieveProxy(FeaturesMenuProxy.NAME) as FeaturesMenuProxy;
    }
}
}
