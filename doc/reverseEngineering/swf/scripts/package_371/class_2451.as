package package_371 {

import flash.geom.Matrix3D;
import flash.geom.Orientation3D;
import flash.geom.Vector3D;

public final class class_2451 {


    public var x: Number = 0;

    public var y: Number = 0;

    public var z: Number = 0;

    public var w: Number = 1;

    public function class_2451(param1: Number = 0, param2: Number = 0, param3: Number = 0, param4: Number = 1) {
        super();
        this.x = param1;
        this.y = param2;
        this.z = param3;
        this.w = param4;
    }

    public function get method_4386(): Number {
        return Math.sqrt(Number(this.w) * Number(this.w) + Number(this.x) * Number(this.x) + Number(this.y) * Number(this.y) + Number(this.z) * Number(this.z));
    }

    public function multiply(param1: class_2451, param2: class_2451): void {
        var _loc3_: Number = Number(param1.w);
        var _loc4_: Number = Number(param1.x);
        var _loc5_: Number = Number(param1.y);
        var _loc6_: Number = Number(param1.z);
        var _loc7_: Number = Number(param2.w);
        var _loc8_: Number = Number(param2.x);
        var _loc9_: Number = Number(param2.y);
        var _loc10_: Number = Number(param2.z);
        this.w = _loc3_ * _loc7_ - _loc4_ * _loc8_ - _loc5_ * _loc9_ - _loc6_ * _loc10_;
        this.x = _loc3_ * _loc8_ + _loc4_ * _loc7_ + _loc5_ * _loc10_ - _loc6_ * _loc9_;
        this.y = _loc3_ * _loc9_ - _loc4_ * _loc10_ + _loc5_ * _loc7_ + _loc6_ * _loc8_;
        this.z = _loc3_ * _loc10_ + _loc4_ * _loc9_ - _loc5_ * _loc8_ + _loc6_ * _loc7_;
    }

    public function method_2705(param1: Vector3D, param2: class_2451 = null): class_2451 {
        param2 = param2 || new class_2451();
        var _loc3_: Number = param1.x;
        var _loc4_: Number = param1.y;
        var _loc5_: Number = param1.z;
        param2.w = -Number(this.x) * _loc3_ - Number(this.y) * _loc4_ - Number(this.z) * _loc5_;
        param2.x = Number(this.w) * _loc3_ + Number(this.y) * _loc5_ - Number(this.z) * _loc4_;
        param2.y = Number(this.w) * _loc4_ - Number(this.x) * _loc5_ + Number(this.z) * _loc3_;
        param2.z = Number(this.w) * _loc5_ + Number(this.x) * _loc4_ - Number(this.y) * _loc3_;
        return param2;
    }

    public function method_4076(param1: Vector3D, param2: Number): void {
        var _loc3_: Number = Math.sin(param2 / 2);
        var _loc4_: Number = Math.cos(param2 / 2);
        this.x = param1.x * _loc3_;
        this.y = param1.y * _loc3_;
        this.z = param1.z * _loc3_;
        this.w = _loc4_;
        this.normalize();
    }

    public function method_4408(param1: class_2451, param2: class_2451, param3: Number): void {
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc4_: Number = Number(param1.w);
        var _loc5_: Number = Number(param1.x);
        var _loc6_: Number = Number(param1.y);
        var _loc7_: Number = Number(param1.z);
        var _loc8_: Number = Number(param2.w);
        var _loc9_: Number = Number(param2.x);
        var _loc10_: Number = Number(param2.y);
        var _loc11_: Number = Number(param2.z);
        var _loc12_: Number;
        if ((_loc12_ = _loc4_ * _loc8_ + _loc5_ * _loc9_ + _loc6_ * _loc10_ + _loc7_ * _loc11_) < 0) {
            _loc12_ = -_loc12_;
            _loc8_ = -_loc8_;
            _loc9_ = -_loc9_;
            _loc10_ = -_loc10_;
            _loc11_ = -_loc11_;
        }
        if (_loc12_ < 0.95) {
            _loc13_ = Math.acos(_loc12_);
            _loc14_ = 1 / Math.sin(_loc13_);
            _loc15_ = Math.sin(_loc13_ * (1 - param3)) * _loc14_;
            _loc16_ = Math.sin(_loc13_ * param3) * _loc14_;
            this.w = _loc4_ * _loc15_ + _loc8_ * _loc16_;
            this.x = _loc5_ * _loc15_ + _loc9_ * _loc16_;
            this.y = _loc6_ * _loc15_ + _loc10_ * _loc16_;
            this.z = _loc7_ * _loc15_ + _loc11_ * _loc16_;
        } else {
            this.w = _loc4_ + param3 * (_loc8_ - _loc4_);
            this.x = _loc5_ + param3 * (_loc9_ - _loc5_);
            this.y = _loc6_ + param3 * (_loc10_ - _loc6_);
            this.z = _loc7_ + param3 * (_loc11_ - _loc7_);
            _loc17_ = 1 / Math.sqrt(Number(this.w) * Number(this.w) + Number(this.x) * Number(this.x) + Number(this.y) * Number(this.y) + Number(this.z) * Number(this.z));
            this.w *= _loc17_;
            this.x *= _loc17_;
            this.y *= _loc17_;
            this.z *= _loc17_;
        }
    }

    public function method_1659(param1: class_2451, param2: class_2451, param3: Number): void {
        var _loc12_: Number = NaN;
        var _loc4_: Number = Number(param1.w);
        var _loc5_: Number = Number(param1.x);
        var _loc6_: Number = Number(param1.y);
        var _loc7_: Number = Number(param1.z);
        var _loc8_: Number = Number(param2.w);
        var _loc9_: Number = Number(param2.x);
        var _loc10_: Number = Number(param2.y);
        var _loc11_: Number = Number(param2.z);
        if (_loc4_ * _loc8_ + _loc5_ * _loc9_ + _loc6_ * _loc10_ + _loc7_ * _loc11_ < 0) {
            _loc8_ = -_loc8_;
            _loc9_ = -_loc9_;
            _loc10_ = -_loc10_;
            _loc11_ = -_loc11_;
        }
        this.w = _loc4_ + param3 * (_loc8_ - _loc4_);
        this.x = _loc5_ + param3 * (_loc9_ - _loc5_);
        this.y = _loc6_ + param3 * (_loc10_ - _loc6_);
        this.z = _loc7_ + param3 * (_loc11_ - _loc7_);
        _loc12_ = 1 / Math.sqrt(Number(this.w) * Number(this.w) + Number(this.x) * Number(this.x) + Number(this.y) * Number(this.y) + Number(this.z) * Number(this.z));
        this.w *= _loc12_;
        this.x *= _loc12_;
        this.y *= _loc12_;
        this.z *= _loc12_;
    }

    public function method_6528(param1: Number, param2: Number, param3: Number): void {
        var _loc4_: Number = param1 * 0.5;
        var _loc5_: Number = param2 * 0.5;
        var _loc6_: Number = param3 * 0.5;
        var _loc7_: Number = Math.cos(_loc4_);
        var _loc8_: Number = Math.sin(_loc4_);
        var _loc9_: Number = Math.cos(_loc5_);
        var _loc10_: Number = Math.sin(_loc5_);
        var _loc11_: Number = Math.cos(_loc6_);
        var _loc12_: Number = Math.sin(_loc6_);
        this.w = _loc7_ * _loc9_ * _loc11_ + _loc8_ * _loc10_ * _loc12_;
        this.x = _loc8_ * _loc9_ * _loc11_ - _loc7_ * _loc10_ * _loc12_;
        this.y = _loc7_ * _loc10_ * _loc11_ + _loc8_ * _loc9_ * _loc12_;
        this.z = _loc7_ * _loc9_ * _loc12_ - _loc8_ * _loc10_ * _loc11_;
    }

    public function method_4229(param1: Vector3D = null): Vector3D {
        param1 = param1 || new Vector3D();
        param1.x = Math.atan2(2 * (Number(this.w) * Number(this.x) + Number(this.y) * Number(this.z)), 1 - 2 * (Number(this.x) * Number(this.x) + Number(this.y) * Number(this.y)));
        param1.y = Math.asin(2 * (Number(this.w) * Number(this.y) - Number(this.z) * Number(this.x)));
        param1.z = Math.atan2(2 * (Number(this.w) * Number(this.z) + Number(this.x) * Number(this.y)), 1 - 2 * (Number(this.y) * Number(this.y) + Number(this.z) * Number(this.z)));
        return param1;
    }

    public function normalize(param1: Number = 1): void {
        var _loc2_: Number = param1 / Math.sqrt(Number(this.x) * Number(this.x) + Number(this.y) * Number(this.y) + Number(this.z) * Number(this.z) + Number(this.w) * Number(this.w));
        this.x *= _loc2_;
        this.y *= _loc2_;
        this.z *= _loc2_;
        this.w *= _loc2_;
    }

    public function toString(): String {
        return "{x:" + this.x + " y:" + this.y + " z:" + this.z + " w:" + this.w + "}";
    }

    public function toMatrix3D(param1: Matrix3D = null): Matrix3D {
        var _loc2_: Vector.<Number> = class_2125.const_2368;
        var _loc3_: Number = 2 * Number(this.x) * Number(this.y);
        var _loc4_: Number = 2 * Number(this.x) * Number(this.z);
        var _loc5_: Number = 2 * Number(this.x) * Number(this.w);
        var _loc6_: Number = 2 * Number(this.y) * Number(this.z);
        var _loc7_: Number = 2 * Number(this.y) * Number(this.w);
        var _loc8_: Number = 2 * Number(this.z) * Number(this.w);
        var _loc9_: Number = Number(this.x) * Number(this.x);
        var _loc10_: Number = Number(this.y) * Number(this.y);
        var _loc11_: Number = Number(this.z) * Number(this.z);
        var _loc12_: Number = Number(this.w) * Number(this.w);
        _loc2_[0] = _loc9_ - _loc10_ - _loc11_ + _loc12_;
        _loc2_[4] = _loc3_ - _loc8_;
        _loc2_[8] = _loc4_ + _loc7_;
        _loc2_[12] = 0;
        _loc2_[1] = _loc3_ + _loc8_;
        _loc2_[5] = -_loc9_ + _loc10_ - _loc11_ + _loc12_;
        _loc2_[9] = _loc6_ - _loc5_;
        _loc2_[13] = 0;
        _loc2_[2] = _loc4_ - _loc7_;
        _loc2_[6] = _loc6_ + _loc5_;
        _loc2_[10] = -_loc9_ - _loc10_ + _loc11_ + _loc12_;
        _loc2_[14] = 0;
        _loc2_[3] = 0;
        _loc2_[7] = 0;
        _loc2_[11] = 0;
        _loc2_[15] = 1;
        if (!param1) {
            return new Matrix3D(_loc2_);
        }
        param1.copyRawDataFrom(_loc2_);
        return param1;
    }

    public function method_767(param1: Matrix3D): void {
        var _loc2_: Vector3D = param1.decompose(Orientation3D.QUATERNION)[1];
        this.x = _loc2_.x;
        this.y = _loc2_.y;
        this.z = _loc2_.z;
        this.w = _loc2_.w;
    }

    public function method_1250(param1: Vector.<Number>, param2: Boolean = false): void {
        var _loc3_: Number = 2 * Number(this.x) * Number(this.y);
        var _loc4_: Number = 2 * Number(this.x) * Number(this.z);
        var _loc5_: Number = 2 * Number(this.x) * Number(this.w);
        var _loc6_: Number = 2 * Number(this.y) * Number(this.z);
        var _loc7_: Number = 2 * Number(this.y) * Number(this.w);
        var _loc8_: Number = 2 * Number(this.z) * Number(this.w);
        var _loc9_: Number = Number(this.x) * Number(this.x);
        var _loc10_: Number = Number(this.y) * Number(this.y);
        var _loc11_: Number = Number(this.z) * Number(this.z);
        var _loc12_: Number = Number(this.w) * Number(this.w);
        param1[0] = _loc9_ - _loc10_ - _loc11_ + _loc12_;
        param1[1] = _loc3_ - _loc8_;
        param1[2] = _loc4_ + _loc7_;
        param1[4] = _loc3_ + _loc8_;
        param1[5] = -_loc9_ + _loc10_ - _loc11_ + _loc12_;
        param1[6] = _loc6_ - _loc5_;
        param1[8] = _loc4_ - _loc7_;
        param1[9] = _loc6_ + _loc5_;
        param1[10] = -_loc9_ - _loc10_ + _loc11_ + _loc12_;
        param1[3] = param1[7] = param1[11] = 0;
        if (!param2) {
            param1[12] = param1[13] = param1[14] = 0;
            param1[15] = 1;
        }
    }

    public function clone(): class_2451 {
        return new class_2451(this.x, this.y, this.z, this.w);
    }

    public function method_3732(param1: Vector3D, param2: Vector3D = null): Vector3D {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = param1.x;
        var _loc8_: Number = param1.y;
        var _loc9_: Number = param1.z;
        param2 = param2 || new Vector3D();
        _loc6_ = -Number(this.x) * _loc7_ - Number(this.y) * _loc8_ - Number(this.z) * _loc9_;
        _loc3_ = Number(this.w) * _loc7_ + Number(this.y) * _loc9_ - Number(this.z) * _loc8_;
        _loc4_ = Number(this.w) * _loc8_ - Number(this.x) * _loc9_ + Number(this.z) * _loc7_;
        _loc5_ = Number(this.w) * _loc9_ + Number(this.x) * _loc8_ - Number(this.y) * _loc7_;
        param2.x = -_loc6_ * Number(this.x) + _loc3_ * Number(this.w) - _loc4_ * Number(this.z) + _loc5_ * Number(this.y);
        param2.y = -_loc6_ * Number(this.y) + _loc3_ * Number(this.z) + _loc4_ * Number(this.w) - _loc5_ * Number(this.x);
        param2.z = -_loc6_ * Number(this.z) - _loc3_ * Number(this.y) + _loc4_ * Number(this.x) + _loc5_ * Number(this.w);
        return param2;
    }

    public function copyFrom(param1: class_2451): void {
        this.x = param1.x;
        this.y = param1.y;
        this.z = param1.z;
        this.w = param1.w;
    }
}
}
