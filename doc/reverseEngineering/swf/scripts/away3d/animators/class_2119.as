package away3d.animators {

import away3d.arcane;

import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Vector3D;
import flash.utils.Dictionary;
import flash.utils.getTimer;

import package_199.class_2434;

import package_293.class_1749;
import package_293.class_1751;
import package_293.class_2131;

import package_304.class_2114;

import package_430.class_2399;
import package_430.class_2400;

import package_431.class_2405;

public class class_2119 extends class_1749 implements class_1751 {


    private var var_1024: Sprite;

    private var _isPlaying: Boolean;

    private var var_1786: Boolean = true;

    private var var_141: class_2434;

    private var var_3715: class_2434;

    private var var_535: class_2434;

    private var _time: int;

    private var var_57: Number = 1;

    protected var var_1183: class_2234;

    protected var var_2146: Vector.<class_2114>;

    protected var var_4381: class_2405;

    protected var var_1036: class_2399;

    protected var var_203: String;

    private var var_2900: Dictionary;

    public var updatePosition: Boolean = true;

    private var var_2423: int;

    public function class_2119(param1: class_2234) {
        this.var_1024 = new Sprite();
        this.var_2146 = new Vector.<class_2114>();
        this.var_2900 = new Dictionary(true);
        super();
        this.var_1183 = param1;
    }

    public function method_3412(param1: class_2405): class_2400 {
        var _loc2_: Class = param1.method_1634;
        var _loc3_: * = this.var_2900[param1] || new _loc2_(this, param1);
        this.var_2900[param1] = this.var_2900[param1] || new _loc2_(this, param1);
        return _loc3_;
    }

    public function method_1258(param1: String): class_2400 {
        return this.method_3412(this.var_1183.method_1957(param1));
    }

    public function get animationSet(): class_2234 {
        return this.var_1183;
    }

    public function get activeState(): class_2399 {
        return this.var_1036;
    }

    public function get method_149(): class_2405 {
        return this.var_1183.method_1957(this.var_203);
    }

    public function get method_5903(): String {
        return this.var_203;
    }

    public function get method_4101(): Boolean {
        return this.var_1786;
    }

    public function set method_4101(param1: Boolean): void {
        if (this.var_1786 == param1) {
            return;
        }
        this.var_1786 = param1;
        if (this.var_1786) {
            this.start();
        } else {
            this.stop();
        }
    }

    public function get time(): int {
        return this._time;
    }

    public function set time(param1: int): void {
        if (this._time == param1) {
            return;
        }
        this._time = param1;
        if (this.var_1036) {
            this.var_1036.time = this._time;
            if (this.updatePosition) {
                this.method_5752();
            }
        }
    }

    public function get playbackSpeed(): Number {
        return this.var_57;
    }

    public function set playbackSpeed(param1: Number): void {
        this.var_57 = param1;
    }

    public function start(): void {
        if (Boolean(this._isPlaying) || !this.var_1786) {
            return;
        }
        this._time = 0;
        this._isPlaying = true;
        if (!this.var_1024.hasEventListener(Event.ENTER_FRAME)) {
            this.var_2423 = getTimer();
            this.var_1024.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        if (!hasEventListener(class_2434.START)) {
            return;
        }
        var _loc1_: * = this.var_141 || new class_2434(class_2434.START, this);
        this.var_141 = this.var_141 || new class_2434(class_2434.START, this);
        dispatchEvent(_loc1_);
    }

    public function stop(): void {
        if (!this._isPlaying) {
            return;
        }
        this._isPlaying = false;
        if (this.var_1024.hasEventListener(Event.ENTER_FRAME)) {
            this.var_1024.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        if (!hasEventListener(class_2434.STOP)) {
            return;
        }
        dispatchEvent(this.var_3715 || (this.var_3715 = new class_2434(class_2434.STOP, this)));
    }

    public function reset(param1: String, param2: Number = 0): void {
        this.time = 0;
        this.method_3412(this.var_1183.method_1957(param1)).time = 0;
    }

    public function method_3466(param1: class_2114): void {
        this.var_2146.push(param1);
    }

    public function method_4342(param1: class_2114): void {
        this.var_2146.splice(this.var_2146.indexOf(param1), 1);
    }

    private function onEnterFrame(param1: Event = null): void {
        this.time = this._time + (getTimer() - Number(this.var_2423)) * Number(this.var_57);
        this.var_2423 = getTimer();
    }

    private function method_5752(): void {
        var _loc3_: * = 0;
        var _loc4_: Number = 0;
        var _loc1_: Vector3D = this.var_1036.method_5121;
        var _loc2_: Number = _loc1_.length;
        if (_loc2_ > 0) {
            _loc3_ = uint(this.var_2146.length);
            _loc4_ = 0;
            while (_loc4_ < _loc3_) {
                this.var_2146[_loc4_].method_3564(_loc1_, _loc2_);
                _loc4_++;
            }
        }
    }

    public function dispatchCycleEvent(): void {
        if (hasEventListener(class_2434.const_1722)) {
            dispatchEvent(this.var_535 || (this.var_535 = new class_2434(class_2434.const_1722, this)));
        }
    }

    public function dispose(): void {
    }

    public function get assetType(): String {
        return class_2131.const_700;
    }
}
}
