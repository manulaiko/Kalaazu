package mx.graphics {

import flash.display.GradientType;
import flash.display.Graphics;
import flash.display.GraphicsGradientFill;
import flash.display.GraphicsStroke;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.mx_internal;

public class LinearGradientStroke extends GradientStroke {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var commonMatrix: Matrix = new Matrix();


    private var _scaleX: Number;

    public function LinearGradientStroke(param1: Number = 1, param2: Boolean = false, param3: String = "normal", param4: String = "round", param5: String = "round", param6: Number = 3) {
        super(param1, param2, param3, param4, param5, param6);
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

    override public function apply(param1: Graphics, param2: Rectangle, param3: Point): void {
        commonMatrix.identity();
        param1.lineStyle(weight, 0, 1, pixelHinting, scaleMode, caps, joints, miterLimit);
        if (param2) {
            this.calculateTransformationMatrix(param2, commonMatrix, param3);
        }
        param1.lineGradientStyle(GradientType.LINEAR, mx_internal::colors, mx_internal::alphas, mx_internal::ratios, commonMatrix, spreadMethod, interpolationMethod);
    }

    override public function createGraphicsStroke(param1: Rectangle, param2: Point): GraphicsStroke {
        var _loc3_: GraphicsStroke = super.createGraphicsStroke(param1, param2);
        if (_loc3_) {
            GraphicsGradientFill(_loc3_.fill).type = GradientType.LINEAR;
            this.calculateTransformationMatrix(param1, commonMatrix, param2);
            GraphicsGradientFill(_loc3_.fill).matrix = commonMatrix;
        }
        return _loc3_;
    }

    private function calculateTransformationMatrix(param1: Rectangle, param2: Matrix, param3: Point): void {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        param2.identity();
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
                    _loc8_ = param1.width;
                    _loc9_ = Math.sqrt(param1.width * param1.width + param1.height * param1.height);
                    _loc10_ = Math.acos(param1.width / _loc9_) * 180 / 0;
                    if (_loc7_ > _loc10_) {
                        _loc7_ = 90 - _loc7_;
                        _loc8_ = param1.height;
                    }
                    _loc6_ = _loc8_ / Math.cos(_loc7_ / 180 * 0);
                } else {
                    _loc6_ = rotation % 180 == 0 ? param1.width : param1.height;
                }
            }
            if (!isNaN(_loc4_) && isNaN(_loc5_)) {
                _loc5_ = 0;
            } else if (isNaN(_loc4_) && !isNaN(_loc5_)) {
                _loc4_ = 0;
            }
            if (!isNaN(_loc4_) && !isNaN(_loc5_)) {
                param2.translate(GRADIENT_DIMENSION / 2, GRADIENT_DIMENSION / 2);
            }
            if (_loc6_ >= 0 && _loc6_ < 2) {
                _loc6_ = 2;
            } else if (_loc6_ < 0 && _loc6_ > -2) {
                _loc6_ = -2;
            }
            param2.scale(_loc6_ / GRADIENT_DIMENSION, 1 / GRADIENT_DIMENSION);
            param2.rotate(!isNaN(mx_internal::_angle) ? Number(mx_internal::_angle) : Number(mx_internal::rotationInRadians));
            if (isNaN(_loc4_)) {
                _loc4_ = param1.left + param1.width / 2;
            } else {
                _loc4_ += param3.x;
            }
            if (isNaN(_loc5_)) {
                _loc5_ = param1.top + param1.height / 2;
            } else {
                _loc5_ += param3.y;
            }
            param2.translate(_loc4_, _loc5_);
        } else {
            param2.translate(GRADIENT_DIMENSION / 2, GRADIENT_DIMENSION / 2);
            param2.scale(1 / GRADIENT_DIMENSION, 1 / GRADIENT_DIMENSION);
            param2.concat(compoundTransform.matrix);
            param2.translate(param3.x, param3.y);
        }
    }
}
}
