package mx.utils {

import flash.display.DisplayObject;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.PerspectiveProjection;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.geom.Utils3D;
import flash.geom.Vector3D;
import flash.system.ApplicationDomain;

import mx.core.mx_internal;

public final class MatrixUtil {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const RADIANS_PER_DEGREES: Number = 0;

    mx_internal static var SOLUTION_TOLERANCE: Number = 0.1;

    mx_internal static var MIN_MAX_TOLERANCE: Number = 0.1;

    private static var staticPoint: Point = new Point();

    private static var fakeDollarParent: QName;

    private static var uiComponentClass: Class;

    private static var uiMovieClipClass: Class;

    private static var usesMarshalling: Object;

    private static var lastModuleFactory: Object;

    private static var computedMatrixProperty: QName;

    private static var $transformProperty: QName;


    public function MatrixUtil() {
        super();
    }

    public static function clampRotation(param1: Number): Number {
        if (param1 > 180 || param1 < -180) {
            param1 %= 360;
            if (param1 > 180) {
                param1 -= 360;
            } else if (param1 < -180) {
                param1 += 360;
            }
        }
        return param1;
    }

    public static function transformPoint(param1: Number, param2: Number, param3: Matrix): Point {
        if (!param3) {
            staticPoint.x = param1;
            staticPoint.y = param2;
            return staticPoint;
        }
        staticPoint.x = param3.a * param1 + param3.c * param2 + param3.tx;
        staticPoint.y = param3.b * param1 + param3.d * param2 + param3.ty;
        return staticPoint;
    }

    public static function composeMatrix(param1: Number = 0, param2: Number = 0, param3: Number = 1, param4: Number = 1, param5: Number = 0, param6: Number = 0, param7: Number = 0): Matrix {
        var _loc8_: Matrix;
        (_loc8_ = new Matrix()).translate(-param6, -param7);
        _loc8_.scale(param3, param4);
        if (param5 != 0) {
            _loc8_.rotate(param5 / 180 * 0);
        }
        _loc8_.translate(param6 + param1, param7 + param2);
        return _loc8_;
    }

    public static function decomposeMatrix(param1: Vector.<Number>, param2: Matrix, param3: Number = 0, param4: Number = 0): void {
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc10_: * = null;
        _loc5_ = param2.a;
        _loc6_ = param2.b;
        param1[3] = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
        _loc7_ = param2.c;
        _loc8_ = param2.d;
        param1[4] = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_);
        var _loc9_: Number;
        if ((_loc9_ = _loc5_ * _loc8_ - _loc6_ * _loc7_) < 0) {
            param1[4] = -param1[4];
            _loc7_ = -_loc7_;
            _loc8_ = -_loc8_;
        }
        param1[2] = Math.atan2(_loc6_, _loc5_) / RADIANS_PER_DEGREES;
        if (param3 != 0 || param4 != 0) {
            _loc10_ = param2.transformPoint(new Point(param3, param4));
            param1[0] = _loc10_.x - param3;
            param1[1] = _loc10_.y - param4;
        } else {
            param1[0] = param2.tx;
            param1[1] = param2.ty;
        }
    }

    public static function rectUnion(param1: Number, param2: Number, param3: Number, param4: Number, param5: Rectangle): Rectangle {
        if (!param5) {
            return new Rectangle(param1, param2, param3 - param1, param4 - param2);
        }
        var _loc6_: Number = Math.min(param5.left, param1);
        var _loc7_: Number = Math.min(param5.top, param2);
        var _loc8_: Number = Math.max(param5.right, param3);
        var _loc9_: Number = Math.max(param5.bottom, param4);
        param5.x = _loc6_;
        param5.y = _loc7_;
        param5.width = _loc8_ - _loc6_;
        param5.height = _loc9_ - _loc7_;
        return param5;
    }

    public static function getEllipseBoundingBox(param1: Number, param2: Number, param3: Number, param4: Number, param5: Matrix, param6: Rectangle = null): Rectangle {
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc17_: * = null;
        var _loc7_: Number = param5.a;
        var _loc8_: Number = param5.b;
        var _loc9_: Number = param5.c;
        var _loc10_: Number = param5.d;
        if (param3 == 0 && param4 == 0) {
            _loc17_ = new Point(param1, param2);
            _loc17_ = param5.transformPoint(_loc17_);
            return rectUnion(_loc17_.x, _loc17_.y, _loc17_.x, _loc17_.y, param6);
        }
        if (_loc7_ * param3 == 0) {
            _loc11_ = 0;
        } else {
            _loc11_ = Math.atan(_loc9_ * param4 / (_loc7_ * param3));
        }
        if (_loc8_ * param3 == 0) {
            _loc12_ = 0;
        } else {
            _loc12_ = Math.atan(_loc10_ * param4 / (_loc8_ * param3));
        }
        var _loc13_: Number;
        var _loc14_: Number = -(_loc13_ = _loc7_ * Math.cos(_loc11_) * param3 + _loc9_ * Math.sin(_loc11_) * param4);
        _loc13_ += _loc7_ * param1 + _loc9_ * param2 + param5.tx;
        _loc14_ += _loc7_ * param1 + _loc9_ * param2 + param5.tx;
        var _loc15_: Number;
        var _loc16_: Number = -(_loc15_ = _loc8_ * Math.cos(_loc12_) * param3 + _loc10_ * Math.sin(_loc12_) * param4);
        _loc15_ += _loc8_ * param1 + _loc10_ * param2 + param5.ty;
        _loc16_ += _loc8_ * param1 + _loc10_ * param2 + param5.ty;
        return rectUnion(Math.min(_loc13_, _loc14_), Math.min(_loc15_, _loc16_), Math.max(_loc13_, _loc14_), Math.max(_loc15_, _loc16_), param6);
    }

    public static function getQBezierSegmentBBox(param1: Number, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number, param9: Matrix, param10: Rectangle): Rectangle {
        var _loc11_: * = null;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        var _loc21_: Number = NaN;
        param1 = (_loc11_ = MatrixUtil.transformPoint(param1 * param7, param2 * param8, param9)).x;
        param2 = _loc11_.y;
        param3 = (_loc11_ = MatrixUtil.transformPoint(param3 * param7, param4 * param8, param9)).x;
        param4 = _loc11_.y;
        param5 = (_loc11_ = MatrixUtil.transformPoint(param5 * param7, param6 * param8, param9)).x;
        param6 = _loc11_.y;
        var _loc12_: Number = Math.min(param1, param5);
        var _loc13_: Number = Math.max(param1, param5);
        var _loc14_: Number = Math.min(param2, param6);
        var _loc15_: Number = Math.max(param2, param6);
        var _loc16_: Number;
        if ((_loc16_ = param1 - 2 * param3 + param5) != 0) {
            _loc18_ = (param1 - param3) / _loc16_;
            if (0 <= _loc18_ && _loc18_ <= 1) {
                _loc19_ = (1 - _loc18_) * (1 - _loc18_) * param1 + 2 * _loc18_ * (1 - _loc18_) * param3 + _loc18_ * _loc18_ * param5;
                _loc12_ = Math.min(_loc19_, _loc12_);
                _loc13_ = Math.max(_loc19_, _loc13_);
            }
        }
        var _loc17_: Number;
        if ((_loc17_ = param2 - 2 * param4 + param6) != 0) {
            _loc20_ = (param2 - param4) / _loc17_;
            if (0 <= _loc20_ && _loc20_ <= 1) {
                _loc21_ = (1 - _loc20_) * (1 - _loc20_) * param2 + 2 * _loc20_ * (1 - _loc20_) * param4 + _loc20_ * _loc20_ * param6;
                _loc14_ = Math.min(_loc21_, _loc14_);
                _loc15_ = Math.max(_loc21_, _loc15_);
            }
        }
        return rectUnion(_loc12_, _loc14_, _loc13_, _loc15_, param10);
    }

    public static function transformSize(param1: Number, param2: Number, param3: Matrix): Point {
        var _loc4_: Number = param3.a;
        var _loc5_: Number = param3.b;
        var _loc6_: Number = param3.c;
        var _loc7_: Number = param3.d;
        var _loc10_: Number = param1 * _loc4_;
        var _loc11_: Number = param1 * _loc5_;
        var _loc12_: Number = param2 * _loc6_;
        var _loc13_: Number = param2 * _loc7_;
        var _loc14_: Number = _loc10_ + _loc12_;
        var _loc15_: Number = _loc11_ + _loc13_;
        var _loc16_: Number = Math.min(Math.min(0, _loc10_), Math.min(_loc12_, _loc14_));
        var _loc17_: Number = Math.max(Math.max(0, _loc10_), Math.max(_loc12_, _loc14_));
        var _loc18_: Number = Math.min(Math.min(0, _loc11_), Math.min(_loc13_, _loc15_));
        var _loc19_: Number = Math.max(Math.max(0, _loc11_), Math.max(_loc13_, _loc15_));
        staticPoint.x = _loc17_ - _loc16_;
        staticPoint.y = _loc19_ - _loc18_;
        return staticPoint;
    }

    public static function transformBounds(param1: Number, param2: Number, param3: Matrix, param4: Point = null): Point {
        var _loc21_: Number = NaN;
        var _loc22_: Number = NaN;
        var _loc23_: Number = NaN;
        var _loc24_: Number = NaN;
        var _loc5_: Number = param3.a;
        var _loc6_: Number = param3.b;
        var _loc7_: Number = param3.c;
        var _loc8_: Number = param3.d;
        var _loc11_: Number = param1 * _loc5_;
        var _loc12_: Number = param1 * _loc6_;
        var _loc13_: Number = param2 * _loc7_;
        var _loc14_: Number = param2 * _loc8_;
        var _loc15_: Number = _loc11_ + _loc13_;
        var _loc16_: Number = _loc12_ + _loc14_;
        var _loc17_: Number = Math.min(Math.min(0, _loc11_), Math.min(_loc13_, _loc15_));
        var _loc18_: Number = Math.max(Math.max(0, _loc11_), Math.max(_loc13_, _loc15_));
        var _loc19_: Number = Math.min(Math.min(0, _loc12_), Math.min(_loc14_, _loc16_));
        var _loc20_: Number = Math.max(Math.max(0, _loc12_), Math.max(_loc14_, _loc16_));
        staticPoint.x = _loc18_ - _loc17_;
        staticPoint.y = _loc20_ - _loc19_;
        if (param4) {
            _loc21_ = param3.tx;
            _loc22_ = param3.ty;
            _loc23_ = param4.x;
            _loc24_ = param4.y;
            param4.x = _loc17_ + _loc5_ * _loc23_ + _loc6_ * _loc24_ + _loc21_;
            param4.y = _loc19_ + _loc7_ * _loc23_ + _loc8_ * _loc24_ + _loc22_;
        }
        return staticPoint;
    }

    public static function projectBounds(param1: Rectangle, param2: Matrix3D, param3: PerspectiveProjection): Rectangle {
        var _loc4_: Number = param3.projectionCenter.x;
        var _loc5_: Number = param3.projectionCenter.y;
        param2.appendTranslation(-_loc4_, -_loc5_, param3.focalLength);
        param2.append(param3.toMatrix3D());
        var _loc6_: Vector3D = new Vector3D(param1.left, param1.top, 0);
        var _loc7_: Vector3D = new Vector3D(param1.right, param1.top, 0);
        var _loc8_: Vector3D = new Vector3D(param1.left, param1.bottom, 0);
        var _loc9_: Vector3D = new Vector3D(param1.right, param1.bottom, 0);
        _loc6_ = Utils3D.projectVector(param2, _loc6_);
        _loc7_ = Utils3D.projectVector(param2, _loc7_);
        _loc8_ = Utils3D.projectVector(param2, _loc8_);
        _loc9_ = Utils3D.projectVector(param2, _loc9_);
        var _loc10_: Number = Math.max(Math.max(_loc6_.x, _loc7_.x), Math.max(_loc8_.x, _loc9_.x));
        var _loc11_: Number = Math.min(Math.min(_loc6_.x, _loc7_.x), Math.min(_loc8_.x, _loc9_.x));
        var _loc12_: Number = Math.max(Math.max(_loc6_.y, _loc7_.y), Math.max(_loc8_.y, _loc9_.y));
        var _loc13_: Number = Math.min(Math.min(_loc6_.y, _loc7_.y), Math.min(_loc8_.y, _loc9_.y));
        param1.x = _loc11_ + _loc4_;
        param1.y = _loc13_ + _loc5_;
        param1.width = _loc10_ - _loc11_;
        param1.height = _loc12_ - _loc13_;
        return param1;
    }

    public static function isDeltaIdentity(param1: Matrix): Boolean {
        return param1.a == 1 && param1.d == 1 && param1.b == 0 && param1.c == 0;
    }

    public static function fitBounds(param1: Number, param2: Number, param3: Matrix, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number, param9: Number, param10: Number, param11: Number): Point {
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: * = null;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        if (isNaN(param1) && isNaN(param2)) {
            return new Point(param6, param7);
        }
        var _loc12_: Number = param8 < mx_internal::MIN_MAX_TOLERANCE ? 0 : param8 - mx_internal::MIN_MAX_TOLERANCE;
        var _loc13_: Number = param9 < mx_internal::MIN_MAX_TOLERANCE ? 0 : param9 - mx_internal::MIN_MAX_TOLERANCE;
        var _loc14_: Number = param10 + mx_internal::MIN_MAX_TOLERANCE;
        var _loc15_: Number = param11 + mx_internal::MIN_MAX_TOLERANCE;
        if (!isNaN(param1) && !isNaN(param2)) {
            if (!(_loc16_ = calcUBoundsToFitTBounds(param1, param2, param3, _loc12_, _loc13_, _loc14_, _loc15_))) {
                if (_loc17_ = fitTBoundsWidth(param1, param3, param4, param5, param6, param7, _loc12_, _loc13_, _loc14_, _loc15_)) {
                    if ((_loc19_ = transformSize(_loc17_.x, _loc17_.y, param3).y) - mx_internal::SOLUTION_TOLERANCE > param2) {
                        _loc17_ = null;
                    }
                }
                if (_loc18_ = fitTBoundsHeight(param2, param3, param4, param5, param6, param7, _loc12_, _loc13_, _loc14_, _loc15_)) {
                    if ((_loc20_ = transformSize(_loc18_.x, _loc18_.y, param3).x) - mx_internal::SOLUTION_TOLERANCE > param1) {
                        _loc18_ = null;
                    }
                }
                if (Boolean(_loc17_) && Boolean(_loc18_)) {
                    _loc16_ = Number(_loc17_.x) * Number(_loc17_.y) > Number(_loc18_.x) * Number(_loc18_.y) ? _loc17_ : _loc18_;
                } else if (_loc17_) {
                    _loc16_ = _loc17_;
                } else {
                    _loc16_ = _loc18_;
                }
            }
            return _loc16_;
        }
        if (!isNaN(param1)) {
            return fitTBoundsWidth(param1, param3, param4, param5, param6, param7, _loc12_, _loc13_, _loc14_, _loc15_);
        }
        return fitTBoundsHeight(param2, param3, param4, param5, param6, param7, _loc12_, _loc13_, _loc14_, _loc15_);
    }

    private static function fitTBoundsWidth(param1: Number, param2: Matrix, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number, param9: Number, param10: Number): Point {
        var _loc11_: * = null;
        if (!isNaN(param3) && isNaN(param4)) {
            if (_loc11_ = calcUBoundsToFitTBoundsWidth(param1, param2, param3, param6, param3, param8, param3, param10)) {
                return _loc11_;
            }
        } else if (isNaN(param3) && !isNaN(param4)) {
            if (_loc11_ = calcUBoundsToFitTBoundsWidth(param1, param2, param5, param4, param7, param4, param9, param4)) {
                return _loc11_;
            }
        }
        return calcUBoundsToFitTBoundsWidth(param1, param2, param5, param6, param7, param8, param9, param10);
    }

    private static function fitTBoundsHeight(param1: Number, param2: Matrix, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number, param9: Number, param10: Number): Point {
        var _loc11_: * = null;
        if (!isNaN(param3) && isNaN(param4)) {
            if (_loc11_ = calcUBoundsToFitTBoundsHeight(param1, param2, param3, param6, param3, param8, param3, param10)) {
                return _loc11_;
            }
        } else if (isNaN(param3) && !isNaN(param4)) {
            if (_loc11_ = calcUBoundsToFitTBoundsHeight(param1, param2, param5, param4, param7, param4, param9, param4)) {
                return _loc11_;
            }
        }
        return calcUBoundsToFitTBoundsHeight(param1, param2, param5, param6, param7, param8, param9, param10);
    }

    public static function calcUBoundsToFitTBoundsHeight(param1: Number, param2: Matrix, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number): Point {
        var _loc12_: * = null;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc9_: Number = param2.b;
        var _loc10_: Number = param2.d;
        if (-1e-9 < _loc9_ && _loc9_ < 1e-9) {
            _loc9_ = 0;
        }
        if (-1e-9 < _loc10_ && _loc10_ < 1e-9) {
            _loc10_ = 0;
        }
        if (_loc9_ == 0 && _loc10_ == 0) {
            return null;
        }
        if (_loc9_ == 0 && _loc10_ == 0) {
            return null;
        }
        if (_loc9_ == 0) {
            return new Point(param3, param1 / Math.abs(_loc10_));
        }
        if (_loc10_ == 0) {
            return new Point(param1 / Math.abs(_loc9_), param4);
        }
        var _loc11_: Number;
        if ((_loc11_ = _loc9_ * _loc10_ >= 0 ? _loc10_ : -_loc10_) != 0 && param3 > 0) {
            _loc18_ = 1 / _loc11_;
            param3 = Math.max(param5, Math.min(param7, param3));
            _loc13_ = param3;
            _loc14_ = (param1 - _loc9_ * _loc13_) * _loc18_;
            if (param6 <= _loc14_ && _loc14_ <= param8 && _loc9_ * _loc13_ + _loc11_ * _loc14_ >= 0) {
                _loc12_ = new Point(_loc13_, _loc14_);
            }
            _loc14_ = (-param1 - _loc9_ * _loc13_) * _loc18_;
            if (param6 <= _loc14_ && _loc14_ <= param8 && _loc9_ * _loc13_ + _loc11_ * _loc14_ < 0) {
                if (!_loc12_ || transformSize(_loc12_.x, _loc12_.y, param2).x > transformSize(_loc13_, _loc14_, param2).x) {
                    _loc12_ = new Point(_loc13_, _loc14_);
                }
            }
        }
        if (_loc9_ != 0 && param4 > 0) {
            _loc19_ = 1 / _loc9_;
            _loc14_ = param4 = Math.max(param6, Math.min(param8, param4));
            _loc13_ = (param1 - _loc11_ * _loc14_) * _loc19_;
            if (param5 <= _loc13_ && _loc13_ <= param7 && _loc9_ * _loc13_ + _loc11_ * _loc14_ >= 0) {
                if (!_loc12_ || transformSize(_loc12_.x, _loc12_.y, param2).x > transformSize(_loc13_, _loc14_, param2).x) {
                    _loc12_ = new Point(_loc13_, _loc14_);
                }
            }
            _loc13_ = (-param1 - _loc11_ * _loc14_) * _loc19_;
            if (param5 <= _loc13_ && _loc13_ <= param7 && _loc9_ * _loc13_ + _loc11_ * _loc14_ < 0) {
                if (!_loc12_ || transformSize(_loc12_.x, _loc12_.y, param2).x > transformSize(_loc13_, _loc14_, param2).x) {
                    _loc12_ = new Point(_loc13_, _loc14_);
                }
            }
        }
        if (_loc12_) {
            return _loc12_;
        }
        _loc15_ = param2.a;
        _loc16_ = param2.c;
        var _loc17_: Number = _loc15_ * _loc16_ >= 0 ? _loc16_ : -_loc16_;
        return solveEquation(_loc9_, _loc11_, param1, param5, param6, param7, param8, _loc15_, _loc17_);
    }

    public static function calcUBoundsToFitTBoundsWidth(param1: Number, param2: Matrix, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number): Point {
        var _loc12_: * = null;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc9_: Number = param2.a;
        var _loc10_: Number = param2.c;
        if (-1e-9 < _loc9_ && _loc9_ < 1e-9) {
            _loc9_ = 0;
        }
        if (-1e-9 < _loc10_ && _loc10_ < 1e-9) {
            _loc10_ = 0;
        }
        if (_loc9_ == 0 && _loc10_ == 0) {
            return null;
        }
        if (_loc9_ == 0) {
            return new Point(param3, param1 / Math.abs(_loc10_));
        }
        if (_loc10_ == 0) {
            return new Point(param1 / Math.abs(_loc9_), param4);
        }
        var _loc11_: Number;
        if ((_loc11_ = _loc9_ * _loc10_ >= 0 ? _loc10_ : -_loc10_) != 0 && param3 > 0) {
            _loc18_ = 1 / _loc11_;
            param3 = Math.max(param5, Math.min(param7, param3));
            _loc13_ = param3;
            _loc14_ = (param1 - _loc9_ * _loc13_) * _loc18_;
            if (param6 <= _loc14_ && _loc14_ <= param8 && _loc9_ * _loc13_ + _loc11_ * _loc14_ >= 0) {
                _loc12_ = new Point(_loc13_, _loc14_);
            }
            _loc14_ = (-param1 - _loc9_ * _loc13_) * _loc18_;
            if (param6 <= _loc14_ && _loc14_ <= param8 && _loc9_ * _loc13_ + _loc11_ * _loc14_ < 0) {
                if (!_loc12_ || transformSize(_loc12_.x, _loc12_.y, param2).y > transformSize(_loc13_, _loc14_, param2).y) {
                    _loc12_ = new Point(_loc13_, _loc14_);
                }
            }
        }
        if (_loc9_ != 0 && param4 > 0) {
            _loc19_ = 1 / _loc9_;
            _loc14_ = param4 = Math.max(param6, Math.min(param8, param4));
            _loc13_ = (param1 - _loc11_ * _loc14_) * _loc19_;
            if (param5 <= _loc13_ && _loc13_ <= param7 && _loc9_ * _loc13_ + _loc11_ * _loc14_ >= 0) {
                if (!_loc12_ || transformSize(_loc12_.x, _loc12_.y, param2).y > transformSize(_loc13_, _loc14_, param2).y) {
                    _loc12_ = new Point(_loc13_, _loc14_);
                }
            }
            _loc13_ = (-param1 - _loc11_ * _loc14_) * _loc19_;
            if (param5 <= _loc13_ && _loc13_ <= param7 && _loc9_ * _loc13_ + _loc11_ * _loc14_ < 0) {
                if (!_loc12_ || transformSize(_loc12_.x, _loc12_.y, param2).y > transformSize(_loc13_, _loc14_, param2).y) {
                    _loc12_ = new Point(_loc13_, _loc14_);
                }
            }
        }
        if (_loc12_) {
            return _loc12_;
        }
        _loc15_ = param2.b;
        _loc16_ = param2.d;
        var _loc17_: Number = _loc15_ * _loc16_ >= 0 ? _loc16_ : -_loc16_;
        return solveEquation(_loc9_, _loc11_, param1, param5, param6, param7, param8, _loc15_, _loc17_);
    }

    private static function solveEquation(param1: Number, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number, param9: Number): Point {
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        if (param1 == 0 || param2 == 0) {
            return null;
        }
        var _loc13_: Number = (param3 - param4 * param1) / param2;
        var _loc14_: Number = (param3 - param6 * param1) / param2;
        var _loc15_: Number = Math.max(param5, Math.min(_loc13_, _loc14_));
        var _loc16_: Number = Math.min(param7, Math.max(_loc13_, _loc14_));
        var _loc17_: Number = param8 * param2 - param1 * param9;
        if (_loc15_ <= _loc16_) {
            if (Math.abs(_loc17_) < 1e-9) {
                _loc11_ = param3 / (param1 + param2);
            } else {
                _loc11_ = param8 * param3 / _loc17_;
            }
            _loc11_ = Math.max(_loc15_, Math.min(_loc11_, _loc16_));
            _loc10_ = (param3 - param2 * _loc11_) / param1;
            return new Point(_loc10_, _loc11_);
        }
        _loc13_ = -(param4 * param1 + param3) / param2;
        _loc14_ = -(param6 * param1 + param3) / param2;
        _loc15_ = Math.max(param5, Math.min(_loc13_, _loc14_));
        _loc16_ = Math.min(param7, Math.max(_loc13_, _loc14_));
        if (_loc15_ <= _loc16_) {
            if (Math.abs(_loc17_) < 1e-9) {
                _loc11_ = -param3 / (param1 + param2);
            } else {
                _loc11_ = -param8 * param3 / _loc17_;
            }
            _loc11_ = Math.max(_loc15_, Math.min(_loc11_, _loc16_));
            _loc10_ = (-param3 - param2 * _loc11_) / param1;
            return new Point(_loc10_, _loc11_);
        }
        return null;
    }

    public static function calcUBoundsToFitTBounds(param1: Number, param2: Number, param3: Matrix, param4: Number, param5: Number, param6: Number, param7: Number): Point {
        var _loc16_: * = null;
        var _loc8_: Number = param3.a;
        var _loc9_: Number = param3.b;
        var _loc10_: Number = param3.c;
        var _loc11_: Number = param3.d;
        if (-1e-9 < _loc8_ && _loc8_ < 1e-9) {
            _loc8_ = 0;
        }
        if (-1e-9 < _loc9_ && _loc9_ < 1e-9) {
            _loc9_ = 0;
        }
        if (-1e-9 < _loc10_ && _loc10_ < 1e-9) {
            _loc10_ = 0;
        }
        if (-1e-9 < _loc11_ && _loc11_ < 1e-9) {
            _loc11_ = 0;
        }
        if (_loc9_ == 0 && _loc10_ == 0) {
            if (_loc8_ == 0 || _loc11_ == 0) {
                return null;
            }
            return new Point(param1 / Math.abs(_loc8_), param2 / Math.abs(_loc11_));
        }
        if (_loc8_ == 0 && _loc11_ == 0) {
            if (_loc9_ == 0 || _loc10_ == 0) {
                return null;
            }
            return new Point(param2 / Math.abs(_loc9_), param1 / Math.abs(_loc10_));
        }
        var _loc12_: Number = _loc8_ * _loc10_ >= 0 ? _loc10_ : -_loc10_;
        var _loc13_: Number = _loc9_ * _loc11_ >= 0 ? _loc11_ : -_loc11_;
        var _loc14_: Number = _loc8_ * _loc13_ - _loc9_ * _loc12_;
        if (Math.abs(_loc14_) < 1e-9) {
            if (_loc12_ == 0 || _loc8_ == 0 || _loc8_ == -_loc12_) {
                return null;
            }
            if (Math.abs(_loc8_ * param2 - _loc9_ * param1) > 1e-9) {
                return null;
            }
            return solveEquation(_loc8_, _loc12_, param1, param4, param4, param6, param7, _loc9_, _loc13_);
        }
        var _loc15_: Number = 1 / _loc14_;
        param1 *= _loc15_;
        param2 *= _loc15_;
        if ((_loc16_ = solveSystem(_loc8_, _loc12_, _loc9_, _loc13_, param1, param2)) && param4 <= _loc16_.x && _loc16_.x <= param6 && param5 <= _loc16_.y && _loc16_.y <= param7 && _loc8_ * _loc16_.x + _loc12_ * _loc16_.x >= 0 && _loc9_ * _loc16_.x + _loc13_ * _loc16_.y >= 0) {
            return _loc16_;
        }
        if ((_loc16_ = solveSystem(_loc8_, _loc12_, _loc9_, _loc13_, param1, -param2)) && param4 <= _loc16_.x && _loc16_.x <= param6 && param5 <= _loc16_.y && _loc16_.y <= param7 && _loc8_ * _loc16_.x + _loc12_ * _loc16_.x >= 0 && _loc9_ * _loc16_.x + _loc13_ * _loc16_.y < 0) {
            return _loc16_;
        }
        if ((_loc16_ = solveSystem(_loc8_, _loc12_, _loc9_, _loc13_, -param1, param2)) && param4 <= _loc16_.x && _loc16_.x <= param6 && param5 <= _loc16_.y && _loc16_.y <= param7 && _loc8_ * _loc16_.x + _loc12_ * _loc16_.x < 0 && _loc9_ * _loc16_.x + _loc13_ * _loc16_.y >= 0) {
            return _loc16_;
        }
        if ((_loc16_ = solveSystem(_loc8_, _loc12_, _loc9_, _loc13_, -param1, -param2)) && param4 <= _loc16_.x && _loc16_.x <= param6 && param5 <= _loc16_.y && _loc16_.y <= param7 && _loc8_ * _loc16_.x + _loc12_ * _loc16_.x < 0 && _loc9_ * _loc16_.x + _loc13_ * _loc16_.y < 0) {
            return _loc16_;
        }
        return null;
    }

    public static function isEqual(param1: Matrix, param2: Matrix): Boolean {
        return param1 && param2 && param1.a == param2.a && param1.b == param2.b && param1.c == param2.c && param1.d == param2.d && param1.tx == param2.tx && param1.ty == param2.ty || !param1 && !param2;
    }

    public static function isEqual3D(param1: Matrix3D, param2: Matrix3D): Boolean {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (Boolean(param1) && Boolean(param2) && param1.rawData.length == param2.rawData.length) {
            _loc3_ = param1.rawData;
            _loc4_ = param2.rawData;
            return _loc3_[0] == _loc4_[0] && _loc3_[1] == _loc4_[1] && _loc3_[2] == _loc4_[2] && _loc3_[3] == _loc4_[3] && _loc3_[4] == _loc4_[4] && _loc3_[5] == _loc4_[5] && _loc3_[6] == _loc4_[6] && _loc3_[7] == _loc4_[7] && _loc3_[8] == _loc4_[8] && _loc3_[9] == _loc4_[9] && _loc3_[10] == _loc4_[10] && _loc3_[11] == _loc4_[11] && _loc3_[12] == _loc4_[12] && _loc3_[13] == _loc4_[13] && _loc3_[14] == _loc4_[14] && _loc3_[15] == _loc4_[15];
        }
        return !param1 && !param2;
    }

    private static function solveSystem(param1: Number, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number): Point {
        return new Point(param4 * param5 - param2 * param6, param1 * param6 - param3 * param5);
    }

    public static function getConcatenatedMatrix(param1: DisplayObject, param2: DisplayObject): Matrix {
        return getConcatenatedMatrixHelper(param1, false, param2);
    }

    public static function getConcatenatedComputedMatrix(param1: DisplayObject, param2: DisplayObject): Matrix {
        return getConcatenatedMatrixHelper(param1, true, param2);
    }

    private static function getConcatenatedMatrixHelper(param1: DisplayObject, param2: Boolean, param3: DisplayObject): Matrix {
        var _loc5_: * = null;
        var _loc6_: Boolean = false;
        var _loc7_: Boolean = false;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc4_: Matrix = new Matrix();
        if (usesMarshalling == null) {
            usesMarshalling = ApplicationDomain.currentDomain.hasDefinition("mx.managers.systemClasses.MarshallingSupport");
            if (!usesMarshalling && ApplicationDomain.currentDomain.hasDefinition("mx.core.UIComponent")) {
                uiComponentClass = Class(ApplicationDomain.currentDomain.getDefinition("mx.core.UIComponent"));
            }
            if (!usesMarshalling && ApplicationDomain.currentDomain.hasDefinition("mx.flash.UIMovieClip")) {
                uiMovieClipClass = Class(ApplicationDomain.currentDomain.getDefinition("mx.flash.UIMovieClip"));
            }
        }
        if (fakeDollarParent == null) {
            fakeDollarParent = new QName(mx_internal, "$parent");
        }
        if (param2 && computedMatrixProperty == null) {
            computedMatrixProperty = new QName(mx_internal, "computedMatrix");
        }
        if ($transformProperty == null) {
            $transformProperty = new QName(mx_internal, "$transform");
        }
        while (param1 && param1.transform.matrix && param1 != param3) {
            if ((_loc5_ = param1.scrollRect) != null) {
                _loc4_.translate(-_loc5_.x, -_loc5_.y);
            }
            if (Boolean(usesMarshalling) && "moduleFactory" in param1) {
                if ((_loc8_ = param1["moduleFactory"]) && _loc8_ !== lastModuleFactory && "info" in _loc8_) {
                    if ((Boolean(_loc9_ = _loc8_["info"]()["currentDomain"])) && _loc9_.hasDefinition("mx.core.UIComponent")) {
                        uiComponentClass = Class(_loc9_.getDefinition("mx.core.UIComponent"));
                    }
                    if (Boolean(_loc9_) && _loc9_.hasDefinition("mx.flash.UIMovieClip")) {
                        uiMovieClipClass = Class(_loc9_.getDefinition("mx.flash.UIMovieClip"));
                    }
                    lastModuleFactory = _loc8_;
                }
            }
            _loc6_ = Boolean(uiComponentClass) && param1 is uiComponentClass;
            _loc7_ = Boolean(uiMovieClipClass) && param1 is uiMovieClipClass;
            if (param2 && _loc6_) {
                _loc4_.concat(param1[computedMatrixProperty]);
            } else if (_loc7_) {
                _loc4_.concat(param1[$transformProperty].matrix);
            } else {
                _loc4_.concat(param1.transform.matrix);
            }
            if (_loc6_) {
                param1 = param1[fakeDollarParent] as DisplayObject;
            } else {
                param1 = param1.parent as DisplayObject;
            }
        }
        return _loc4_;
    }
}
}
