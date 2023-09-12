package com.greensock.plugins {

import com.greensock.TweenLite;

public class DynamicPropsPlugin extends TweenPlugin {

    public static const API: Number = 1;


    protected var _tween: TweenLite;

    protected var _target: Object;

    protected var _props: Array;

    protected var _prevFactor: Number;

    protected var _prevTime: Number;

    public function DynamicPropsPlugin() {
        super();
        this.propName = "dynamicProps";
        this.overwriteProps = [];
        this._props = [];
    }

    override public function onInitTween(param1: Object, param2: *, param3: TweenLite): Boolean {
        var _loc5_: * = null;
        this._target = param3.target;
        this._tween = param3;
        var _loc4_: Object = param2.params || true;
        this._prevFactor = 0;
        this._prevTime = 0;
        for (_loc5_ in param2) {
            if (_loc5_ != "params") {
                this._props[this._props.length] = new DynamicProperty(this._target[_loc5_], _loc5_, param2[_loc5_] as Function, _loc4_[_loc5_]);
                this.overwriteProps[this.overwriteProps.length] = _loc5_;
            }
        }
        return true;
    }

    override public function killProps(param1: Object): void {
        var _loc2_: int = this._props.length;
        while (_loc2_--) {
            if (this._props[_loc2_].name in param1) {
                this._props.splice(_loc2_, 1);
            }
        }
        super.killProps(param1);
    }

    override public function set changeFactor(param1: Number): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        if (param1 != this._prevFactor) {
            _loc2_ = this._props.length;
            if (this._tween.cachedTime > this._prevTime) {
                _loc5_ = param1 == 1 || this._prevFactor == 1 ? 0 : 1 - (param1 - this._prevFactor) / (1 - this._prevFactor);
                while (_loc2_--) {
                    _loc3_ = this._props[_loc2_];
                    _loc4_ = !!_loc3_.params ? _loc3_.getter.apply(null, _loc3_.params) : _loc3_.getter();
                    this._target[_loc3_.name] = _loc4_ - (_loc4_ - Number(this._target[_loc3_.name])) * _loc5_;
                }
            } else {
                _loc5_ = param1 == 0 || this._prevFactor == 0 ? 0 : 1 - (param1 - this._prevFactor) / -this._prevFactor;
                while (_loc2_--) {
                    _loc3_ = this._props[_loc2_];
                    this._target[_loc3_.name] = _loc3_.start + (Number(this._target[_loc3_.name]) - _loc3_.start) * _loc5_;
                }
            }
            this._prevFactor = param1;
        }
        this._prevTime = this._tween.cachedTime;
    }
}
}

class DynamicProperty {


    public var start: Number;

    public var name: String;

    public var getter: Function;

    public var params: Array;

    function DynamicProperty(param1: Number, param2: String, param3: Function, param4: Array) {
        super();
        this.start = param1;
        this.name = param2;
        this.getter = param3;
        this.params = param4;
    }
}
