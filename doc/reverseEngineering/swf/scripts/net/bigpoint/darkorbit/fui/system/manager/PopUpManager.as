package net.bigpoint.darkorbit.fui.system.manager {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Stage;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.geom.Point;
import flash.utils.clearTimeout;
import flash.utils.setTimeout;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
import net.bigpoint.darkorbit.fui.components.core.data.IDataReceptible;

public class PopUpManager implements IPopUpManager {

    private static const RESIZE_DELAY: int = 250;


    private var _resizeTimeout: int;

    private var _popupLayer: DisplayObjectContainer;

    public function PopUpManager(param1: DisplayObjectContainer) {
        super();
        this._popupLayer = param1;
        UISystem.getInstance().stage.addEventListener(Event.RESIZE, this.handleStageResizeEvent);
    }

    public function removeAll(): void {
        while (this._popupLayer.numChildren > 0) {
            this._popupLayer.removeChildAt(0);
        }
    }

    public function add(param1: DisplayObject): void {
        this.removeAll();
        this._popupLayer.addChild(param1);
    }

    public function remove(param1: DisplayObject): void {
        if (this._popupLayer.contains(param1)) {
            this._popupLayer.removeChild(param1);
        }
    }

    public function getCurrentPopup(): DisplayObject {
        if (this._popupLayer.numChildren > 0) {
            this._popupLayer.getChildAt(0);
        }
        return null;
    }

    protected function handleStageResizeEvent(param1: Event): void {
        clearTimeout(this._resizeTimeout);
        this._resizeTimeout = setTimeout(this.handleStageResized, RESIZE_DELAY);
    }

    protected function handleStageResized(): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        clearTimeout(this._resizeTimeout);
        this._resizeTimeout = 0;
        var _loc1_: Stage = UISystem.getInstance().stage;
        var _loc2_: * = _loc1_.displayState != StageDisplayState.NORMAL;
        var _loc3_: Number = _loc2_ ? _loc1_.fullScreenWidth : _loc1_.stageWidth;
        var _loc4_: Number = _loc2_ ? _loc1_.fullScreenHeight : _loc1_.stageHeight;
        var _loc5_: ICoreponent;
        if (_loc5_ = this.getCurrentPopup() as ICoreponent) {
            if (_loc6_ = _loc5_ as IDataReceptible) {
                if (_loc7_ = _loc6_.data as ICoreponent) {
                    _loc8_ = _loc7_.globalPosition;
                    _loc5_.x = _loc8_.x;
                    _loc5_.y = _loc8_.y;
                    _loc5_.forceRedraw(InvalidationType.POSITION);
                }
            }
        }
    }
}
}
