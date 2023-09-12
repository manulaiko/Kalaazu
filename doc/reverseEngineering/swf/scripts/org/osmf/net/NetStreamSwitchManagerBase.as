package org.osmf.net {

import flash.events.EventDispatcher;

public class NetStreamSwitchManagerBase extends EventDispatcher {


    private var _autoSwitch: Boolean;

    private var _maxAllowedIndex: int;

    public function NetStreamSwitchManagerBase() {
        super();
        this._autoSwitch = true;
        this._maxAllowedIndex = int.MAX_VALUE;
    }

    public function get autoSwitch(): Boolean {
        return this._autoSwitch;
    }

    public function set autoSwitch(param1: Boolean): void {
        this._autoSwitch = param1;
    }

    public function get currentIndex(): uint {
        return 0;
    }

    public function get maxAllowedIndex(): int {
        return this._maxAllowedIndex;
    }

    public function set maxAllowedIndex(param1: int): void {
        this._maxAllowedIndex = param1;
    }

    public function switchTo(param1: int): void {
    }
}
}
