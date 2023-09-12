package package_383 {

import away3d.arcane;

import flash.geom.*;

import package_294.*;

import package_371.class_2230;

import package_374.*;

import package_436.*;

public class class_2226 {


    protected var _min: Vector3D;

    protected var _max: Vector3D;

    protected var var_2982: Vector.<Number>;

    protected var var_1346: Boolean = true;

    protected var var_1588: class_2489;

    public function class_2226() {
        this.var_2982 = new Vector.<Number>();
        super();
        this._min = new Vector3D();
        this._max = new Vector3D();
    }

    public function get max(): Vector3D {
        return this._max;
    }

    public function get min(): Vector3D {
        return this._min;
    }

    public function get method_4127(): Vector.<Number> {
        if (this.var_1346) {
            this.method_1198();
        }
        return this.var_2982;
    }

    public function get method_2861(): class_2489 {
        if (!this.var_1588) {
            this.var_1588 = this.method_2569();
            this.method_3591();
        }
        return this.var_1588;
    }

    public function method_5406(): void {
        this._min.x = this._min.y = this._min.z = 0;
        this._max.x = this._max.y = this._max.z = 0;
        this.var_1346 = true;
        if (this.var_1588) {
            this.method_3591();
        }
    }

    public function method_4969(): void {
        if (this.var_1588) {
            this.var_1588.dispose();
        }
        this.var_1588 = null;
    }

    public function method_972(param1: Vector.<Number>): void {
        var _loc2_: Number = 0;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc3_: uint = param1.length;
        if (_loc3_ == 0) {
            this.method_5406();
            return;
        }
        _loc4_ = _loc7_ = param1[uint(_loc2_++)];
        _loc5_ = _loc8_ = param1[uint(_loc2_++)];
        _loc6_ = _loc9_ = param1[uint(_loc2_++)];
        while (_loc2_ < _loc3_) {
            if ((_loc10_ = param1[_loc2_++]) < _loc4_) {
                _loc4_ = _loc10_;
            } else if (_loc10_ > _loc7_) {
                _loc7_ = _loc10_;
            }
            if ((_loc10_ = param1[_loc2_++]) < _loc5_) {
                _loc5_ = _loc10_;
            } else if (_loc10_ > _loc8_) {
                _loc8_ = _loc10_;
            }
            if ((_loc10_ = param1[_loc2_++]) < _loc6_) {
                _loc6_ = _loc10_;
            } else if (_loc10_ > _loc9_) {
                _loc9_ = _loc10_;
            }
        }
        this.method_5348(_loc4_, _loc5_, _loc6_, _loc7_, _loc8_, _loc9_);
    }

    public function method_5132(param1: class_2429): void {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = 0;
        var _loc13_: Number = 0;
        var _loc14_: * = 0;
        var _loc15_: * = 0;
        var _loc16_: Number = NaN;
        var _loc2_: Vector.<class_2425> = param1.subGeometries;
        var _loc3_: uint = _loc2_.length;
        if (_loc3_ > 0) {
            _loc11_ = (_loc10_ = _loc2_[0]).name_104;
            _loc12_ = uint(_loc10_.method_720);
            _loc4_ = _loc7_ = _loc11_[_loc12_];
            _loc5_ = _loc8_ = _loc11_[_loc12_ + 1];
            _loc6_ = _loc9_ = _loc11_[_loc12_ + 2];
            _loc13_ = 0;
            while (_loc13_ < _loc3_) {
                _loc14_ = (_loc11_ = (_loc10_ = _loc2_[_loc13_++]).name_104).length;
                _loc12_ = uint(_loc10_.method_720);
                _loc15_ = uint(_loc10_.method_4110);
                while (_loc12_ < _loc14_) {
                    if ((_loc16_ = _loc11_[_loc12_]) < _loc4_) {
                        _loc4_ = _loc16_;
                    } else if (_loc16_ > _loc7_) {
                        _loc7_ = _loc16_;
                    }
                    if ((_loc16_ = _loc11_[_loc12_ + 1]) < _loc5_) {
                        _loc5_ = _loc16_;
                    } else if (_loc16_ > _loc8_) {
                        _loc8_ = _loc16_;
                    }
                    if ((_loc16_ = _loc11_[_loc12_ + 2]) < _loc6_) {
                        _loc6_ = _loc16_;
                    } else if (_loc16_ > _loc9_) {
                        _loc9_ = _loc16_;
                    }
                    _loc12_ += _loc15_;
                }
            }
            this.method_5348(_loc4_, _loc5_, _loc6_, _loc7_, _loc8_, _loc9_);
        } else {
            this.method_5348(0, 0, 0, 0, 0, 0);
        }
    }

    public function method_5432(param1: Vector3D, param2: Number): void {
        this.method_5348(param1.x - param2, param1.y - param2, param1.z - param2, param1.x + param2, param1.y + param2, param1.z + param2);
    }

    public function method_5348(param1: Number, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number): void {
        this._min.x = param1;
        this._min.y = param2;
        this._min.z = param3;
        this._max.x = param4;
        this._max.y = param5;
        this._max.z = param6;
        this.var_1346 = true;
        if (this.var_1588) {
            this.method_3591();
        }
    }

    public function method_3128(param1: Vector.<class_2230>, param2: int): Boolean {
        throw new AbstractMethodError();
    }

    public function method_2798(param1: class_2226): Boolean {
        var _loc2_: Vector3D = param1._min;
        var _loc3_: Vector3D = param1._max;
        return this._max.x > _loc2_.x && this._min.x < _loc3_.x && this._max.y > _loc2_.y && this._min.y < _loc3_.y && this._max.z > _loc2_.z && this._min.z < _loc3_.z;
    }

    public function clone(): class_2226 {
        throw new AbstractMethodError();
    }

    public function method_2610(param1: Vector3D, param2: Vector3D, param3: Vector3D): Number {
        param1 = param1;
        param2 = param2;
        param3 = param3;
        return -1;
    }

    public function containsPoint(param1: Vector3D): Boolean {
        param1 = param1;
        return false;
    }

    protected function method_1198(): void {
        var _loc1_: Number = Number(this._max.x);
        var _loc2_: Number = Number(this._max.y);
        var _loc3_: Number = Number(this._max.z);
        var _loc4_: Number = Number(this._min.x);
        var _loc5_: Number = Number(this._min.y);
        var _loc6_: Number = Number(this._min.z);
        this.var_2982[0] = _loc4_;
        this.var_2982[1] = _loc5_;
        this.var_2982[2] = _loc6_;
        this.var_2982[3] = _loc1_;
        this.var_2982[4] = _loc5_;
        this.var_2982[5] = _loc6_;
        this.var_2982[6] = _loc4_;
        this.var_2982[7] = _loc2_;
        this.var_2982[8] = _loc6_;
        this.var_2982[9] = _loc1_;
        this.var_2982[10] = _loc2_;
        this.var_2982[11] = _loc6_;
        this.var_2982[12] = _loc4_;
        this.var_2982[13] = _loc5_;
        this.var_2982[14] = _loc3_;
        this.var_2982[15] = _loc1_;
        this.var_2982[16] = _loc5_;
        this.var_2982[17] = _loc3_;
        this.var_2982[18] = _loc4_;
        this.var_2982[19] = _loc2_;
        this.var_2982[20] = _loc3_;
        this.var_2982[21] = _loc1_;
        this.var_2982[22] = _loc2_;
        this.var_2982[23] = _loc3_;
        this.var_1346 = false;
    }

    protected function method_3591(): void {
        throw new AbstractMethodError();
    }

    protected function method_2569(): class_2489 {
        throw new AbstractMethodError();
    }

    public function method_2618(param1: class_2230): int {
        throw new AbstractMethodError();
    }

    public function method_2232(param1: class_2226, param2: Matrix3D): void {
        throw new AbstractMethodError();
    }
}
}
