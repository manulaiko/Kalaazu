package package_371 {

import flash.geom.*;

public class class_2125 {

    public static const const_2368: Vector.<Number> = new Vector.<Number>(16);

    public static const const_1289: Matrix3D = new Matrix3D();

    public static const const_396: Vector3D = new Vector3D();

    public static const const_2817: Vector.<Vector3D> = Vector.<Vector3D>([new Vector3D(), new Vector3D(), new Vector3D()]);


    public function class_2125() {
        super();
    }

    public static function method_1911(param1: class_2451, param2: Matrix3D = null): Matrix3D {
        var _loc3_: Number = Number(param1.x);
        var _loc4_: Number = Number(param1.y);
        var _loc5_: Number = Number(param1.z);
        var _loc6_: Number = Number(param1.w);
        var _loc7_: Number = _loc3_ * _loc3_;
        var _loc8_: Number = _loc3_ * _loc4_;
        var _loc9_: Number = _loc3_ * _loc5_;
        var _loc10_: Number = _loc3_ * _loc6_;
        var _loc11_: Number = _loc4_ * _loc4_;
        var _loc12_: Number = _loc4_ * _loc5_;
        var _loc13_: Number = _loc4_ * _loc6_;
        var _loc14_: Number = _loc5_ * _loc5_;
        var _loc15_: Number = _loc5_ * _loc6_;
        var _loc16_: Vector.<Number>;
        (_loc16_ = const_2368)[0] = 1 - 2 * (_loc11_ + _loc14_);
        _loc16_[1] = 2 * (_loc8_ + _loc15_);
        _loc16_[2] = 2 * (_loc9_ - _loc13_);
        _loc16_[4] = 2 * (_loc8_ - _loc15_);
        _loc16_[5] = 1 - 2 * (_loc7_ + _loc14_);
        _loc16_[6] = 2 * (_loc12_ + _loc10_);
        _loc16_[8] = 2 * (_loc9_ + _loc13_);
        _loc16_[9] = 2 * (_loc12_ - _loc10_);
        _loc16_[10] = 1 - 2 * (_loc7_ + _loc11_);
        _loc16_[3] = _loc16_[7] = _loc16_[11] = _loc16_[12] = _loc16_[13] = _loc16_[14] = 0;
        _loc16_[15] = 1;
        if (param2) {
            param2.copyRawDataFrom(_loc16_);
            return param2;
        }
        return new Matrix3D(_loc16_);
    }

    public static function method_5586(param1: Matrix3D, param2: Vector3D = null): Vector3D {
        if (!param2) {
            param2 = new Vector3D();
        }
        param1.copyColumnTo(2, param2);
        param2.normalize();
        return param2;
    }

    public static function method_5401(param1: Matrix3D, param2: Vector3D = null): Vector3D {
        if (!param2) {
            param2 = new Vector3D();
        }
        param1.copyColumnTo(1, param2);
        param2.normalize();
        return param2;
    }

    public static function method_3679(param1: Matrix3D, param2: Vector3D = null): Vector3D {
        if (!param2) {
            param2 = new Vector3D();
        }
        param1.copyColumnTo(0, param2);
        param2.normalize();
        return param2;
    }

    public static function compare(param1: Matrix3D, param2: Matrix3D): Boolean {
        var _loc3_: Vector.<Number> = class_2125.const_2368;
        var _loc4_: Vector.<Number> = param2.rawData;
        param1.copyRawDataTo(_loc3_);
        var _loc5_: Number = 0;
        while (_loc5_ < 16) {
            if (_loc3_[_loc5_] != _loc4_[_loc5_]) {
                return false;
            }
            _loc5_++;
        }
        return true;
    }

    public static function method_1154(param1: Matrix3D, param2: Vector3D, param3: Vector3D, param4: Vector3D): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: Vector.<Number> = const_2368;
        (_loc7_ = param3.crossProduct(param4)).normalize();
        (_loc6_ = _loc7_.crossProduct(param3)).normalize();
        (_loc5_ = param3.clone()).normalize();
        _loc8_[0] = _loc7_.x;
        _loc8_[1] = _loc6_.x;
        _loc8_[2] = -_loc5_.x;
        _loc8_[3] = 0;
        _loc8_[4] = _loc7_.y;
        _loc8_[5] = _loc6_.y;
        _loc8_[6] = -_loc5_.y;
        _loc8_[7] = 0;
        _loc8_[8] = _loc7_.z;
        _loc8_[9] = _loc6_.z;
        _loc8_[10] = -_loc5_.z;
        _loc8_[11] = 0;
        _loc8_[12] = -_loc7_.dotProduct(param2);
        _loc8_[13] = -_loc6_.dotProduct(param2);
        _loc8_[14] = _loc5_.dotProduct(param2);
        _loc8_[15] = 1;
        param1.copyRawDataFrom(_loc8_);
    }

    public static function method_2688(param1: class_2230, param2: Matrix3D = null): Matrix3D {
        param2 = param2 || new Matrix3D();
        var _loc3_: Number = Number(param1.a);
        var _loc4_: Number = Number(param1.b);
        var _loc5_: Number = Number(param1.c);
        var _loc6_: Number = Number(param1.d);
        var _loc7_: Vector.<Number> = class_2125.const_2368;
        var _loc8_: Number = -2 * _loc3_ * _loc4_;
        var _loc9_: Number = -2 * _loc3_ * _loc5_;
        var _loc10_: Number = -2 * _loc4_ * _loc5_;
        _loc7_[0] = 1 - 2 * _loc3_ * _loc3_;
        _loc7_[4] = _loc8_;
        _loc7_[8] = _loc9_;
        _loc7_[12] = -2 * _loc3_ * _loc6_;
        _loc7_[1] = _loc8_;
        _loc7_[5] = 1 - 2 * _loc4_ * _loc4_;
        _loc7_[9] = _loc10_;
        _loc7_[13] = -2 * _loc4_ * _loc6_;
        _loc7_[2] = _loc9_;
        _loc7_[6] = _loc10_;
        _loc7_[10] = 1 - 2 * _loc5_ * _loc5_;
        _loc7_[14] = -2 * _loc5_ * _loc6_;
        _loc7_[3] = 0;
        _loc7_[7] = 0;
        _loc7_[11] = 0;
        _loc7_[15] = 1;
        param2.copyRawDataFrom(_loc7_);
        return param2;
    }

    public static function decompose(param1: Matrix3D, param2: String = "eulerAngles"): Vector.<Vector3D> {
        var _loc24_: Number = NaN;
        var _loc25_: Number = NaN;
        var _loc26_: Number = NaN;
        var _loc27_: Number = NaN;
        var _loc3_: Vector.<Number> = const_2368;
        param1.copyRawDataTo(_loc3_);
        var _loc4_: Number = _loc3_[0];
        var _loc5_: Number = _loc3_[1];
        var _loc6_: Number = _loc3_[2];
        var _loc7_: Number = _loc3_[4];
        var _loc8_: Number = _loc3_[5];
        var _loc9_: Number = _loc3_[6];
        var _loc10_: Number = _loc3_[8];
        var _loc11_: Number = _loc3_[9];
        var _loc12_: Number = _loc3_[10];
        var _loc13_: Number = _loc3_[12];
        var _loc14_: Number = _loc3_[13];
        var _loc15_: Number = _loc3_[14];
        var _loc16_: Number = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_);
        var _loc17_: Number = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_ + _loc9_ * _loc9_);
        var _loc18_: Number = Math.sqrt(_loc10_ * _loc10_ + _loc11_ * _loc11_ + _loc12_ * _loc12_);
        var _loc19_: Number = 0;
        var _loc20_: Number = _loc16_;
        var _loc21_: Number = _loc17_;
        var _loc22_: Number = _loc18_;
        if (_loc4_ * (_loc8_ * _loc12_ - _loc9_ * _loc11_) - _loc5_ * (_loc7_ * _loc12_ - _loc9_ * _loc10_) + _loc6_ * (_loc7_ * _loc11_ - _loc8_ * _loc10_) < 0) {
            _loc22_ = -_loc22_;
        }
        _loc4_ /= _loc20_;
        _loc5_ /= _loc20_;
        _loc6_ /= _loc20_;
        _loc7_ /= _loc21_;
        _loc8_ /= _loc21_;
        _loc9_ /= _loc21_;
        _loc10_ /= _loc22_;
        _loc11_ /= _loc22_;
        _loc12_ /= _loc22_;
        if (param2 == Orientation3D.EULER_ANGLES) {
            _loc16_ = Math.atan2(_loc9_, _loc12_);
            _loc17_ = Math.atan2(-_loc6_, Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_));
            _loc24_ = Math.sin(_loc16_);
            _loc25_ = Math.cos(_loc16_);
            _loc18_ = Math.atan2(_loc24_ * _loc10_ - _loc25_ * _loc7_, _loc25_ * _loc8_ - _loc24_ * _loc11_);
        } else if (param2 == Orientation3D.AXIS_ANGLE) {
            _loc19_ = Math.acos((_loc4_ + _loc8_ + _loc12_ - 1) / 2);
            if ((_loc26_ = Math.sqrt((_loc9_ - _loc11_) * (_loc9_ - _loc11_) + (_loc10_ - _loc6_) * (_loc10_ - _loc6_) + (_loc5_ - _loc7_) * (_loc5_ - _loc7_))) != 0) {
                _loc16_ = (_loc9_ - _loc11_) / _loc26_;
                _loc17_ = (_loc10_ - _loc6_) / _loc26_;
                _loc18_ = (_loc5_ - _loc7_) / _loc26_;
            } else {
                _loc16_ = _loc17_ = _loc18_ = 0;
            }
        } else if ((_loc27_ = _loc4_ + _loc8_ + _loc12_) > 0) {
            _loc19_ = Math.sqrt(1 + _loc27_) / 2;
            _loc16_ = (_loc9_ - _loc11_) / (4 * _loc19_);
            _loc17_ = (_loc10_ - _loc6_) / (4 * _loc19_);
            _loc18_ = (_loc5_ - _loc7_) / (4 * _loc19_);
        } else if (_loc4_ > _loc8_ && _loc4_ > _loc12_) {
            _loc16_ = Math.sqrt(1 + _loc4_ - _loc8_ - _loc12_) / 2;
            _loc19_ = (_loc9_ - _loc11_) / (4 * _loc16_);
            _loc17_ = (_loc5_ + _loc7_) / (4 * _loc16_);
            _loc18_ = (_loc10_ + _loc6_) / (4 * _loc16_);
        } else if (_loc8_ > _loc12_) {
            _loc17_ = Math.sqrt(1 + _loc8_ - _loc4_ - _loc12_) / 2;
            _loc16_ = (_loc5_ + _loc7_) / (4 * _loc17_);
            _loc19_ = (_loc10_ - _loc6_) / (4 * _loc17_);
            _loc18_ = (_loc9_ + _loc11_) / (4 * _loc17_);
        } else {
            _loc18_ = Math.sqrt(1 + _loc12_ - _loc4_ - _loc8_) / 2;
            _loc16_ = (_loc10_ + _loc6_) / (4 * _loc18_);
            _loc17_ = (_loc9_ + _loc11_) / (4 * _loc18_);
            _loc19_ = (_loc5_ - _loc7_) / (4 * _loc18_);
        }
        var _loc23_: Vector.<Vector3D>;
        (_loc23_ = const_2817)[0].x = _loc13_;
        _loc23_[0].y = _loc14_;
        _loc23_[0].z = _loc15_;
        _loc23_[1].x = _loc16_;
        _loc23_[1].y = _loc17_;
        _loc23_[1].z = _loc18_;
        _loc23_[1].w = _loc19_;
        _loc23_[2].x = _loc20_;
        _loc23_[2].y = _loc21_;
        _loc23_[2].z = _loc22_;
        return _loc23_;
    }

    public static function transformVector(param1: Matrix3D, param2: Vector3D, param3: Vector3D = null): Vector3D {
        if (!param3) {
            param3 = new Vector3D();
        }
        var _loc4_: Vector.<Number> = class_2125.const_2368;
        param1.copyRawDataTo(_loc4_);
        var _loc5_: Number = _loc4_[0];
        var _loc6_: Number = _loc4_[1];
        var _loc7_: Number = _loc4_[2];
        var _loc8_: Number = _loc4_[3];
        var _loc9_: Number = _loc4_[4];
        var _loc10_: Number = _loc4_[5];
        var _loc11_: Number = _loc4_[6];
        var _loc12_: Number = _loc4_[7];
        var _loc13_: Number = _loc4_[8];
        var _loc14_: Number = _loc4_[9];
        var _loc15_: Number = _loc4_[10];
        var _loc16_: Number = _loc4_[11];
        var _loc17_: Number = _loc4_[12];
        var _loc18_: Number = _loc4_[13];
        var _loc19_: Number = _loc4_[14];
        var _loc20_: Number = _loc4_[15];
        var _loc21_: Number = param2.x;
        var _loc22_: Number = param2.y;
        var _loc23_: Number = param2.z;
        param3.x = _loc5_ * _loc21_ + _loc9_ * _loc22_ + _loc13_ * _loc23_ + _loc17_;
        param3.y = _loc6_ * _loc21_ + _loc10_ * _loc22_ + _loc14_ * _loc23_ + _loc18_;
        param3.z = _loc7_ * _loc21_ + _loc11_ * _loc22_ + _loc15_ * _loc23_ + _loc19_;
        param3.w = _loc8_ * _loc21_ + _loc12_ * _loc22_ + _loc16_ * _loc23_ + _loc20_;
        return param3;
    }

    public static function deltaTransformVector(param1: Matrix3D, param2: Vector3D, param3: Vector3D = null): Vector3D {
        if (!param3) {
            param3 = new Vector3D();
        }
        var _loc4_: Vector.<Number> = class_2125.const_2368;
        param1.copyRawDataTo(_loc4_);
        var _loc5_: Number = _loc4_[0];
        var _loc6_: Number = _loc4_[1];
        var _loc7_: Number = _loc4_[2];
        var _loc8_: Number = _loc4_[3];
        var _loc9_: Number = _loc4_[4];
        var _loc10_: Number = _loc4_[5];
        var _loc11_: Number = _loc4_[6];
        var _loc12_: Number = _loc4_[7];
        var _loc13_: Number = _loc4_[8];
        var _loc14_: Number = _loc4_[9];
        var _loc15_: Number = _loc4_[10];
        var _loc16_: Number = _loc4_[11];
        var _loc17_: Number = param2.x;
        var _loc18_: Number = param2.y;
        var _loc19_: Number = param2.z;
        param3.x = _loc5_ * _loc17_ + _loc9_ * _loc18_ + _loc13_ * _loc19_;
        param3.y = _loc6_ * _loc17_ + _loc10_ * _loc18_ + _loc14_ * _loc19_;
        param3.z = _loc7_ * _loc17_ + _loc11_ * _loc18_ + _loc15_ * _loc19_;
        param3.w = _loc8_ * _loc17_ + _loc12_ * _loc18_ + _loc16_ * _loc19_;
        return param3;
    }

    public static function method_4848(param1: Matrix3D, param2: Vector3D = null): Vector3D {
        if (!param2) {
            param2 = new Vector3D();
        }
        param1.copyColumnTo(3, param2);
        return param2;
    }

    public static function method_2373(param1: Matrix3D, param2: Vector.<Number>, param3: Vector.<Number>): void {
        var _loc20_: Number = NaN;
        var _loc21_: Number = NaN;
        var _loc22_: Number = NaN;
        var _loc4_: Vector.<Number> = class_2125.const_2368;
        param1.copyRawDataTo(_loc4_);
        var _loc5_: Number = _loc4_[0];
        var _loc6_: Number = _loc4_[1];
        var _loc7_: Number = _loc4_[2];
        var _loc8_: Number = _loc4_[3];
        var _loc9_: Number = _loc4_[4];
        var _loc10_: Number = _loc4_[5];
        var _loc11_: Number = _loc4_[6];
        var _loc12_: Number = _loc4_[7];
        var _loc13_: Number = _loc4_[8];
        var _loc14_: Number = _loc4_[9];
        var _loc15_: Number = _loc4_[10];
        var _loc16_: Number = _loc4_[11];
        var _loc17_: Number = 0;
        var _loc18_: Number = param2.length;
        var _loc19_: * = 0;
        while (_loc19_ < _loc18_) {
            _loc20_ = param2[_loc19_];
            _loc21_ = param2[_loc19_ + 1];
            _loc22_ = param2[_loc19_ + 2];
            var _loc23_: *;
            param3[_loc23_ = _loc17_++] = _loc5_ * _loc20_ + _loc9_ * _loc21_ + _loc13_ * _loc22_;
            var _loc24_: *;
            param3[_loc24_ = _loc17_++] = _loc6_ * _loc20_ + _loc10_ * _loc21_ + _loc14_ * _loc22_;
            var _loc25_: *;
            param3[_loc25_ = _loc17_++] = _loc7_ * _loc20_ + _loc11_ * _loc21_ + _loc15_ * _loc22_;
            _loc19_ += 3;
        }
    }
}
}
