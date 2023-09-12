package net.bigpoint.darkorbit.fui.system.manager {

import net.bigpoint.darkorbit.fui.components.core.interfaces.IFocusable;

public class FocusManager implements IFocusManager {


    private var _currentFocusedTarget: Object;

    public function FocusManager() {
        super();
    }

    public function getFocus(): Object {
        return this._currentFocusedTarget;
    }

    public function setFocus(param1: Object): void {
        if (param1 === this._currentFocusedTarget) {
            this._unfocusedInstance(this._currentFocusedTarget);
            this._currentFocusedTarget = param1;
            this._focusedInstance(this._currentFocusedTarget);
        }
    }

    protected function _focusedInstance(param1: Object): void {
        var _loc2_: IFocusable = param1 as IFocusable;
        if (_loc2_) {
            _loc2_.focused();
        }
    }

    protected function _unfocusedInstance(param1: Object): void {
        var _loc2_: IFocusable = param1 as IFocusable;
        if (_loc2_) {
            _loc2_.unfocused();
        }
    }
}
}
