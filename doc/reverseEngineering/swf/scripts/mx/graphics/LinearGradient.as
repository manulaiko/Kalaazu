package mx.graphics {

import flash.display.GradientType;
import flash.display.Graphics;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.mx_internal;

public class LinearGradient extends GradientBase implements IFill {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var commonMatrix: Matrix = new Matrix();


    private var _scaleX: Number;

    public function LinearGradient() {
        super();
    }

    override public function set matrix(param1: Matrix): void {
        this.scaleX = NaN;
        super.matrix = param1;
    }

    [Bindable("propertyChange")]
    public function get scaleX(): Number {
        return !!compoundTransform ? 0 : this._scaleX;
    }

    public function set scaleX(param1: Number): void {
        var _loc2_: Number = NaN;
        if (param1 != this.scaleX) {
            _loc2_ = this.scaleX;
            if (compoundTransform) {
                if (!isNaN(param1)) {
                    compoundTransform.scaleX = param1;
                }
            } else {
                this._scaleX = param1;
            }
            mx_internal::dispatchGradientChangedEvent("scaleX", _loc2_, param1);
        }
    }

    public function begin(param1: Graphics, param2: Rectangle, param3: Point): void {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        commonMatrix.identity();
        if (!compoundTransform) {
            _loc4_ = x;
            _loc5_ = y;
            _loc6_ = this.scaleX;
            if (isNaN(_loc6_)) {
                if (rotation % 90 != 0) {
                    if ((_loc7_ = rotation % 360) < 0) {
                        _loc7_ += 360;
                    }
                    if ((_loc7_ %= 180) > 90) {
                        _loc7_ = 180 - _loc7_;
                    }
                    _loc8_ = param2.width;
                    _loc9_ = Math.sqrt(param2.width * param2.width + param2.height * param2.height);
                    _loc10_ = Math.acos(param2.width / _loc9_) * 180 / 0;
                    if (_loc7_ > _loc10_) {
                        _loc7_ = 90 - _loc7_;
                        _loc8_ = param2.height;
                    }
                    _loc6_ = _loc8_ / Math.cos(_loc7_ / 180 * 0);
                } else {
                    _loc6_ = rotation % 180 == 0 ? param2.width : param2.height;
                }
            }
            if (!isNaN(_loc4_) && isNaN(_loc5_)) {
                _loc5_ = 0;
            } else if (isNaN(_loc4_) && !isNaN(_loc5_)) {
                _loc4_ = 0;
            }
            if (!isNaN(_loc4_) && !isNaN(_loc5_)) {
                commonMatrix.translate(GRADIENT_DIMENSION / 2, GRADIENT_DIMENSION / 2);
            }
            if (_loc6_ >= 0 && _loc6_ < 2) {
                _loc6_ = 2;
            } else if (_loc6_ < 0 && _loc6_ > -2) {
                _loc6_ = -2;
            }
            commonMatrix.scale(_loc6_ / GRADIENT_DIMENSION, 1 / GRADIENT_DIMENSION);
            commonMatrix.rotate(!isNaN(mx_internal::_angle) ? Number(mx_internal::_angle) : Number(mx_internal::rotationInRadians));
            if (isNaN(_loc4_)) {
                _loc4_ = param2.left + param2.width / 2;
            } else {
                _loc4_ += param3.x;
            }
            if (isNaN(_loc5_)) {
                _loc5_ = param2.top + param2.height / 2;
            } else {
                _loc5_ += param3.y;
            }
            commonMatrix.translate(_loc4_, _loc5_);
        } else {
            commonMatrix.translate(GRADIENT_DIMENSION / 2, GRADIENT_DIMENSION / 2);
            commonMatrix.scale(1 / GRADIENT_DIMENSION, 1 / GRADIENT_DIMENSION);
            commonMatrix.concat(compoundTransform.matrix);
            commonMatrix.translate(param3.x, param3.y);
        }
        param1.beginGradientFill(GradientType.LINEAR, mx_internal::colors, mx_internal::alphas, mx_internal::ratios, commonMatrix, spreadMethod, interpolationMethod);
    }

    public function end(param1: Graphics): void {
        param1.endFill();
    }
}
}
