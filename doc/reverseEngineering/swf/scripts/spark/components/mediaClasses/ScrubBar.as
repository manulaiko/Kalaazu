package spark.components.mediaClasses {

import flash.display.DisplayObjectContainer;
import flash.display.InteractiveObject;

import mx.core.IVisualElement;

import spark.components.HSlider;

public class ScrubBar extends HSlider {


    [SkinPart(required="false")]
    public var playedArea: IVisualElement;

    [SkinPart(required="false")]
    public var loadedRangeArea: IVisualElement;

    private var _loadedRangeEnd: Number;

    public function ScrubBar() {
        super();
        dataTipFormatFunction = this.formatTimeValue;
    }

    public function get loadedRangeEnd(): Number {
        return this._loadedRangeEnd;
    }

    public function set loadedRangeEnd(param1: Number): void {
        if (param1 == this._loadedRangeEnd) {
            return;
        }
        this._loadedRangeEnd = param1;
        invalidateDisplayList();
    }

    override protected function partAdded(param1: String, param2: Object): void {
        super.partAdded(param1, param2);
        if (param2 == this.playedArea) {
            if (this.playedArea is InteractiveObject) {
                InteractiveObject(this.playedArea).mouseEnabled = false;
            }
            if (this.playedArea is DisplayObjectContainer) {
                DisplayObjectContainer(this.playedArea).mouseChildren = false;
            }
            invalidateDisplayList();
        } else if (param2 == this.loadedRangeArea) {
            if (this.loadedRangeArea is InteractiveObject) {
                InteractiveObject(this.loadedRangeArea).mouseEnabled = false;
            }
            if (this.loadedRangeArea is DisplayObjectContainer) {
                DisplayObjectContainer(this.loadedRangeArea).mouseChildren = false;
            }
            invalidateDisplayList();
        }
    }

    private function calculateAreaSize(param1: Number): Number {
        var _loc2_: Number = track.getLayoutBoundsX();
        var _loc3_: Number = track.getLayoutBoundsWidth();
        var _loc4_: Number = thumb.getLayoutBoundsWidth();
        var _loc5_: Number;
        var _loc6_: Number = (_loc5_ = maximum - minimum) > 0 ? (param1 - minimum) * ((_loc3_ - _loc4_) / _loc5_) : 0;
        return _loc4_ + _loc6_;
    }

    override protected function updateSkinDisplayList(): void {
        super.updateSkinDisplayList();
        if (!thumb || !track) {
            return;
        }
        this.sizeLoadedRangeArea(this.calculateAreaSize(this.loadedRangeEnd));
        this.sizePlayedArea(this.calculateAreaSize(pendingValue));
    }

    protected function sizeLoadedRangeArea(param1: Number): void {
        if (this.loadedRangeArea) {
            this.loadedRangeArea.setLayoutBoundsSize(Math.round(param1), NaN);
        }
    }

    protected function sizePlayedArea(param1: Number): void {
        if (this.playedArea) {
            this.playedArea.setLayoutBoundsSize(Math.round(param1), NaN);
        }
    }

    private function formatTimeValue(param1: Number): String {
        var _loc2_: uint = Math.floor(param1 / 3600) % 24;
        var _loc3_: uint = Math.floor(param1 / 60) % 60;
        var _loc4_: uint = Math.round(param1) % 60;
        var _loc5_: * = "";
        if (_loc2_ != 0) {
            _loc5_ = _loc2_ + ":";
        }
        if (Boolean(_loc5_) && _loc3_ < 10) {
            _loc5_ += "0" + _loc3_ + ":";
        } else {
            _loc5_ += _loc3_ + ":";
        }
        if (_loc4_ < 10) {
            _loc5_ += "0" + _loc4_;
        } else {
            _loc5_ += _loc4_;
        }
        return _loc5_;
    }
}
}
