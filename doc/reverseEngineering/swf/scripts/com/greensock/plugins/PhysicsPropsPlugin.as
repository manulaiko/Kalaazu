package com.greensock.plugins {

import com.greensock.TweenLite;
import com.greensock.core.SimpleTimeline;

public class PhysicsPropsPlugin extends TweenPlugin {

    public static const API: Number = 1;


    protected var _tween: TweenLite;

    protected var _target: Object;

    protected var _props: Array;

    protected var _hasFriction: Boolean;

    protected var _step: uint;

    protected var _stepsPerTimeUnit: uint = 30;

    public function PhysicsPropsPlugin() {
        super();
        this.propName = "physicsProps";
        this.overwriteProps = [];
    }

    override public function onInitTween(param1: Object, param2: *, param3: TweenLite): Boolean {
        var _loc5_: * = null;
        var _loc6_: * = null;
        this._target = param1;
        this._tween = param3;
        this._step = 0;
        var _loc4_: SimpleTimeline = this._tween.timeline;
        while (_loc4_.timeline) {
            _loc4_ = _loc4_.timeline;
        }
        if (_loc4_ == TweenLite.rootFramesTimeline) {
            this._stepsPerTimeUnit = 1;
        }
        this._props = [];
        var _loc7_: Number = 0;
        for (_loc5_ in param2) {
            if (Boolean((_loc6_ = param2[_loc5_]).velocity) || Boolean(_loc6_.acceleration)) {
                var _loc10_: *;
                this._props[_loc10_ = _loc7_++] = new PhysicsProp(_loc5_, Number(param1[_loc5_]), _loc6_.velocity, _loc6_.acceleration, _loc6_.friction, this._stepsPerTimeUnit);
                this.overwriteProps[_loc7_] = _loc5_;
                if (_loc6_.friction) {
                    this._hasFriction = true;
                }
            }
        }
        return true;
    }

    override public function killProps(param1: Object): void {
        var _loc2_: int = this._props.length;
        while (_loc2_--) {
            if (this._props[_loc2_].property in param1) {
                this._props.splice(_loc2_, 1);
            }
        }
        super.killProps(param1);
    }

    override public function set changeFactor(param1: Number): void {
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: Number = NaN;
        var _loc8_: int = 0;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc2_: int = this._props.length;
        var _loc3_: Number = this._tween.cachedTime;
        var _loc4_: * = [];
        if (this._hasFriction) {
            _loc6_ = int(_loc3_ * this._stepsPerTimeUnit) - this._step;
            _loc7_ = _loc3_ * this._stepsPerTimeUnit % 1;
            if (_loc6_ >= 0) {
                while (_loc2_--) {
                    _loc5_ = this._props[_loc2_];
                    _loc8_ = _loc6_;
                    while (_loc8_--) {
                        _loc5_.v += _loc5_.a;
                        _loc5_.v *= _loc5_.friction;
                        _loc5_.value += _loc5_.v;
                    }
                    _loc4_[_loc2_] = _loc5_.value + _loc5_.v * _loc7_;
                }
            } else {
                while (_loc2_--) {
                    _loc5_ = this._props[_loc2_];
                    _loc8_ = -_loc6_;
                    while (_loc8_--) {
                        _loc5_.value -= _loc5_.v;
                        _loc5_.v /= _loc5_.friction;
                        _loc5_.v -= _loc5_.a;
                    }
                    _loc4_[_loc2_] = _loc5_.value + _loc5_.v * _loc7_;
                }
            }
            this._step += _loc6_;
        } else {
            _loc9_ = _loc3_ * _loc3_ * 0.5;
            while (_loc2_--) {
                _loc5_ = this._props[_loc2_];
                _loc4_[_loc2_] = _loc5_.start + (_loc5_.velocity * _loc3_ + _loc5_.acceleration * _loc9_);
            }
        }
        _loc2_ = this._props.length;
        if (!this.round) {
            while (_loc2_--) {
                this._target[PhysicsProp(this._props[_loc2_]).property] = Number(_loc4_[_loc2_]);
            }
        } else {
            while (_loc2_--) {
                _loc10_ = Number(_loc4_[_loc2_]);
                this._target[PhysicsProp(this._props[_loc2_]).property] = _loc10_ > 0 ? int(_loc10_ + 0.5) : int(_loc10_ - 0.5);
            }
        }
    }
}
}

class PhysicsProp {


    public var property: String;

    public var start: Number;

    public var velocity: Number;

    public var acceleration: Number;

    public var friction: Number;

    public var v: Number;

    public var a: Number;

    public var value: Number;

    function PhysicsProp(param1: String, param2: Number, param3: Number, param4: Number, param5: Number, param6: uint) {
        super();
        this.property = param1;
        this.start = this.value = param2;
        this.velocity = param3 || false;
        this.v = Number(this.velocity) / param6;
        if (Boolean(param4) || param4 == 0) {
            this.acceleration = param4;
            this.a = this.acceleration / (param6 * param6);
        } else {
            this.acceleration = this.a = 0;
        }
        this.friction = Boolean(param5) || param5 == 0 ? 1 - param5 : 1;
    }
}
