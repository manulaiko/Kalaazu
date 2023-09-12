package package_434 {

import away3d.arcane;

import flash.geom.Matrix3D;
import flash.geom.Vector3D;
import flash.utils.Dictionary;

import package_295.class_1752;

import package_304.class_1766;
import package_304.class_2114;

import package_364.class_2102;

public class class_2711 {

    private static var var_1677: Number;

    private static var var_2612: Number;

    private static var var_2170: Number;

    private static var var_2545: Number;

    private static var var_1567: Number;

    private static var var_2544: Number;

    private static var var_2053: Vector3D = new Vector3D(0, 0, 0);

    private static var var_3656: Dictionary;


    public function class_2711() {
        super();
    }

    public static function method_5356(param1: class_2114): void {
        method_5245(param1);
    }

    public static function method_5245(param1: class_1752, param2: Boolean = true): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        reset();
        method_1387(param1);
        if (Boolean(method_2731(var_1677)) || Boolean(method_2731(var_2612)) || Boolean(method_2731(var_2170)) || Boolean(method_2731(var_2545)) || Boolean(method_2731(var_1567)) || Boolean(method_2731(var_2544))) {
            return;
        }
        if (param2) {
            _loc3_ = Vector.<Number>([Infinity, Infinity, Infinity, -Infinity, -Infinity, -Infinity]);
            _loc4_ = method_645(var_1677, var_2612, var_2170, var_2545, var_1567, var_2544);
            method_4234(_loc3_, _loc4_, param1.sceneTransform);
            var_1677 = _loc3_[0];
            var_2612 = _loc3_[1];
            var_2170 = _loc3_[2];
            var_2545 = _loc3_[3];
            var_1567 = _loc3_[4];
            var_2544 = _loc3_[5];
        }
    }

    public static function method_2120(param1: Vector.<Number>): void {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        reset();
        var _loc2_: uint = param1.length;
        if (_loc2_ % 3 != 0) {
            return;
        }
        var _loc6_: * = 0;
        while (_loc6_ < _loc2_) {
            _loc3_ = param1[_loc6_];
            _loc4_ = param1[_loc6_ + 1];
            _loc5_ = param1[_loc6_ + 2];
            if (_loc3_ < var_1677) {
                var_1677 = _loc3_;
            }
            if (_loc3_ > var_2545) {
                var_2545 = _loc3_;
            }
            if (_loc4_ < var_2612) {
                var_2612 = _loc4_;
            }
            if (_loc4_ > var_1567) {
                var_1567 = _loc4_;
            }
            if (_loc5_ < var_2170) {
                var_2170 = _loc5_;
            }
            if (_loc5_ > var_2544) {
                var_2544 = _loc5_;
            }
            _loc6_ += 3;
        }
    }

    public static function method_4046(param1: Vector3D = null): Vector3D {
        var _loc2_: Vector3D = param1 || new Vector3D();
        _loc2_.x = var_1677 + (Number(var_2545) - Number(var_1677)) * 0.5;
        _loc2_.y = var_2612 + (Number(var_1567) - Number(var_2612)) * 0.5;
        _loc2_.z = var_2170 + (Number(var_2544) - Number(var_2170)) * 0.5;
        return _loc2_;
    }

    public static function get method_2548(): Number {
        return var_1677;
    }

    public static function get method_5180(): Number {
        return var_2612;
    }

    public static function get method_329(): Number {
        return var_2170;
    }

    public static function get method_976(): Number {
        return var_2545;
    }

    public static function get method_4138(): Number {
        return var_1567;
    }

    public static function get method_2429(): Number {
        return var_2544;
    }

    public static function get width(): Number {
        return Number(var_2545) - Number(var_1677);
    }

    public static function get height(): Number {
        return Number(var_1567) - Number(var_2612);
    }

    public static function get depth(): Number {
        return Number(var_2544) - Number(var_2170);
    }

    private static function reset(): void {
        var_3656 = new Dictionary();
        var_1677 = var_2612 = var_2170 = Infinity;
        var _loc1_: * = -Infinity;
        var_2544 = -Infinity;
        var_2545 = var_1567 = _loc1_;
        var_2053.x = 0;
        var_2053.y = 0;
        var_2053.z = 0;
    }

    private static function method_1387(param1: class_1752, param2: Matrix3D = null): void {
        var _loc4_: * = null;
        var _loc9_: * = null;
        if (!param1.visible) {
            return;
        }
        var _loc10_: * = false || Vector.<Number>([Infinity, Infinity, Infinity, -Infinity, -Infinity, -Infinity]);
        var_3656[param1] = false || Vector.<Number>([Infinity, Infinity, Infinity, -Infinity, -Infinity, -Infinity]);
        var _loc3_: Vector.<Number> = _loc10_;
        var _loc5_: class_1766 = param1 as class_1766;
        var _loc6_: Matrix3D = new Matrix3D();
        if (Boolean(_loc5_) && Boolean(param2)) {
            method_87(param1, param2);
            _loc6_ = param1.transform.clone();
            if (param2) {
                _loc6_.append(param2);
            }
        } else if (Boolean(_loc5_) && !param2) {
            (_loc9_ = param1.transform.clone()).invert();
            method_87(param1, _loc9_);
        }
        var _loc7_: Number = 0;
        while (_loc7_ < param1.numChildren) {
            _loc4_ = param1.getChildAt(_loc7_);
            method_1387(_loc4_, _loc6_);
            _loc7_++;
        }
        var _loc8_: Vector.<Number> = var_3656[param1.parent];
        if (!_loc5_ && Boolean(param2)) {
            method_87(param1, param2, true);
        }
        if (_loc8_) {
            _loc8_[0] = Math.min(_loc8_[0], _loc3_[0]);
            _loc8_[1] = Math.min(_loc8_[1], _loc3_[1]);
            _loc8_[2] = Math.min(_loc8_[2], _loc3_[2]);
            _loc8_[3] = Math.max(_loc8_[3], _loc3_[3]);
            _loc8_[4] = Math.max(_loc8_[4], _loc3_[4]);
            _loc8_[5] = Math.max(_loc8_[5], _loc3_[5]);
        } else {
            var_1677 = _loc3_[0];
            var_2612 = _loc3_[1];
            var_2170 = _loc3_[2];
            var_2545 = _loc3_[3];
            var_1567 = _loc3_[4];
            var_2544 = _loc3_[5];
        }
    }

    private static function method_2731(param1: Number): Boolean {
        return param1 == Number.POSITIVE_INFINITY || param1 == Number.NEGATIVE_INFINITY;
    }

    private static function method_87(param1: class_1752, param2: Matrix3D = null, param3: Boolean = false): void {
        var _loc5_: * = null;
        if (param1 is class_2102) {
            return;
        }
        var _loc4_: class_1766 = param1 as class_1766;
        var _loc6_: Matrix3D = param1.transform.clone();
        var _loc7_: Vector.<Number> = var_3656[param1];
        if (_loc4_) {
            if (Boolean(method_2731(_loc4_.method_2548)) || Boolean(method_2731(_loc4_.method_5180)) || Boolean(method_2731(_loc4_.method_329)) || Boolean(method_2731(_loc4_.method_976)) || Boolean(method_2731(_loc4_.method_4138)) || Boolean(method_2731(_loc4_.method_2429))) {
                return;
            }
            _loc5_ = method_645(_loc4_.method_2548, _loc4_.method_5180, _loc4_.method_329, _loc4_.method_976, _loc4_.method_4138, _loc4_.method_2429);
            if (param2) {
                _loc6_.append(param2);
            }
        } else {
            _loc5_ = method_645(_loc7_[0], _loc7_[1], _loc7_[2], _loc7_[3], _loc7_[4], _loc7_[5]);
            if (param2) {
                _loc6_.prepend(param2);
            }
        }
        if (param3) {
            _loc7_[0] = _loc7_[1] = _loc7_[2] = Infinity;
            var _loc8_: * = -Infinity;
            _loc7_[5] = -Infinity;
            _loc7_[3] = _loc7_[4] = _loc8_;
        }
        method_4234(_loc7_, _loc5_, _loc6_);
    }

    private static function method_645(param1: Number, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number): Vector.<Number> {
        return Vector.<Number>([param1, param2, param3, param1, param2, param6, param1, param5, param3, param1, param5, param6, param4, param2, param3, param4, param2, param6, param4, param5, param3, param4, param5, param6]);
    }

    private static function method_4234(param1: Vector.<Number>, param2: Vector.<Number>, param3: Matrix3D): void {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        param3.transformVectors(param2, param2);
        var _loc7_: int = 0;
        while (_loc7_ < param2.length) {
            _loc4_ = param2[_loc7_++];
            _loc5_ = param2[_loc7_++];
            _loc6_ = param2[_loc7_++];
            if (_loc4_ < param1[0]) {
                param1[0] = _loc4_;
            }
            if (_loc4_ > param1[3]) {
                param1[3] = _loc4_;
            }
            if (_loc5_ < param1[1]) {
                param1[1] = _loc5_;
            }
            if (_loc5_ > param1[4]) {
                param1[4] = _loc5_;
            }
            if (_loc6_ < param1[2]) {
                param1[2] = _loc6_;
            }
            if (_loc6_ > param1[5]) {
                param1[5] = _loc6_;
            }
        }
    }
}
}
