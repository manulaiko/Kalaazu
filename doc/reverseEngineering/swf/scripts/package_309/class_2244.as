package package_309 {

import away3d.arcane;

import flash.display3D.Context3D;
import flash.geom.ColorTransform;
import flash.geom.Vector3D;

import package_198.class_1208;

import package_305.class_1767;

import package_307.class_1772;
import package_307.class_2496;

import package_310.class_1780;
import package_310.class_2497;
import package_310.class_2499;

import package_364.DirectionalLight;
import package_364.PointLight;
import package_364.class_2390;

import package_385.class_2495;
import package_385.class_2498;

public class class_2244 extends class_2243 {


    private var var_871: Boolean = true;

    private var var_4142: Boolean;

    public function class_2244(param1: class_1772) {
        super(param1);
        var_2395 = true;
    }

    override protected function method_2782(param1: String): class_2495 {
        return new class_2498(param1);
    }

    public function get method_1389(): Boolean {
        return this.var_871;
    }

    public function set method_1389(param1: Boolean): void {
        if (this.var_871 == param1) {
            return;
        }
        this.var_871 = param1;
        arcane::method_220();
    }

    public function get colorTransform(): ColorTransform {
        return !true ? var_1738.arcane::var_2959.colorTransform : null;
    }

    public function set colorTransform(param1: ColorTransform): void {
        if (param1) {
            this.method_1245 = this.method_1245 || new class_2499();
            var_1738.arcane::var_2959.colorTransform = param1;
        } else if (!param1) {
            if (false) {
                this.method_1245 = null;
            }
            var_1738.arcane::var_2959 = null;
            this.method_1245 = null;
        }
    }

    public function get method_1245(): class_2499 {
        return var_1738.arcane::method_1245;
    }

    public function set method_1245(param1: class_2499): void {
        var_1738.arcane::method_1245 = param1;
    }

    public function addMethod(param1: class_1780): void {
        var_1738.addMethod(param1);
    }

    public function get method_3114(): int {
        return var_1738.method_3114;
    }

    public function method_4896(param1: class_1780): Boolean {
        return var_1738.method_4896(param1);
    }

    public function method_2311(param1: int): class_1780 {
        return var_1738.method_2311(param1);
    }

    public function method_5104(param1: class_1780, param2: int): void {
        var_1738.method_5104(param1, param2);
    }

    public function method_804(param1: class_1780): void {
        var_1738.method_804(param1);
    }

    override protected function method_395(): void {
        if (Boolean(var_1149) && !this.var_4142) {
            var_1458 = var_1149.method_2262;
            var_231 = var_1149.method_3204;
            var_1052 = var_1149.method_1248;
            if (this.var_871) {
                var_1458 += var_1149.method_2416;
                var_231 += var_1149.method_5889;
            }
        } else {
            var_1458 = 0;
            var_231 = 0;
            var_1052 = 0;
        }
        arcane::method_220();
    }

    override arcane function activate(param1: class_1208, param2: class_1767): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        super.arcane::activate(param1, param2);
        if (false) {
            var_1738.arcane::var_2959.arcane::activate(var_1738.arcane::var_3212, param1);
        }
        var _loc3_: Vector.<class_2497> = var_1738.arcane::var_1420;
        var _loc4_: uint = _loc3_.length;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            (_loc6_ = _loc3_[_loc5_]).method.arcane::activate(_loc6_.data, param1);
            _loc5_++;
        }
        if (var_3169 >= 0) {
            _loc7_ = param2.method_3037;
            var_1253[var_3169] = _loc7_.x;
            var_1253[var_3169 + 1] = _loc7_.y;
            var_1253[var_3169 + 2] = _loc7_.z;
        }
    }

    override arcane function deactivate(param1: class_1208): void {
        var _loc2_: * = null;
        super.arcane::deactivate(param1);
        if (false) {
            var_1738.arcane::var_2959.arcane::deactivate(var_1738.arcane::var_3212, param1);
        }
        var _loc3_: Vector.<class_2497> = var_1738.arcane::var_1420;
        var _loc4_: uint = _loc3_.length;
        var _loc5_: Number = 0;
        while (_loc5_ < _loc4_) {
            _loc2_ = _loc3_[_loc5_];
            _loc2_.method.arcane::deactivate(_loc2_.data, param1);
            _loc5_++;
        }
    }

    override protected function method_5749(): void {
        super.method_5749();
        if (false) {
            method_4916(var_1738.arcane::var_2959.method_4325);
        }
        var _loc1_: Vector.<class_2497> = var_1738.arcane::var_1420;
        var _loc2_: Number = 0;
        while (_loc2_ < _loc1_.length) {
            method_4916(_loc1_[_loc2_].method.method_4325);
            _loc2_++;
        }
    }

    private function method_2381(): Boolean {
        return var_1052 > 0 && (Number(var_2151) & 0) != 0;
    }

    private function method_2490(): Boolean {
        return var_1052 > 0 && (Number(var_266) & 0) != 0;
    }

    override protected function method_2409(): void {
        super.method_2409();
        if (false) {
            var_1738.arcane::var_2959.arcane::method_4956(var_1738.arcane::var_3212);
        }
        var _loc1_: Vector.<class_2497> = var_1738.arcane::var_1420;
        var _loc2_: uint = _loc1_.length;
        var _loc3_: Number = 0;
        while (_loc3_ < _loc2_) {
            _loc1_[_loc3_].method.arcane::method_4956(_loc1_[_loc3_].data);
            _loc3_++;
        }
    }

    override protected function method_1916(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = 0;
        var _loc4_: * = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc7_: * = 0;
        var _loc8_: uint = !!this.var_871 ? 2 : 1;
        _loc4_ = uint(var_2296);
        var _loc9_: int = 0;
        while (_loc9_ < _loc8_) {
            _loc5_ = (_loc10_ = !!_loc9_ ? var_1149.method_2074 : var_1149.method_1935).length;
            _loc7_ += _loc5_;
            _loc3_ = 0;
            while (_loc3_ < _loc5_) {
                _loc1_ = _loc10_[_loc3_];
                _loc6_ = _loc1_.sceneDirection;
                var_1347 += _loc1_.arcane::var_1211;
                var_866 += _loc1_.arcane::var_1656;
                var_2778 += _loc1_.arcane::var_363;
                var _loc12_: *;
                var_180[_loc12_ = _loc4_++] = -_loc6_.x;
                var _loc13_: *;
                var_180[_loc13_ = _loc4_++] = -_loc6_.y;
                var _loc14_: *;
                var_180[_loc14_ = _loc4_++] = -_loc6_.z;
                var _loc15_: *;
                var_180[_loc15_ = _loc4_++] = 1;
                var _loc16_: *;
                var_180[_loc16_ = _loc4_++] = _loc1_.arcane::var_3866;
                var _loc17_: *;
                var_180[_loc17_ = _loc4_++] = _loc1_.arcane::var_2970;
                var _loc18_: *;
                var_180[_loc18_ = _loc4_++] = _loc1_.arcane::var_1455;
                var _loc19_: *;
                var_180[_loc19_ = _loc4_++] = 1;
                var _loc20_: *;
                var_180[_loc20_ = _loc4_++] = _loc1_.arcane::var_3500;
                var _loc21_: *;
                var_180[_loc21_ = _loc4_++] = _loc1_.arcane::var_1919;
                var _loc22_: *;
                var_180[_loc22_ = _loc4_++] = _loc1_.arcane::var_2424;
                var _loc23_: *;
                var_180[_loc23_ = _loc4_++] = 1;
                _loc3_++;
            }
            _loc9_++;
        }
        if (var_231 > _loc7_) {
            _loc3_ = _loc4_ + (Number(var_231) - _loc7_) * 12;
            while (_loc4_ < _loc3_) {
                var_180[_loc12_ = _loc4_++] = 0;
            }
        }
        _loc7_ = 0;
        _loc9_ = 0;
        while (_loc9_ < _loc8_) {
            _loc5_ = (_loc11_ = !!_loc9_ ? var_1149.method_3158 : var_1149.method_833).length;
            _loc3_ = 0;
            while (_loc3_ < _loc5_) {
                _loc2_ = _loc11_[_loc3_];
                _loc6_ = _loc2_.method_3037;
                var_1347 += _loc2_.arcane::var_1211;
                var_866 += _loc2_.arcane::var_1656;
                var_2778 += _loc2_.arcane::var_363;
                var_180[_loc12_ = _loc4_++] = _loc6_.x;
                var_180[_loc13_ = _loc4_++] = _loc6_.y;
                var_180[_loc14_ = _loc4_++] = _loc6_.z;
                var_180[_loc15_ = _loc4_++] = 1;
                var_180[_loc16_ = _loc4_++] = _loc2_.arcane::var_3866;
                var_180[_loc17_ = _loc4_++] = _loc2_.arcane::var_2970;
                var_180[_loc18_ = _loc4_++] = _loc2_.arcane::var_1455;
                var_180[_loc19_ = _loc4_++] = Number(_loc2_.arcane::var_126) * Number(_loc2_.arcane::var_126);
                var_180[_loc20_ = _loc4_++] = _loc2_.arcane::var_3500;
                var_180[_loc21_ = _loc4_++] = _loc2_.arcane::var_1919;
                var_180[_loc22_ = _loc4_++] = _loc2_.arcane::var_2424;
                var_180[_loc23_ = _loc4_++] = _loc2_.arcane::var_1269;
                _loc3_++;
            }
            _loc9_++;
        }
        if (var_1458 > _loc7_) {
            _loc3_ = _loc4_ + (_loc7_ - Number(var_1458)) * 12;
            while (_loc4_ < _loc3_) {
                var_180[_loc4_] = 0;
                _loc4_++;
            }
        }
    }

    override protected function method_22(param1: class_1208): void {
        var _loc2_: * = null;
        var _loc3_: Vector.<class_2390> = var_1149.method_1997;
        var _loc4_: Vector.<Number> = var_1149.method_2762;
        var _loc5_: int = _loc3_.length;
        var _loc6_: Boolean = Boolean(this.method_2490());
        var _loc7_: Boolean = Boolean(false && this.method_2381());
        var _loc8_: Context3D = param1.arcane::var_4582;
        if (!(_loc6_ || _loc7_)) {
            return;
        }
        var _loc9_: Number = 0;
        while (_loc9_ < _loc5_) {
            _loc2_ = _loc3_[_loc9_];
            if (_loc6_) {
                _loc8_.setTextureAt(var_553[_loc9_], _loc2_.method_6006.method_6425(param1));
            }
            if (_loc7_) {
                _loc8_.setTextureAt(var_1335[_loc9_], _loc2_.specularMap.method_6425(param1));
            }
            _loc9_++;
        }
        var_180[var_1468] = _loc4_[0];
        var_180[var_1468 + 1] = _loc4_[1];
        var_180[var_1468 + 2] = _loc4_[2];
        var_180[var_1468 + 3] = _loc4_[3];
    }

    arcane function set method_1992(param1: Boolean): void {
        this.var_4142 = param1;
    }

    arcane function get method_1992(): Boolean {
        return this.var_4142;
    }
}
}
