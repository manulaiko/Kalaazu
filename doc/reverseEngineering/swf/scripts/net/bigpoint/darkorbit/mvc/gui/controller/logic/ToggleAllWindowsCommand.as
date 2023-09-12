package net.bigpoint.darkorbit.mvc.gui.controller.logic {

import net.bigpoint.darkorbit.gui.class_194;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_450;

import package_46.class_131;

import package_84.class_243;

public class ToggleAllWindowsCommand extends class_243 {


    public function ToggleAllWindowsCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: FeatureWindowVO = param1.getBody() as FeatureWindowVO;
        if (true) {
            if (_loc2_) {
                if (_loc2_.maximized) {
                    guiProxy.addVisibleWindow(_loc2_);
                } else {
                    guiProxy.removeVisibleWindow(_loc2_);
                }
            } else {
                this.toggleAllVisibleWindows(true);
            }
        } else if (_loc2_) {
            this.clearListAndSaveState();
            if (_loc2_.maximized) {
                guiProxy.addVisibleWindow(_loc2_);
            } else {
                guiProxy.removeVisibleWindow(_loc2_);
            }
            guiProxy.hideAllWindows = false;
            sendNotification(GuiNotifications.SAVE_BARS_SETTINGS);
        } else {
            this.toggleAllVisibleWindows(false);
        }
    }

    private function clearListAndSaveState(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        for each(_loc1_ in guiProxy.featureWindows) {
            _loc1_.toggleMaximize = false;
            _loc1_.maximized = false;
            if (_loc1_.saveSettingsOnServer) {
                _loc2_ = new class_450(_loc1_.id, _loc1_.position.x, _loc1_.position.y, _loc1_.size.x, _loc1_.size.y, _loc1_.maximized);
                connectionProxy.sendNettyRequest(_loc2_);
            }
        }
        guiProxy.visibleWindows = new Vector.<FeatureWindowVO>();
    }

    private function toggleAllVisibleWindows(param1: Boolean): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        this.resetToogleMaximizedInfo();
        if (!param1) {
            this.updateCurrentlyVisibleWinowsList();
        }
        for each(_loc2_ in guiProxy.visibleWindows) {
            _loc3_ = guiProxy.getWindowById(_loc2_.id);
            if (_loc3_) {
                if (param1) {
                    _loc3_.maximize(false);
                } else {
                    _loc3_.minimize(false);
                }
                _loc2_.toggleMaximize = param1;
            }
        }
        if (param1) {
            class_194.getInstance().method_1522();
        } else {
            class_194.getInstance().closeWindow(null, true);
        }
    }

    private function updateCurrentlyVisibleWinowsList(): void {
        var _loc1_: * = null;
        guiProxy.visibleWindows = new Vector.<FeatureWindowVO>();
        for each(_loc1_ in guiProxy.featureWindows) {
            if (_loc1_.saveSettingsOnServer) {
                if (_loc1_.maximized) {
                    guiProxy.addVisibleWindow(_loc1_);
                }
            }
        }
    }

    private function resetToogleMaximizedInfo(): void {
        var _loc1_: * = null;
        for each(_loc1_ in guiProxy.featureWindows) {
            _loc1_.toggleMaximize = false;
        }
    }
}
}
