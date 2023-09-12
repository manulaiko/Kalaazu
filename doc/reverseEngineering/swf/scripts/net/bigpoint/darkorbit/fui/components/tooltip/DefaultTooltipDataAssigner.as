package net.bigpoint.darkorbit.fui.components.tooltip {

import flash.text.TextFieldAutoSize;

import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
import net.bigpoint.darkorbit.fui.components.text.label.Label;
import net.bigpoint.darkorbit.fui.components.text.label.LabelSkin;

public class DefaultTooltipDataAssigner implements ITooltipDataAssigner {

    protected static const DEFAULT_LABEL_INSTANCE_NAME: String = "label";

    protected static const DEFAULT_BACKGROUND_INSTANCE_NAME: String = "background";


    private var _target: Coreponent;

    private var _data: Object;

    private var _maxWidth: Number = 180;

    public function DefaultTooltipDataAssigner() {
        super();
    }

    public function get data(): Object {
        return this._data;
    }

    public function set data(param1: Object): void {
        this._data = param1;
    }

    public function set target(param1: Coreponent): void {
        this._target = param1;
    }

    public function hasTarget(): Boolean {
        return this._target != null;
    }

    public function assign(): void {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        var _loc3_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        _loc3_ = this._target.getChildByName(DEFAULT_LABEL_INSTANCE_NAME) as Label;
        if (_loc3_) {
            _loc5_ = String(this._data);
            _loc3_.text = _loc5_;
            _loc3_.forceRedraw(InvalidationType.SIZE);
            _loc1_ = _loc3_.width;
            _loc2_ = _loc3_.height;
            if (_loc1_ > this._maxWidth) {
                (_loc6_ = _loc3_.skin as LabelSkin).textField.multiline = true;
                _loc6_.textField.autoSize = TextFieldAutoSize.LEFT;
                _loc6_.textField.wordWrap = true;
                _loc3_.width = this._maxWidth;
                _loc3_.forceRedraw(InvalidationType.SIZE);
                _loc1_ = _loc3_.width;
                _loc2_ = _loc3_.height;
            }
        }
        var _loc4_: Coreponent;
        if (_loc4_ = this._target.getChildByName(DEFAULT_BACKGROUND_INSTANCE_NAME) as Coreponent) {
            if (_loc1_ > 0 && _loc2_ > 0) {
                _loc4_.width = _loc1_;
                _loc4_.height = _loc2_;
                _loc4_.forceRedraw(InvalidationType.SIZE);
            }
        }
    }

    public function set maxWidth(param1: Number): void {
        this._maxWidth = param1;
    }

    public function dispose(): void {
    }

    public function get target(): Coreponent {
        return this._target;
    }
}
}
