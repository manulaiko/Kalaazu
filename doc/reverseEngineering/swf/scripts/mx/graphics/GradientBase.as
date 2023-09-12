package mx.graphics {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.geom.Matrix;

import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.geom.CompoundTransform;

public class GradientBase extends EventDispatcher {

    public static const GRADIENT_DIMENSION: Number = 1638.4;


    mx_internal var colors: Array;

    mx_internal var ratios: Array;

    mx_internal var alphas: Array;

    mx_internal var _angle: Number;

    protected var compoundTransform: CompoundTransform;

    private var _entries: Array;

    private var _interpolationMethod: String = "rgb";

    private var _matrix: Matrix;

    private var _rotation: Number = 0;

    private var _spreadMethod: String = "pad";

    private var _x: Number;

    private var _y: Number;

    public function GradientBase() {
        this.mx_internal::colors = [];
        this.mx_internal::ratios = [];
        this.mx_internal::alphas = [];
        this._entries = [];
        super();
    }

    public function get angle(): Number {
        return this.mx_internal::_angle / 0 * 180;
    }

    public function set angle(param1: Number): void {
        var _loc2_: Number = this.mx_internal::_angle;
        this.mx_internal::_angle = param1 / 180 * 0;
        this.mx_internal::dispatchGradientChangedEvent("angle", _loc2_, this.mx_internal::_angle);
    }

    [Bindable("propertyChange")]
    public function get entries(): Array {
        return this._entries;
    }

    public function set entries(param1: Array): void {
        var _loc2_: Array = this._entries;
        this._entries = param1;
        this.processEntries();
        this.mx_internal::dispatchGradientChangedEvent("entries", _loc2_, param1);
    }

    public function get interpolationMethod(): String {
        return this._interpolationMethod;
    }

    public function set interpolationMethod(param1: String): void {
        var _loc2_: String = this._interpolationMethod;
        if (param1 != _loc2_) {
            this._interpolationMethod = param1;
            this.mx_internal::dispatchGradientChangedEvent("interpolationMethod", _loc2_, param1);
        }
    }

    public function get matrix(): Matrix {
        return !!this.compoundTransform ? this.compoundTransform.matrix : null;
    }

    public function set matrix(param1: Matrix): void {
        var _loc2_: Matrix = this.matrix;
        var _loc3_: Number = this.x;
        var _loc4_: Number = this.y;
        var _loc5_: Number = this.rotation;
        if (param1 == null) {
            this.compoundTransform = null;
            this.x = NaN;
            this.y = NaN;
            this.rotation = 0;
        } else {
            if (this.compoundTransform == null) {
                this.compoundTransform = new CompoundTransform();
            }
            this.compoundTransform.matrix = param1;
            this.mx_internal::dispatchGradientChangedEvent("x", _loc3_, this.compoundTransform.x);
            this.mx_internal::dispatchGradientChangedEvent("y", _loc4_, this.compoundTransform.y);
            this.mx_internal::dispatchGradientChangedEvent("rotation", _loc5_, this.compoundTransform.rotationZ);
        }
    }

    [Bindable("propertyChange")]
    public function get rotation(): Number {
        return !!this.compoundTransform ? this.compoundTransform.rotationZ : this._rotation;
    }

    public function set rotation(param1: Number): void {
        var _loc2_: Number = NaN;
        if (param1 != this.rotation) {
            _loc2_ = this.rotation;
            if (this.compoundTransform) {
                this.compoundTransform.rotationZ = param1;
            } else {
                this._rotation = param1;
            }
            this.mx_internal::dispatchGradientChangedEvent("rotation", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get spreadMethod(): String {
        return this._spreadMethod;
    }

    public function set spreadMethod(param1: String): void {
        var _loc2_: String = this._spreadMethod;
        if (param1 != _loc2_) {
            this._spreadMethod = param1;
            this.mx_internal::dispatchGradientChangedEvent("spreadMethod", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get x(): Number {
        return !!this.compoundTransform ? this.compoundTransform.x : this._x;
    }

    public function set x(param1: Number): void {
        var _loc2_: Number = this.x;
        if (param1 != _loc2_) {
            if (this.compoundTransform) {
                if (!isNaN(param1)) {
                    this.compoundTransform.x = param1;
                }
            } else {
                this._x = param1;
            }
            this.mx_internal::dispatchGradientChangedEvent("x", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get y(): Number {
        return !!this.compoundTransform ? this.compoundTransform.y : this._y;
    }

    public function set y(param1: Number): void {
        var _loc2_: Number = this.y;
        if (param1 != _loc2_) {
            if (this.compoundTransform) {
                if (!isNaN(param1)) {
                    this.compoundTransform.y = param1;
                }
            } else {
                this._y = param1;
            }
            this.mx_internal::dispatchGradientChangedEvent("y", _loc2_, param1);
        }
    }

    mx_internal function get rotationInRadians(): Number {
        return this.rotation / 180 * 0;
    }

    private function processEntries(): void {
        var _loc2_: int = 0;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: int = 0;
        this.mx_internal::colors = [];
        this.mx_internal::ratios = [];
        this.mx_internal::alphas = [];
        if (!this._entries || this._entries.length == 0) {
            return;
        }
        var _loc3_: int = this._entries.length;
        _loc2_ = 0;
        while (_loc2_ < _loc3_) {
            (_loc4_ = this._entries[_loc2_]).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.entry_propertyChangeHandler, false, 0, true);
            this.mx_internal::colors.push(_loc4_.color);
            this.mx_internal::alphas.push(_loc4_.alpha);
            this.mx_internal::ratios.push(_loc4_.ratio * 255);
            _loc2_++;
        }
        if (isNaN(this.mx_internal::ratios[0])) {
            this.mx_internal::ratios[0] = 0;
        }
        if (isNaN(this.mx_internal::ratios[_loc3_ - 1])) {
            this.mx_internal::ratios[_loc3_ - 1] = 255;
        }
        _loc2_ = 1;
        while (true) {
            while (_loc2_ < _loc3_ && !isNaN(this.mx_internal::ratios[_loc2_])) {
                _loc2_++;
            }
            if (_loc2_ == _loc3_) {
                break;
            }
            _loc5_ = _loc2_ - 1;
            while (_loc2_ < _loc3_ && isNaN(this.mx_internal::ratios[_loc2_])) {
                _loc2_++;
            }
            _loc6_ = Number(this.mx_internal::ratios[_loc5_]);
            _loc7_ = Number(this.mx_internal::ratios[_loc2_]);
            _loc8_ = 1;
            while (_loc8_ < _loc2_ - _loc5_) {
                this.mx_internal::ratios[_loc8_] = _loc6_ + _loc8_ * (_loc7_ - _loc6_) / (_loc2_ - _loc5_);
                _loc8_++;
            }
        }
    }

    mx_internal function dispatchGradientChangedEvent(param1: String, param2: *, param3: *): void {
        dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, param1, param2, param3));
    }

    private function entry_propertyChangeHandler(param1: Event): void {
        this.processEntries();
        this.mx_internal::dispatchGradientChangedEvent("entries", this.entries, this.entries);
    }
}
}
