package package_383 {

import away3d.arcane;

import flash.geom.Matrix3D;
import flash.geom.Vector3D;

import package_371.class_2125;
import package_371.class_2230;
import package_371.class_2491;

import package_436.class_2489;
import package_436.class_2492;

public class class_2396 extends class_2226 {


    private var var_126: Number = 0;

    private var var_169: Number = 0;

    private var var_1985: Number = 0;

    private var var_1587: Number = 0;

    public function class_2396() {
        super();
    }

    public function get radius(): Number {
        return this.var_126;
    }

    override public function method_5406(): void {
        super.method_5406();
        this.var_169 = this.var_1985 = this.var_1587 = 0;
        this.var_126 = 0;
    }

    override public function method_3128(param1: Vector.<class_2230>, param2: int): Boolean {
        var _loc4_: * = null;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc3_: Number = 0;
        while (_loc3_ < param2) {
            _loc5_ = (_loc4_ = param1[_loc3_]).a < 0 ? -Number(this.var_126) : Number(this.var_126);
            _loc6_ = _loc4_.b < 0 ? -Number(this.var_126) : Number(this.var_126);
            _loc7_ = _loc4_.c < 0 ? -Number(this.var_126) : Number(this.var_126);
            if ((_loc8_ = Number(_loc4_.a) * (this.var_169 + _loc5_) + Number(_loc4_.b) * (this.var_1985 + _loc6_) + Number(_loc4_.c) * (this.var_1587 + _loc7_) - Number(_loc4_.d)) < 0) {
                return false;
            }
            _loc3_++;
        }
        return true;
    }

    override public function method_5432(param1: Vector3D, param2: Number): void {
        this.var_169 = param1.x;
        this.var_1985 = param1.y;
        this.var_1587 = param1.z;
        this.var_126 = param2;
        _max.x = this.var_169 + param2;
        _max.y = this.var_1985 + param2;
        _max.z = this.var_1587 + param2;
        _min.x = Number(this.var_169) - param2;
        _min.y = Number(this.var_1985) - param2;
        _min.z = Number(this.var_1587) - param2;
        var_1346 = true;
        if (var_1588) {
            this.method_3591();
        }
    }

    override public function method_5348(param1: Number, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number): void {
        this.var_169 = (param4 + param1) * 0.5;
        this.var_1985 = (param5 + param2) * 0.5;
        this.var_1587 = (param6 + param3) * 0.5;
        var _loc7_: Number = param4 - param1;
        var _loc8_: Number = param5 - param2;
        var _loc9_: Number = param6 - param3;
        if (_loc8_ > _loc7_) {
            _loc7_ = _loc8_;
        }
        if (_loc9_ > _loc7_) {
            _loc7_ = _loc9_;
        }
        this.var_126 = _loc7_ * Math.sqrt(0.5);
        super.method_5348(param1, param2, param3, param4, param5, param6);
    }

    override public function clone(): class_2226 {
        var _loc1_: class_2396 = new class_2396();
        _loc1_.method_5432(new Vector3D(this.var_169, this.var_1985, this.var_1587), this.var_126);
        return _loc1_;
    }

    override public function method_2610(param1: Vector3D, param2: Vector3D, param3: Vector3D): Number {
        var _loc10_: Number = NaN;
        var _loc15_: Number = NaN;
        if (this.containsPoint(param1)) {
            return 0;
        }
        var _loc4_: Number = param1.x - Number(this.var_169);
        var _loc5_: Number = param1.y - Number(this.var_1985);
        var _loc6_: Number = param1.z - Number(this.var_1587);
        var _loc7_: Number = param2.x;
        var _loc8_: Number = param2.y;
        var _loc9_: Number = param2.z;
        var _loc11_: Number = _loc7_ * _loc7_ + _loc8_ * _loc8_ + _loc9_ * _loc9_;
        var _loc12_: Number = 2 * (_loc4_ * _loc7_ + _loc5_ * _loc8_ + _loc6_ * _loc9_);
        var _loc13_: Number = _loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_ - Number(this.var_126) * Number(this.var_126);
        var _loc14_: Number;
        if ((_loc14_ = _loc12_ * _loc12_ - 4 * _loc11_ * _loc13_) >= 0) {
            _loc15_ = Math.sqrt(_loc14_);
            if ((_loc10_ = (-_loc12_ - _loc15_) / (2 * _loc11_)) >= 0) {
                param3.x = _loc4_ + _loc10_ * _loc7_;
                param3.y = _loc5_ + _loc10_ * _loc8_;
                param3.z = _loc6_ + _loc10_ * _loc9_;
                param3.normalize();
                return _loc10_;
            }
        }
        return -1;
    }

    override public function containsPoint(param1: Vector3D): Boolean {
        var _loc2_: Number = param1.x - Number(this.var_169);
        var _loc3_: Number = param1.y - Number(this.var_1985);
        var _loc4_: Number = param1.z - Number(this.var_1587);
        var _loc5_: Number;
        return (_loc5_ = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_)) <= this.var_126;
    }

    override protected function method_3591(): void {
        var _loc1_: Number = Number(this.var_126);
        if (_loc1_ == 0) {
            _loc1_ = 0.001;
        }
        var_1588.scaleX = _loc1_;
        var_1588.scaleY = _loc1_;
        var_1588.scaleZ = _loc1_;
        var_1588.x = this.var_169;
        var_1588.y = this.var_1985;
        var_1588.z = this.var_1587;
    }

    override protected function method_2569(): class_2489 {
        return new class_2492(1, 16, 12, 16777215, 0.5);
    }

    override public function method_2618(param1: class_2230): int {
        var _loc2_: Number = Number(param1.a);
        var _loc3_: Number = Number(param1.b);
        var _loc4_: Number = Number(param1.c);
        var _loc5_: Number = _loc2_ * Number(this.var_169) + _loc3_ * Number(this.var_1985) + _loc4_ * Number(this.var_1587) - Number(param1.d);
        if (_loc2_ < 0) {
            _loc2_ = -_loc2_;
        }
        if (_loc3_ < 0) {
            _loc3_ = -_loc3_;
        }
        if (_loc4_ < 0) {
            _loc4_ = -_loc4_;
        }
        var _loc6_: Number = (_loc2_ + _loc3_ + _loc4_) * Number(this.var_126);
        return _loc5_ > _loc6_ ? 0 : (_loc5_ < -_loc6_ ? 0 : int(class_2491.const_2149));
    }

    override public function method_2232(param1: class_2226, param2: Matrix3D): void {
        var _loc3_: class_2396 = class_2396(param1);
        var _loc4_: Number = Number(_loc3_.var_169);
        var _loc5_: Number = Number(_loc3_.var_1985);
        var _loc6_: Number = Number(_loc3_.var_1587);
        var _loc7_: Vector.<Number> = class_2125.const_2368;
        param2.copyRawDataTo(_loc7_);
        var _loc8_: Number = _loc7_[0];
        var _loc9_: Number = _loc7_[4];
        var _loc10_: Number = _loc7_[8];
        var _loc11_: Number = _loc7_[12];
        var _loc12_: Number = _loc7_[1];
        var _loc13_: Number = _loc7_[5];
        var _loc14_: Number = _loc7_[9];
        var _loc15_: Number = _loc7_[13];
        var _loc16_: Number = _loc7_[2];
        var _loc17_: Number = _loc7_[6];
        var _loc18_: Number = _loc7_[10];
        var _loc19_: Number = _loc7_[14];
        this.var_169 = _loc4_ * _loc8_ + _loc5_ * _loc9_ + _loc6_ * _loc10_ + _loc11_;
        this.var_1985 = _loc4_ * _loc12_ + _loc5_ * _loc13_ + _loc6_ * _loc14_ + _loc15_;
        this.var_1587 = _loc4_ * _loc16_ + _loc5_ * _loc17_ + _loc6_ * _loc18_ + _loc19_;
        if (_loc8_ < 0) {
            _loc8_ = -_loc8_;
        }
        if (_loc9_ < 0) {
            _loc9_ = -_loc9_;
        }
        if (_loc10_ < 0) {
            _loc10_ = -_loc10_;
        }
        if (_loc12_ < 0) {
            _loc12_ = -_loc12_;
        }
        if (_loc13_ < 0) {
            _loc13_ = -_loc13_;
        }
        if (_loc14_ < 0) {
            _loc14_ = -_loc14_;
        }
        if (_loc16_ < 0) {
            _loc16_ = -_loc16_;
        }
        if (_loc17_ < 0) {
            _loc17_ = -_loc17_;
        }
        if (_loc18_ < 0) {
            _loc18_ = -_loc18_;
        }
        var _loc20_: Number = Number(_loc3_.var_126);
        var _loc21_: Number = _loc8_ + _loc9_ + _loc10_;
        var _loc22_: Number = _loc12_ + _loc13_ + _loc14_;
        var _loc23_: Number = _loc16_ + _loc17_ + _loc18_;
        this.var_126 = _loc20_ * Math.sqrt(_loc21_ * _loc21_ + _loc22_ * _loc22_ + _loc23_ * _loc23_);
        _min.x = Number(this.var_169) - Number(this.var_126);
        _min.y = Number(this.var_1985) - Number(this.var_126);
        _min.z = Number(this.var_1587) - Number(this.var_126);
        _max.x = this.var_169 + this.var_126;
        _max.y = this.var_1985 + this.var_126;
        _max.z = this.var_1587 + this.var_126;
    }
}
}
