package net.bigpoint.darkorbit.fui.components.core.layout {

import flash.display.DisplayObjectContainer;

import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;

public class AlignmentLayout extends AbstractAlignmentLayout implements ILayout {


    protected var _forceRedraws: Array;

    public function AlignmentLayout(param1: Array = null) {
        this._forceRedraws = [InvalidationType.POSITION, InvalidationType.SIZE];
        super();
        if (param1) {
            this._forceRedraws = param1;
        }
    }

    public function execute(param1: DisplayObjectContainer = null): void {
        var _loc4_: * = null;
        var _loc2_: uint = param1.numChildren;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (_loc4_ = param1.getChildAt(_loc3_) as ICoreponent) {
                _loc4_.setAlignmentActivation(Alignment.ACIVATE_HORIZONTAL, true);
                _loc4_.setAlignmentActivation(Alignment.ACIVATE_VERTICAL, true);
                _loc4_.forceRedraws(this._forceRedraws, true);
            }
            _loc3_++;
        }
    }
}
}
