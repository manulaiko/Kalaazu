package mx.states {

import flash.events.EventDispatcher;

import mx.core.mx_internal;
import mx.events.FlexEvent;

public class State extends EventDispatcher {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var initialized: Boolean = false;

    public var basedOn: String;

    public var name: String;

    public var overrides: Array;

    public var stateGroups: Array;

    public function State(param1: Object = null) {
        var _loc2_: * = null;
        this.overrides = [];
        this.stateGroups = [];
        super();
        for (_loc2_ in param1) {
            this[_loc2_] = param1[_loc2_];
        }
    }

    mx_internal function initialize(): void {
        var _loc1_: int = 0;
        if (!this.initialized) {
            this.initialized = true;
            _loc1_ = 0;
            while (_loc1_ < this.overrides.length) {
                IOverride(this.overrides[_loc1_]).initialize();
                _loc1_++;
            }
        }
    }

    mx_internal function dispatchEnterState(): void {
        if (hasEventListener(FlexEvent.ENTER_STATE)) {
            dispatchEvent(new FlexEvent(FlexEvent.ENTER_STATE));
        }
    }

    mx_internal function dispatchExitState(): void {
        if (hasEventListener(FlexEvent.EXIT_STATE)) {
            dispatchEvent(new FlexEvent(FlexEvent.EXIT_STATE));
        }
    }
}
}
