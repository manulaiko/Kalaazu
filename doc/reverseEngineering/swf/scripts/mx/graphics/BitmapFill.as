package mx.graphics {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.events.EventDispatcher;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.geom.CompoundTransform;
import mx.utils.MatrixUtil;

public class BitmapFill extends EventDispatcher implements IFill {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const RADIANS_PER_DEGREES: Number = 0;

    private static var transformMatrix: Matrix = new Matrix();


    private var nonRepeatAlphaSource: BitmapData;

    private var _bitmapData: BitmapData;

    private var regenerateNonRepeatSource: Boolean = true;

    private var lastBoundsWidth: Number = 0;

    private var lastBoundsHeight: Number = 0;

    private var applyAlphaMultiplier: Boolean = false;

    private var nonRepeatSourceCreated: Boolean = false;

    private var bitmapDataCreated: Boolean = false;

    private var _alpha: Number = 1;

    protected var compoundTransform: CompoundTransform;

    private var _originX: Number = 0;

    private var _originY: Number = 0;

    protected var _fillMode: String = "scale";

    private var _rotation: Number = 0;

    private var _scaleX: Number;

    private var _scaleY: Number;

    private var _source: Object;

    private var _smooth: Boolean = false;

    private var _transformX: Number = 0;

    private var _transformY: Number = 0;

    private var _x: Number;

    private var _y: Number;

    public function BitmapFill() {
        super();
    }

    public function get alpha(): Number {
        return this._alpha;
    }

    public function set alpha(param1: Number): void {
        var _loc3_: * = null;
        if (this._alpha == param1) {
            return;
        }
        var _loc2_: Number = this._alpha;
        this._alpha = param1;
        this.applyAlphaMultiplier = true;
        if (this._bitmapData && !this._bitmapData.transparent && this._alpha < 1 && _loc2_ == 1) {
            _loc3_ = this._source;
            this._source = null;
            this.source = _loc3_;
        }
        this.dispatchFillChangedEvent("alpha", _loc2_, param1);
    }

    public function get matrix(): Matrix {
        return !!this.compoundTransform ? this.compoundTransform.matrix : null;
    }

    public function set matrix(param1: Matrix): void {
        var _loc2_: Matrix = this.matrix;
        var _loc3_: Number = this.x;
        var _loc4_: Number = this.y;
        var _loc5_: Number = this.rotation;
        var _loc6_: Number = this.scaleX;
        var _loc7_: Number = this.scaleY;
        if (param1 == null) {
            this.compoundTransform = null;
        } else {
            if (this.compoundTransform == null) {
                this.compoundTransform = new CompoundTransform();
            }
            this.compoundTransform.matrix = param1;
            this.dispatchFillChangedEvent("x", _loc3_, this.compoundTransform.x);
            this.dispatchFillChangedEvent("y", _loc4_, this.compoundTransform.y);
            this.dispatchFillChangedEvent("scaleX", _loc6_, this.compoundTransform.scaleX);
            this.dispatchFillChangedEvent("scaleY", _loc7_, this.compoundTransform.scaleY);
            this.dispatchFillChangedEvent("rotation", _loc5_, this.compoundTransform.rotationZ);
        }
    }

    [Bindable("propertyChange")]
    public function get originX(): Number {
        return this.transformX;
    }

    public function set originX(param1: Number): void {
        this.transformX = param1;
    }

    [Bindable("propertyChange")]
    public function get originY(): Number {
        return this.transformY;
    }

    public function set originY(param1: Number): void {
        this.transformY = param1;
    }

    [Bindable("propertyChange")]
    public function get offsetX(): Number {
        return isNaN(this.x) ? 0 : this.x;
    }

    public function set offsetX(param1: Number): void {
        var _loc2_: Number = isNaN(this.x) ? 0 : this.x;
        this.x = param1;
        this.dispatchFillChangedEvent("offsetX", _loc2_, param1);
    }

    [Bindable("propertyChange")]
    public function get offsetY(): Number {
        return isNaN(this.y) ? 0 : this.y;
    }

    public function set offsetY(param1: Number): void {
        var _loc2_: Number = isNaN(this.y) ? 0 : this.y;
        this.y = param1;
        this.dispatchFillChangedEvent("offsetY", _loc2_, param1);
    }

    [Bindable("propertyChange")]
    public function get repeat(): Boolean {
        return this._fillMode == BitmapFillMode.REPEAT;
    }

    public function set repeat(param1: Boolean): void {
        var _loc2_: * = this._fillMode == BitmapFillMode.REPEAT;
        if (param1 != _loc2_) {
            this.fillMode = param1 ? "null" : BitmapFillMode.SCALE;
            this.dispatchFillChangedEvent("repeat", _loc2_, param1);
        }
    }

    public function get fillMode(): String {
        return this._fillMode;
    }

    public function set fillMode(param1: String): void {
        var _loc2_: String = this._fillMode;
        if (param1 != this._fillMode) {
            this._fillMode = param1;
            this.dispatchFillChangedEvent("fillMode", _loc2_, param1);
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
            this.dispatchFillChangedEvent("rotation", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get scaleX(): Number {
        return !!this.compoundTransform ? this.compoundTransform.scaleX : this._scaleX;
    }

    public function set scaleX(param1: Number): void {
        var _loc2_: Number = NaN;
        if (param1 != this.scaleX) {
            _loc2_ = this.scaleX;
            if (this.compoundTransform) {
                if (!isNaN(param1)) {
                    this.compoundTransform.scaleX = param1;
                }
            } else {
                this._scaleX = param1;
            }
            this.dispatchFillChangedEvent("scaleX", _loc2_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get scaleY(): Number {
        return !!this.compoundTransform ? this.compoundTransform.scaleY : this._scaleY;
    }

    public function set scaleY(param1: Number): void {
        var _loc2_: Number = NaN;
        if (param1 != this.scaleY) {
            _loc2_ = this.scaleY;
            if (this.compoundTransform) {
                if (!isNaN(param1)) {
                    this.compoundTransform.scaleY = param1;
                }
            } else {
                this._scaleY = param1;
            }
            this.dispatchFillChangedEvent("scaleY", _loc2_, param1);
        }
    }

    public function get source(): Object {
        return this._source;
    }

    public function set source(param1: Object): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: Boolean = false;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (param1 != this._source) {
            _loc3_ = this._source;
            this._source = param1;
            _loc5_ = false;
            if (param1 is Class) {
                param1 = new (_loc6_ = Class(param1))();
                _loc5_ = true;
            }
            if (param1 is BitmapData) {
                _loc4_ = BitmapData(param1);
            } else if (param1 is Bitmap) {
                _loc4_ = param1.bitmapData;
            } else if (param1 is DisplayObject) {
                _loc2_ = param1 as DisplayObject;
            } else if (param1 != null) {
                return;
            }
            if (!_loc4_ && Boolean(_loc2_)) {
                (_loc4_ = new BitmapData(_loc2_.width, _loc2_.height, true, 0)).draw(_loc2_, new Matrix());
                _loc5_ = true;
            }
            if (_loc4_ && !_loc4_.transparent && this.alpha != 1) {
                (_loc7_ = new BitmapData(_loc4_.width, _loc4_.height, true)).draw(_loc4_);
                _loc5_ = true;
                _loc4_ = _loc7_;
            }
            this.setBitmapData(_loc4_, _loc5_);
            this.dispatchFillChangedEvent("source", _loc3_, param1);
        }
    }

    [Bindable("propertyChange")]
    public function get smooth(): Boolean {
        return this._smooth;
    }

    public function set smooth(param1: Boolean): void {
        var _loc2_: Boolean = this._smooth;
        if (param1 != _loc2_) {
            this._smooth = param1;
            this.dispatchFillChangedEvent("smooth", _loc2_, param1);
        }
    }

    public function get transformX(): Number {
        return !!this.compoundTransform ? this.compoundTransform.transformX : this._transformX;
    }

    public function set transformX(param1: Number): void {
        if (this.transformX == param1) {
            return;
        }
        var _loc2_: Number = this.transformX;
        if (this.compoundTransform) {
            this.compoundTransform.transformX = param1;
        } else {
            this._transformX = param1;
        }
        this.dispatchFillChangedEvent("transformX", _loc2_, param1);
    }

    public function get transformY(): Number {
        return !!this.compoundTransform ? this.compoundTransform.transformY : this._transformY;
    }

    public function set transformY(param1: Number): void {
        if (this.transformY == param1) {
            return;
        }
        var _loc2_: Number = this.transformY;
        if (this.compoundTransform) {
            this.compoundTransform.transformY = param1;
        } else {
            this._transformY = param1;
        }
        this.dispatchFillChangedEvent("transformY", _loc2_, param1);
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
            this.dispatchFillChangedEvent("x", _loc2_, param1);
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
            this.dispatchFillChangedEvent("y", _loc2_, param1);
        }
    }

    public function begin(param1: Graphics, param2: Rectangle, param3: Point): void {
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: * = null;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: * = null;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: * = null;
        var _loc4_: BitmapData;
        if (!(_loc4_ = this._bitmapData)) {
            return;
        }
        var _loc5_: * = this.fillMode == BitmapFillMode.REPEAT;
        if (Boolean(this.nonRepeatAlphaSource) && this.applyAlphaMultiplier) {
            this.nonRepeatAlphaSource.dispose();
            this.nonRepeatAlphaSource = null;
        }
        if (this.compoundTransform) {
            transformMatrix = this.compoundTransform.matrix;
            transformMatrix.translate(param3.x, param3.y);
        } else {
            _loc6_ = this.scaleX;
            _loc7_ = this.scaleY;
            if (this.fillMode == BitmapFillMode.SCALE) {
                if (isNaN(this.scaleX) && _loc4_.width > 0) {
                    _loc6_ = param2.width / _loc4_.width;
                }
                if (isNaN(this.scaleY) && _loc4_.height > 0) {
                    _loc7_ = param2.height / _loc4_.height;
                }
            }
            if (isNaN(_loc6_)) {
                _loc6_ = 1;
            }
            if (isNaN(_loc7_)) {
                _loc7_ = 1;
            }
            _loc8_ = !isNaN(this.x) ? this.x + param3.x : param2.left;
            _loc9_ = !isNaN(this.y) ? this.y + param3.y : param2.top;
            transformMatrix.identity();
            transformMatrix.translate(-this.transformX, -this.transformY);
            transformMatrix.scale(_loc6_, _loc7_);
            transformMatrix.rotate(this.rotation * RADIANS_PER_DEGREES);
            transformMatrix.translate(_loc8_ + this.transformX, _loc9_ + this.transformY);
        }
        if (_loc5_ || MatrixUtil.isDeltaIdentity(transformMatrix) && transformMatrix.tx == param2.left && transformMatrix.ty == param2.top && param2.width <= _loc4_.width && param2.height <= _loc4_.height) {
            if (Boolean(this.nonRepeatAlphaSource) && this.nonRepeatSourceCreated) {
                this.nonRepeatAlphaSource.dispose();
                this.nonRepeatAlphaSource = null;
                this.applyAlphaMultiplier = this.alpha != 1;
            }
            this.nonRepeatSourceCreated = false;
        } else if (this.fillMode == BitmapFillMode.CLIP) {
            if (this.regenerateNonRepeatSource || this.lastBoundsWidth != param2.width || this.lastBoundsHeight != param2.height) {
                if (this.nonRepeatAlphaSource) {
                    this.nonRepeatAlphaSource.dispose();
                }
                _loc10_ = new Point();
                _loc11_ = 0;
                _loc12_ = 0;
                transformMatrix.tx = 0;
                transformMatrix.ty = 0;
                _loc13_ = MatrixUtil.transformBounds(_loc4_.width, _loc4_.height, transformMatrix, _loc10_);
                _loc14_ = Math.ceil(_loc13_.x) + 2;
                _loc15_ = Math.ceil(_loc13_.y) + 2;
                transformMatrix.translate(1 - _loc10_.x, 1 - _loc10_.y);
                this.nonRepeatAlphaSource = new BitmapData(_loc14_, _loc15_, true, 16777215);
                this.nonRepeatAlphaSource.draw(_loc4_, transformMatrix, null, null, null, this.smooth);
                transformMatrix.identity();
                transformMatrix.translate(_loc11_ + _loc10_.x - 1, _loc12_ + _loc10_.y - 1);
                this.lastBoundsWidth = param2.width;
                this.lastBoundsHeight = param2.height;
                this.nonRepeatSourceCreated = true;
                this.applyAlphaMultiplier = this.alpha != 1;
            }
        }
        if (this.applyAlphaMultiplier) {
            if (!this.nonRepeatAlphaSource) {
                this.nonRepeatAlphaSource = _loc4_.clone();
            }
            (_loc16_ = new ColorTransform()).alphaMultiplier = this.alpha;
            this.nonRepeatAlphaSource.colorTransform(new Rectangle(0, 0, this.nonRepeatAlphaSource.width, this.nonRepeatAlphaSource.height), _loc16_);
            this.applyAlphaMultiplier = false;
        }
        if (this.nonRepeatAlphaSource) {
            _loc4_ = this.nonRepeatAlphaSource;
        }
        param1.beginBitmapFill(_loc4_, transformMatrix, _loc5_, this.smooth);
    }

    public function end(param1: Graphics): void {
        param1.endFill();
    }

    private function dispatchFillChangedEvent(param1: String, param2: *, param3: *): void {
        dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, param1, param2, param3));
        this.regenerateNonRepeatSource = true;
    }

    private function setBitmapData(param1: BitmapData, param2: Boolean = false): void {
        if (this._bitmapData) {
            if (this.bitmapDataCreated) {
                this._bitmapData.dispose();
            }
            this._bitmapData = null;
        }
        this.bitmapDataCreated = param2;
        this.applyAlphaMultiplier = this.alpha != 1;
        this._bitmapData = param1;
        this.dispatchFillChangedEvent("bitmapData", null, null);
    }
}
}
