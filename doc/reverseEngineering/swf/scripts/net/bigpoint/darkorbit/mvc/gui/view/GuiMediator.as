package net.bigpoint.darkorbit.mvc.gui.view {

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;
import net.bigpoint.darkorbit.mvc.gui.model.vo.SetWindowProgressVisibilityVO;
import net.bigpoint.darkorbit.mvc.gui.model.vo.VideoWindowVO;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_11.class_39;

import package_254.StatsMediator;

import package_31.class_92;

import package_46.class_131;

public class GuiMediator extends class_92 {

    public static const NAME: String = "GuiMediator";


    private var _guiManager: class_58;

    public function GuiMediator(param1: class_9) {
        super(NAME, param1);
        this._guiManager = this.view.guiManager = new class_58(this.view);
    }

    override public function onRegister(): void {
        guiProxy.guiManager = this._guiManager;
        registerMediator(new StatsMediator(this.view.stage));
    }

    override public function listNotificationInterests(): Array {
        return [GuiNotifications.WRITE_TO_LOG, GuiNotifications.CREATE_WINDOW, GuiNotifications.CLOSE_WINDOW_BY_ID, GuiNotifications.DELETE_WINDOW_BY_ID, GuiNotifications.WRITE_NOTIFICATION, GuiNotifications.CREATE_VIDEO_WINDOW, GuiNotifications.REMOVE_VIDEO_WINDOW, GuiNotifications.SHOW_NEXT_PAGE_OF_VIDEO_WINDOW, GuiNotifications.SHOW_CONNECTION_WINDOW, GuiNotifications.SET_UI_FINISHER, GuiNotifications.MINIMIZE_WINDOW_BY_ID, GuiNotifications.UPDATE_MODAL_WINDOWS, GuiNotifications.SET_WINDOW_PROGESS_OVERLAY_VISIBILITY];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        switch (param1.getName()) {
            case GuiNotifications.SET_WINDOW_PROGESS_OVERLAY_VISIBILITY:
                this.setWindowProgressOverlayVisibility(param1);
                break;
            case GuiNotifications.WRITE_TO_LOG:
                _loc4_ = param1.getBody() as LogMessageVO;
                this._guiManager.writeToLog(_loc4_.message, _loc4_.messageProfileType);
                break;
            case GuiNotifications.CREATE_WINDOW:
                _loc2_ = String(param1.getBody());
                this._guiManager.createWindow(_loc2_);
                break;
            case GuiNotifications.CLOSE_WINDOW_BY_ID:
                _loc2_ = String(param1.getBody());
                _loc3_ = this._guiManager.method_468(_loc2_);
                this._guiManager.closeWindow(_loc3_ as class_131);
                break;
            case GuiNotifications.MINIMIZE_WINDOW_BY_ID:
                _loc2_ = String(param1.getBody());
                _loc3_ = this._guiManager.method_468(_loc2_);
                if (_loc3_) {
                    _loc3_.minimize();
                    break;
                }
                break;
            case GuiNotifications.DELETE_WINDOW_BY_ID:
                _loc2_ = String(param1.getBody());
                this._guiManager.method_1705(_loc2_);
                break;
            case GuiNotifications.WRITE_NOTIFICATION:
                _loc5_ = String(param1.getBody());
                this._guiManager.method_4761(_loc5_);
                break;
            case GuiNotifications.CREATE_VIDEO_WINDOW:
                _loc6_ = param1.getBody() as VideoWindowVO;
                this._guiManager.createVideoWindow(_loc6_.languageKeys, _loc6_.videoWindowId, _loc6_.videoId, _loc6_.videoClassId, _loc6_.showButtons, _loc6_.align, _loc6_.width, _loc6_.height);
                break;
            case GuiNotifications.REMOVE_VIDEO_WINDOW:
                _loc7_ = int(param1.getBody());
                _loc2_ = GuiConstants.VIDEO_WINDOW + _loc7_;
                this._guiManager.removeVideoWindow(_loc2_);
                break;
            case GuiNotifications.SHOW_NEXT_PAGE_OF_VIDEO_WINDOW:
                _loc2_ = String(param1.getBody());
                this._guiManager.showNextPageOfVideoWindow(_loc2_);
                break;
            case GuiNotifications.SHOW_CONNECTION_WINDOW:
                this._guiManager.showConnectionWindow();
                break;
            case GuiNotifications.SET_UI_FINISHER:
                _loc8_ = param1.getBody() as class_39;
                this._guiManager.method_5163(_loc8_);
                break;
            case GuiNotifications.UPDATE_MODAL_WINDOWS:
                this._guiManager.method_6045();
        }
    }

    protected function setWindowProgressOverlayVisibility(param1: INotification): void {
        var _loc2_: SetWindowProgressVisibilityVO = param1.getBody() as SetWindowProgressVisibilityVO;
        var _loc3_: IWindow = this.getWindowById(_loc2_.windowId);
        if (_loc2_.visibility) {
            _loc3_.showInProgressOverlay();
        } else {
            _loc3_.hideInProgressOverlay();
        }
    }

    public function get view(): class_9 {
        return viewComponent as class_9;
    }

    public function getWindowById(param1: String): IWindow {
        return this._guiManager.method_468(param1);
    }
}
}
