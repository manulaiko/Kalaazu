package package_309 {

import away3d.arcane;

import flash.geom.Matrix3D;
import flash.geom.Vector3D;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_307.class_1772;

import package_364.DirectionalLight;
import package_364.PointLight;

import package_385.class_2495;
import package_385.class_2704;

public class class_2644 extends class_2243 {


    private var var_3186: Boolean;

    private var var_439: int;

    private var var_3546: Vector.<Number>;

    public function class_2644(param1: class_1772) {
        this.var_3546 = new Vector.<Number>();
        super(param1);
    }

    override protected function method_2782(param1: String): class_2495 {
        return new class_2704(param1);
    }

    override protected function method_395(): void {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        super.method_395();
        if (var_1149) {
            _loc1_ = false ? 1 : 0;
            _loc2_ = false ? 1 : 0;
        } else {
            _loc1_ = 0;
            _loc2_ = 0;
        }
        var_1052 = 0;
        if (_loc1_ + _loc2_ > 1) {
            throw new Error("Must have exactly one light!");
        }
        if (_loc1_ != var_1458 || _loc2_ != var_231) {
            var_1458 = _loc1_;
            var_231 = _loc2_;
            arcane::method_220();
        }
    }

    override protected function method_154(): void {
        super.method_154();
        this.var_3186 = class_2704(var_973).tangentSpace;
    }

    override protected function method_2053(): void {
        super.method_2053();
        this.var_439 = class_2704(var_973).lightVertexConstantIndex;
    }

    override arcane function render(param1: class_2133, param2: class_1208, param3: class_1767, param4: Matrix3D): void {
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        param1.method_2908.copyRawDataTo(this.var_3546);
        if (Boolean(this.var_3186) && var_3169 >= 0) {
            _loc6_ = (_loc5_ = param3.method_3037).x;
            _loc7_ = _loc5_.y;
            _loc8_ = _loc5_.z;
            var_1253[var_3169] = Number(this.var_3546[0]) * _loc6_ + Number(this.var_3546[4]) * _loc7_ + Number(this.var_3546[8]) * _loc8_ + this.var_3546[12];
            var_1253[var_3169 + 1] = Number(this.var_3546[1]) * _loc6_ + Number(this.var_3546[5]) * _loc7_ + Number(this.var_3546[9]) * _loc8_ + this.var_3546[13];
            var_1253[var_3169 + 2] = Number(this.var_3546[2]) * _loc6_ + Number(this.var_3546[6]) * _loc7_ + Number(this.var_3546[10]) * _loc8_ + this.var_3546[14];
        }
        super.arcane::render(param1, param2, param3, param4);
    }

    override arcane function activate(param1: class_1208, param2: class_1767): void {
        var _loc3_: * = null;
        super.arcane::activate(param1, param2);
        if (!this.var_3186 && var_3169 >= 0) {
            _loc3_ = param2.method_3037;
            var_1253[var_3169] = _loc3_.x;
            var_1253[var_3169 + 1] = _loc3_.y;
            var_1253[var_3169 + 2] = _loc3_.z;
        }
    }

    override protected function method_1916(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = 0;
        var _loc4_: * = 0;
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        _loc4_ = uint(this.var_439);
        _loc3_ = uint(var_2296);
        if (var_231 > 0) {
            _loc1_ = var_1149.method_2074[0];
            _loc5_ = _loc1_.sceneDirection;
            var_1347 += _loc1_.arcane::var_1211;
            var_866 += _loc1_.arcane::var_1656;
            var_2778 += _loc1_.arcane::var_363;
            if (this.var_3186) {
                _loc6_ = -_loc5_.x;
                _loc7_ = -_loc5_.y;
                _loc8_ = -_loc5_.z;
                var _loc9_: *;
                var_1253[_loc9_ = _loc4_++] = Number(this.var_3546[0]) * _loc6_ + Number(this.var_3546[4]) * _loc7_ + Number(this.var_3546[8]) * _loc8_;
                var _loc10_: *;
                var_1253[_loc10_ = _loc4_++] = Number(this.var_3546[1]) * _loc6_ + Number(this.var_3546[5]) * _loc7_ + Number(this.var_3546[9]) * _loc8_;
                var _loc11_: *;
                var_1253[_loc11_ = _loc4_++] = Number(this.var_3546[2]) * _loc6_ + Number(this.var_3546[6]) * _loc7_ + Number(this.var_3546[10]) * _loc8_;
                var _loc12_: *;
                var_1253[_loc12_ = _loc4_++] = 1;
            } else {
                var_180[_loc9_ = _loc3_++] = -_loc5_.x;
                var_180[_loc10_ = _loc3_++] = -_loc5_.y;
                var_180[_loc11_ = _loc3_++] = -_loc5_.z;
                var_180[_loc12_ = _loc3_++] = 1;
            }
            var_180[_loc9_ = _loc3_++] = _loc1_.arcane::var_3866;
            var_180[_loc10_ = _loc3_++] = _loc1_.arcane::var_2970;
            var_180[_loc11_ = _loc3_++] = _loc1_.arcane::var_1455;
            var_180[_loc12_ = _loc3_++] = 1;
            var _loc13_: *;
            var_180[_loc13_ = _loc3_++] = _loc1_.arcane::var_3500;
            var _loc14_: *;
            var_180[_loc14_ = _loc3_++] = _loc1_.arcane::var_1919;
            var _loc15_: *;
            var_180[_loc15_ = _loc3_++] = _loc1_.arcane::var_2424;
            var _loc16_: *;
            var_180[_loc16_ = _loc3_++] = 1;
            return;
        }
        if (var_1458 > 0) {
            _loc2_ = var_1149.method_3158[0];
            _loc5_ = _loc2_.method_3037;
            var_1347 += _loc2_.arcane::var_1211;
            var_866 += _loc2_.arcane::var_1656;
            var_2778 += _loc2_.arcane::var_363;
            if (this.var_3186) {
                _loc6_ = _loc5_.x;
                _loc7_ = _loc5_.y;
                _loc8_ = _loc5_.z;
                var_1253[_loc9_ = _loc4_++] = Number(this.var_3546[0]) * _loc6_ + Number(this.var_3546[4]) * _loc7_ + Number(this.var_3546[8]) * _loc8_ + this.var_3546[12];
                var_1253[_loc10_ = _loc4_++] = Number(this.var_3546[1]) * _loc6_ + Number(this.var_3546[5]) * _loc7_ + Number(this.var_3546[9]) * _loc8_ + this.var_3546[13];
                var_1253[_loc11_ = _loc4_++] = Number(this.var_3546[2]) * _loc6_ + Number(this.var_3546[6]) * _loc7_ + Number(this.var_3546[10]) * _loc8_ + this.var_3546[14];
            } else {
                var_1253[_loc9_ = _loc4_++] = _loc5_.x;
                var_1253[_loc10_ = _loc4_++] = _loc5_.y;
                var_1253[_loc11_ = _loc4_++] = _loc5_.z;
            }
            var_1253[_loc9_ = _loc4_++] = 1;
            var_180[_loc10_ = _loc3_++] = _loc2_.arcane::var_3866;
            var_180[_loc11_ = _loc3_++] = _loc2_.arcane::var_2970;
            var_180[_loc12_ = _loc3_++] = _loc2_.arcane::var_1455;
            var_180[_loc13_ = _loc3_++] = Number(_loc2_.arcane::var_126) * Number(_loc2_.arcane::var_126);
            var_180[_loc14_ = _loc3_++] = _loc2_.arcane::var_3500;
            var_180[_loc15_ = _loc3_++] = _loc2_.arcane::var_1919;
            var_180[_loc16_ = _loc3_++] = _loc2_.arcane::var_2424;
            var _loc17_: *;
            var_180[_loc17_ = _loc3_++] = _loc2_.arcane::var_1269;
        }
    }

    override protected function method_564(): Boolean {
        return false;
    }

    override protected function method_71(): Boolean {
        return true;
    }

    override protected function method_22(param1: class_1208): void {
    }
}
}
