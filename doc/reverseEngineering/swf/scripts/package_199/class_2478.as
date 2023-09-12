package package_199 {

import away3d.animators.class_2120;

import flash.events.Event;

import package_430.class_2399;

import package_431.class_2405;

public class class_2478 extends Event {

    public static const const_665: String = "playbackComplete";

    public static const const_2730: String = "transitionComplete";


    private var _animator: class_2120;

    private var var_4610: class_2399;

    private var var_3560: class_2405;

    public function class_2478(param1: String, param2: class_2120, param3: class_2399, param4: class_2405) {
        super(param1, false, false);
        this._animator = param2;
        this.var_4610 = param3;
        this.var_3560 = param4;
    }

    public function get animator(): class_2120 {
        return this._animator;
    }

    public function get animationState(): class_2399 {
        return this.var_4610;
    }

    public function get animationNode(): class_2405 {
        return this.var_3560;
    }

    override public function clone(): Event {
        return new class_2478(type, this._animator, this.var_4610, this.var_3560);
    }
}
}
