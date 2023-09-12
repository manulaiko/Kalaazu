package package_294 {

import away3d.arcane;

import flash.display3D.Context3D;
import flash.display3D.IndexBuffer3D;
import flash.display3D.VertexBuffer3D;
import flash.geom.Matrix3D;
import flash.geom.Vector3D;

import package_198.class_1208;

import package_374.AbstractMethodError;

public class class_2426 {


    private var var_2542: class_2429;

    protected var _vertexData: Vector.<Number>;

    protected var var_1798: Boolean = true;

    protected var var_3074: Boolean = true;

    protected var var_4922: Vector.<Number>;

    protected var _indices: Vector.<uint>;

    protected var _indexBuffer: Vector.<IndexBuffer3D>;

    protected var var_2446: uint;

    protected var var_619: Vector.<Context3D>;

    protected var var_3608: Vector.<Boolean>;

    protected var var_3055: uint;

    protected var var_2532: Boolean = true;

    protected var var_1890: Boolean = true;

    protected var var_1124: Boolean = false;

    protected var var_1782: Boolean = false;

    private var var_2687: Boolean = false;

    protected var var_4775: Boolean = true;

    protected var var_659: Boolean = true;

    protected var var_4500: Vector.<Number>;

    protected var var_818: Vector.<Number>;

    private var var_2261: Number = 1;

    private var var_524: Number = 1;

    protected var var_1139: Boolean = true;

    public function class_2426() {
        this._indexBuffer = new Vector.<IndexBuffer3D>(8);
        this.var_619 = new Vector.<Context3D>(8);
        this.var_3608 = new Vector.<Boolean>(8, true);
        super();
    }

    public function get method_1688(): Boolean {
        return this.var_1124;
    }

    public function set method_1688(param1: Boolean): void {
        this.var_1124 = param1;
        this.var_1139 = param1;
    }

    public function get method_3441(): Boolean {
        return this.var_1782;
    }

    public function set method_3441(param1: Boolean): void {
        this.var_1782 = param1;
    }

    public function get method_251(): Boolean {
        return this.var_2532;
    }

    public function set method_251(param1: Boolean): void {
        this.var_2532 = param1;
        this.var_4775 = param1;
    }

    public function get method_4186(): Boolean {
        return this.var_2687;
    }

    public function set method_4186(param1: Boolean): void {
        this.var_2687 = param1;
        if (this.var_2532) {
            this.var_4775 = true;
        }
        if (this.var_1890) {
            this.var_659 = true;
        }
        this.var_1798 = true;
    }

    public function get name_42(): uint {
        return this.var_3055;
    }

    public function method_612(param1: class_1208): IndexBuffer3D {
        var _loc2_: int = int(param1.arcane::var_1572);
        var _loc3_: Context3D = param1.arcane::var_4582;
        if (!this._indexBuffer[_loc2_] || this.var_619[_loc2_] != _loc3_) {
            this._indexBuffer[_loc2_] = _loc3_.createIndexBuffer(this.var_2446);
            this.var_619[_loc2_] = _loc3_;
            this.var_3608[_loc2_] = true;
        }
        if (this.var_3608[_loc2_]) {
            this._indexBuffer[_loc2_].uploadFromVector(this._indices, 0, this.var_2446);
            this.var_3608[_loc2_] = false;
        }
        return this._indexBuffer[_loc2_];
    }

    protected function method_5634(): void {
        var _loc1_: Number = 0;
        var _loc2_: * = 0;
        var _loc3_: * = 0;
        var _loc4_: * = 0;
        var _loc6_: * = 0;
        var _loc7_: * = 0;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        var _loc21_: Number = NaN;
        var _loc22_: Number = NaN;
        var _loc23_: Number = NaN;
        var _loc5_: uint = uint(this._indices.length);
        var _loc24_: Vector.<Number> = this._vertexData;
        var _loc25_: Vector.<Number> = this.method_868;
        var _loc26_: int = int(this.method_4110);
        var _loc27_: int = int(this.method_720);
        var _loc28_: int = int(this.method_2639);
        var _loc29_: int = int(this.method_2585);
        this.var_4922 = this.var_4922 || new Vector.<Number>(this._indices.length, true);
        while (_loc1_ < _loc5_) {
            _loc2_ = uint(this._indices[_loc1_]);
            _loc3_ = uint(this._indices[_loc1_ + 1]);
            _loc4_ = uint(this._indices[_loc1_ + 2]);
            _loc6_ = _loc29_ + _loc2_ * _loc28_ + 1;
            _loc8_ = _loc25_[_loc6_];
            _loc6_ = _loc29_ + _loc3_ * _loc28_ + 1;
            _loc9_ = _loc25_[_loc6_] - _loc8_;
            _loc6_ = _loc29_ + _loc4_ * _loc28_ + 1;
            _loc10_ = _loc25_[_loc6_] - _loc8_;
            _loc7_ = _loc27_ + _loc2_ * _loc26_;
            _loc12_ = _loc24_[_loc7_];
            _loc13_ = _loc24_[uint(_loc7_ + 1)];
            _loc14_ = _loc24_[uint(_loc7_ + 2)];
            _loc7_ = _loc27_ + _loc3_ * _loc26_;
            _loc15_ = _loc24_[uint(_loc7_)] - _loc12_;
            _loc16_ = _loc24_[uint(_loc7_ + 1)] - _loc13_;
            _loc17_ = _loc24_[uint(_loc7_ + 2)] - _loc14_;
            _loc7_ = _loc27_ + _loc4_ * _loc26_;
            _loc18_ = _loc24_[uint(_loc7_)] - _loc12_;
            _loc19_ = _loc24_[uint(_loc7_ + 1)] - _loc13_;
            _loc20_ = _loc24_[uint(_loc7_ + 2)] - _loc14_;
            _loc21_ = _loc10_ * _loc15_ - _loc9_ * _loc18_;
            _loc22_ = _loc10_ * _loc16_ - _loc9_ * _loc19_;
            _loc23_ = _loc10_ * _loc17_ - _loc9_ * _loc20_;
            _loc11_ = 1 / Math.sqrt(_loc21_ * _loc21_ + _loc22_ * _loc22_ + _loc23_ * _loc23_);
            var _loc30_: *;
            this.var_4922[_loc30_ = _loc1_++] = _loc11_ * _loc21_;
            var _loc31_: *;
            this.var_4922[_loc31_ = _loc1_++] = _loc11_ * _loc22_;
            var _loc32_: *;
            this.var_4922[_loc32_ = _loc1_++] = _loc11_ * _loc23_;
        }
        this.var_3074 = false;
    }

    private function method_5155(): void {
        var _loc1_: Number = 0;
        var _loc2_: Number = 0;
        var _loc3_: Number = 0;
        var _loc4_: * = 0;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        var _loc21_: Number = NaN;
        var _loc22_: Number = NaN;
        var _loc23_: Number = NaN;
        var _loc24_: Number = NaN;
        var _loc28_: Number = NaN;
        var _loc5_: uint = uint(this._indices.length);
        var _loc25_: Vector.<Number> = this._vertexData;
        var _loc26_: int = int(this.method_4110);
        var _loc27_: int = int(this.method_720);
        this.var_4500 = this.var_4500 || new Vector.<Number>(_loc5_, true);
        if (this.var_2687) {
            this.var_818 = this.var_818 || new Vector.<Number>(_loc5_ / 3, true);
        }
        while (_loc1_ < _loc5_) {
            _loc4_ = _loc27_ + Number(this._indices[_loc1_++]) * _loc26_;
            _loc6_ = _loc25_[_loc4_];
            _loc9_ = _loc25_[_loc4_ + 1];
            _loc12_ = _loc25_[_loc4_ + 2];
            _loc4_ = _loc27_ + Number(this._indices[_loc1_++]) * _loc26_;
            _loc7_ = _loc25_[_loc4_];
            _loc10_ = _loc25_[_loc4_ + 1];
            _loc13_ = _loc25_[_loc4_ + 2];
            _loc4_ = _loc27_ + Number(this._indices[_loc1_++]) * _loc26_;
            _loc8_ = _loc25_[_loc4_];
            _loc11_ = _loc25_[_loc4_ + 1];
            _loc14_ = _loc25_[_loc4_ + 2];
            _loc15_ = _loc8_ - _loc6_;
            _loc16_ = _loc11_ - _loc9_;
            _loc17_ = _loc14_ - _loc12_;
            _loc18_ = _loc7_ - _loc6_;
            _loc19_ = _loc10_ - _loc9_;
            _loc20_ = _loc13_ - _loc12_;
            _loc21_ = _loc17_ * _loc19_ - _loc16_ * _loc20_;
            _loc22_ = _loc15_ * _loc20_ - _loc17_ * _loc18_;
            _loc23_ = _loc16_ * _loc18_ - _loc15_ * _loc19_;
            _loc24_ = Math.sqrt(_loc21_ * _loc21_ + _loc22_ * _loc22_ + _loc23_ * _loc23_);
            if (this.var_2687) {
                if ((_loc28_ = _loc24_ * 10000) < 1) {
                    _loc28_ = 1;
                }
                var _loc29_: *;
                this.var_818[_loc29_ = _loc3_++] = _loc28_;
            }
            _loc24_ = 1 / _loc24_;
            this.var_4500[_loc29_ = _loc2_++] = _loc21_ * _loc24_;
            var _loc30_: *;
            this.var_4500[_loc30_ = _loc2_++] = _loc22_ * _loc24_;
            var _loc31_: *;
            this.var_4500[_loc31_ = _loc2_++] = _loc23_ * _loc24_;
        }
        this.var_1798 = false;
    }

    protected function method_3484(param1: Vector.<Number>): Vector.<Number> {
        var _loc2_: * = 0;
        var _loc9_: Number = 0;
        var _loc10_: Number = 0;
        var _loc12_: * = 0;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        if (this.var_1798) {
            this.method_5155();
        }
        var _loc3_: * = 0;
        var _loc4_: * = 1;
        var _loc5_: * = 2;
        var _loc6_: uint = uint(this._vertexData.length);
        var _loc7_: int = int(this.method_4163);
        var _loc8_: int = int(this.method_4530);
        param1 = param1 || new Vector.<Number>(_loc6_, true);
        _loc2_ = _loc8_;
        while (_loc2_ < _loc6_) {
            param1[_loc2_] = 0;
            param1[_loc2_ + 1] = 0;
            param1[_loc2_ + 2] = 0;
            _loc2_ += _loc7_;
        }
        var _loc11_: uint = uint(this._indices.length);
        while (_loc9_ < _loc11_) {
            _loc13_ = !!this.var_2687 ? Number(this.var_818[_loc10_++]) : 1;
            _loc12_ = _loc8_ + Number(this._indices[_loc9_++]) * _loc7_;
            var _loc18_: *;
            param1[_loc18_ = _loc12_++] = param1[_loc18_] + Number(this.var_4500[_loc3_]) * _loc13_;
            var _loc19_: *;
            param1[_loc19_ = _loc12_++] = param1[_loc19_] + Number(this.var_4500[_loc4_]) * _loc13_;
            param1[_loc12_] += Number(this.var_4500[_loc5_]) * _loc13_;
            _loc12_ = _loc8_ + Number(this._indices[_loc9_++]) * _loc7_;
            var _loc20_: *;
            param1[_loc20_ = _loc12_++] = param1[_loc20_] + Number(this.var_4500[_loc3_]) * _loc13_;
            var _loc21_: *;
            param1[_loc21_ = _loc12_++] = param1[_loc21_] + Number(this.var_4500[_loc4_]) * _loc13_;
            param1[_loc12_] += Number(this.var_4500[_loc5_]) * _loc13_;
            _loc12_ = _loc8_ + Number(this._indices[_loc9_++]) * _loc7_;
            var _loc22_: *;
            param1[_loc22_ = _loc12_++] = param1[_loc22_] + Number(this.var_4500[_loc3_]) * _loc13_;
            var _loc23_: *;
            param1[_loc23_ = _loc12_++] = param1[_loc23_] + Number(this.var_4500[_loc4_]) * _loc13_;
            param1[_loc12_] += Number(this.var_4500[_loc5_]) * _loc13_;
            _loc3_ += 3;
            _loc4_ += 3;
            _loc5_ += 3;
        }
        _loc2_ = _loc8_;
        while (_loc2_ < _loc6_) {
            _loc14_ = param1[_loc2_];
            _loc15_ = param1[_loc2_ + 1];
            _loc16_ = param1[_loc2_ + 2];
            _loc17_ = 1 / Math.sqrt(_loc14_ * _loc14_ + _loc15_ * _loc15_ + _loc16_ * _loc16_);
            param1[_loc2_] = _loc14_ * _loc17_;
            param1[_loc2_ + 1] = _loc15_ * _loc17_;
            param1[_loc2_ + 2] = _loc16_ * _loc17_;
            _loc2_ += _loc7_;
        }
        this.var_4775 = false;
        return param1;
    }

    protected function method_653(param1: Vector.<Number>): Vector.<Number> {
        var _loc2_: * = 0;
        var _loc6_: Number = 0;
        var _loc8_: * = 0;
        var _loc9_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        if (this.var_3074) {
            this.method_5634();
        }
        var _loc3_: uint = uint(this._vertexData.length);
        var _loc4_: int = int(this.method_2683);
        var _loc5_: int = int(this.method_4538);
        param1 = param1 || new Vector.<Number>(_loc3_, true);
        _loc2_ = _loc5_;
        while (_loc2_ < _loc3_) {
            param1[_loc2_] = 0;
            param1[_loc2_ + 1] = 0;
            param1[_loc2_ + 2] = 0;
            _loc2_ += _loc4_;
        }
        var _loc7_: uint = uint(this._indices.length);
        var _loc10_: * = 0;
        var _loc11_: * = 1;
        var _loc12_: * = 2;
        _loc2_ = 0;
        while (_loc2_ < _loc7_) {
            _loc9_ = !!this.var_2687 ? Number(this.var_818[_loc6_++]) : 1;
            _loc8_ = _loc5_ + Number(this._indices[_loc2_++]) * _loc4_;
            var _loc17_: *;
            param1[_loc17_ = _loc8_++] = param1[_loc17_] + Number(this.var_4922[_loc10_]) * _loc9_;
            var _loc18_: *;
            param1[_loc18_ = _loc8_++] = param1[_loc18_] + Number(this.var_4922[_loc11_]) * _loc9_;
            param1[_loc8_] += Number(this.var_4922[_loc12_]) * _loc9_;
            _loc8_ = _loc5_ + Number(this._indices[_loc2_++]) * _loc4_;
            var _loc19_: *;
            param1[_loc19_ = _loc8_++] = param1[_loc19_] + Number(this.var_4922[_loc10_]) * _loc9_;
            var _loc20_: *;
            param1[_loc20_ = _loc8_++] = param1[_loc20_] + Number(this.var_4922[_loc11_]) * _loc9_;
            param1[_loc8_] += Number(this.var_4922[_loc12_]) * _loc9_;
            _loc8_ = _loc5_ + Number(this._indices[_loc2_++]) * _loc4_;
            var _loc21_: *;
            param1[_loc21_ = _loc8_++] = param1[_loc21_] + Number(this.var_4922[_loc10_]) * _loc9_;
            var _loc22_: *;
            param1[_loc22_ = _loc8_++] = param1[_loc22_] + Number(this.var_4922[_loc11_]) * _loc9_;
            param1[_loc8_] += Number(this.var_4922[_loc12_]) * _loc9_;
            _loc10_ += 3;
            _loc11_ += 3;
            _loc12_ += 3;
        }
        _loc2_ = _loc5_;
        while (_loc2_ < _loc3_) {
            _loc13_ = param1[_loc2_];
            _loc14_ = param1[_loc2_ + 1];
            _loc15_ = param1[_loc2_ + 2];
            _loc16_ = 1 / Math.sqrt(_loc13_ * _loc13_ + _loc14_ * _loc14_ + _loc15_ * _loc15_);
            param1[_loc2_] = _loc13_ * _loc16_;
            param1[_loc2_ + 1] = _loc14_ * _loc16_;
            param1[_loc2_ + 2] = _loc15_ * _loc16_;
            _loc2_ += _loc4_;
        }
        this.var_659 = false;
        return param1;
    }

    public function dispose(): void {
        this.method_5637(this._indexBuffer);
        this._indices = null;
        this.var_619 = null;
        this.var_4500 = null;
        this.var_818 = null;
        this.var_4922 = null;
        this._vertexData = null;
    }

    public function get indexData(): Vector.<uint> {
        return this._indices;
    }

    public function updateIndexData(param1: Vector.<uint>): void {
        this._indices = param1;
        this.var_2446 = param1.length;
        var _loc2_: int = Number(this.var_2446) / 3;
        if (this.var_3055 != _loc2_) {
            this.method_5637(this._indexBuffer);
        }
        this.var_3055 = _loc2_;
        this.method_1458(this.var_3608);
        this.var_1798 = true;
        if (this.var_2532) {
            this.var_4775 = true;
        }
        if (this.var_1890) {
            this.var_659 = true;
        }
    }

    protected function method_5637(param1: Vector.<IndexBuffer3D>): void {
        var _loc2_: int = 0;
        while (_loc2_ < 8) {
            if (param1[_loc2_]) {
                param1[_loc2_].dispose();
                param1[_loc2_] = null;
            }
            _loc2_++;
        }
    }

    protected function method_1214(param1: Vector.<VertexBuffer3D>): void {
        var _loc2_: int = 0;
        while (_loc2_ < 8) {
            if (param1[_loc2_]) {
                param1[_loc2_].dispose();
                param1[_loc2_] = null;
            }
            _loc2_++;
        }
    }

    public function get method_5188(): Boolean {
        return this.var_1890;
    }

    public function set method_5188(param1: Boolean): void {
        this.var_1890 = param1;
        this.var_659 = param1;
    }

    public function get method_2565(): Vector.<Number> {
        if (this.var_1798) {
            this.method_5155();
        }
        return this.var_4500;
    }

    protected function method_1458(param1: Vector.<Boolean>): void {
        var _loc2_: int = 0;
        while (_loc2_ < 8) {
            param1[_loc2_] = true;
            _loc2_++;
        }
    }

    public function get method_2639(): uint {
        throw new AbstractMethodError();
    }

    public function get name_104(): Vector.<Number> {
        throw new AbstractMethodError();
    }

    public function get method_1272(): Vector.<Number> {
        throw new AbstractMethodError();
    }

    public function get method_4313(): Vector.<Number> {
        throw new AbstractMethodError();
    }

    public function get method_303(): Vector.<Number> {
        throw new AbstractMethodError();
    }

    public function get method_868(): Vector.<Number> {
        throw new AbstractMethodError();
    }

    public function get method_419(): Vector.<Number> {
        throw new AbstractMethodError();
    }

    public function get method_4110(): uint {
        throw new AbstractMethodError();
    }

    public function get method_4163(): uint {
        throw new AbstractMethodError();
    }

    public function get method_2683(): uint {
        throw new AbstractMethodError();
    }

    public function get method_720(): int {
        throw new AbstractMethodError();
    }

    public function get method_4530(): int {
        throw new AbstractMethodError();
    }

    public function get method_4538(): int {
        throw new AbstractMethodError();
    }

    public function get method_2585(): int {
        throw new AbstractMethodError();
    }

    protected function method_1513(): void {
        if (this.var_2542) {
            this.var_2542.arcane::method_1513(class_2425(this));
        }
    }

    public function get method_747(): class_2429 {
        return this.var_2542;
    }

    public function set method_747(param1: class_2429): void {
        this.var_2542 = param1;
    }

    public function get name_38(): Number {
        return this.var_2261;
    }

    public function get name_72(): Number {
        return this.var_524;
    }

    public function method_3965(param1: Number = 1, param2: Number = 1): void {
        var _loc3_: int = int(this.method_2585);
        var _loc4_: int = int(this.method_2639);
        var _loc5_: Vector.<Number>;
        var _loc6_: int = (_loc5_ = this.method_868).length;
        var _loc7_: Number = param1 / Number(this.var_2261);
        var _loc8_: Number = param2 / Number(this.var_524);
        var _loc9_: uint = _loc3_;
        while (_loc9_ < _loc6_) {
            _loc5_[_loc9_] *= _loc7_;
            _loc5_[_loc9_ + 1] *= _loc8_;
            _loc9_ += _loc4_;
        }
        this.var_2261 = param1;
        this.var_524 = param2;
    }

    public function scale(param1: Number): void {
        var _loc2_: Vector.<Number> = this.method_868;
        var _loc3_: uint = _loc2_.length;
        var _loc4_: int = int(this.method_720);
        var _loc5_: int = int(this.method_4110);
        var _loc6_: uint = _loc4_;
        while (_loc6_ < _loc3_) {
            _loc2_[_loc6_] *= param1;
            _loc2_[_loc6_ + 1] *= param1;
            _loc2_[_loc6_ + 2] *= param1;
            _loc6_ += _loc5_;
        }
    }

    public function method_1695(param1: Matrix3D): void {
        var _loc12_: Number = 0;
        var _loc13_: * = 0;
        var _loc14_: * = 0;
        var _loc18_: * = null;
        var _loc2_: Vector.<Number> = this._vertexData;
        var _loc3_: Vector.<Number> = this.method_4313;
        var _loc4_: Vector.<Number> = this.method_303;
        var _loc5_: int = int(this.method_4110);
        var _loc6_: int = int(this.method_4163);
        var _loc7_: int = int(this.method_2683);
        var _loc8_: int = int(this.method_720);
        var _loc9_: int = int(this.method_4530);
        var _loc10_: int = int(this.method_4538);
        var _loc11_: uint = _loc2_.length / _loc5_;
        var _loc15_: Vector3D = new Vector3D();
        var _loc16_: * = _loc3_ != null;
        var _loc17_: * = _loc4_ != null;
        if (_loc16_ || _loc17_) {
            (_loc18_ = param1.clone()).invert();
            _loc18_.transpose();
        }
        var _loc19_: int = _loc8_;
        var _loc20_: int = _loc9_;
        var _loc21_: int = _loc10_;
        _loc12_ = 0;
        while (_loc12_ < _loc11_) {
            _loc13_ = _loc19_ + 1;
            _loc14_ = _loc19_ + 2;
            _loc15_.x = _loc2_[_loc19_];
            _loc15_.y = _loc2_[_loc13_];
            _loc15_.z = _loc2_[_loc14_];
            _loc15_ = param1.transformVector(_loc15_);
            _loc2_[_loc19_] = _loc15_.x;
            _loc2_[_loc13_] = _loc15_.y;
            _loc2_[_loc14_] = _loc15_.z;
            _loc19_ += _loc5_;
            if (_loc16_) {
                _loc13_ = _loc20_ + 1;
                _loc14_ = _loc20_ + 2;
                _loc15_.x = _loc3_[_loc20_];
                _loc15_.y = _loc3_[_loc13_];
                _loc15_.z = _loc3_[_loc14_];
                (_loc15_ = _loc18_.deltaTransformVector(_loc15_)).normalize();
                _loc3_[_loc20_] = _loc15_.x;
                _loc3_[_loc13_] = _loc15_.y;
                _loc3_[_loc14_] = _loc15_.z;
                _loc20_ += _loc6_;
            }
            if (_loc17_) {
                _loc13_ = _loc21_ + 1;
                _loc14_ = _loc21_ + 2;
                _loc15_.x = _loc4_[_loc21_];
                _loc15_.y = _loc4_[_loc13_];
                _loc15_.z = _loc4_[_loc14_];
                (_loc15_ = _loc18_.deltaTransformVector(_loc15_)).normalize();
                _loc4_[_loc21_] = _loc15_.x;
                _loc4_[_loc13_] = _loc15_.y;
                _loc4_[_loc14_] = _loc15_.z;
                _loc21_ += _loc7_;
            }
            _loc12_++;
        }
    }

    protected function method_3678(param1: Vector.<Number>): Vector.<Number> {
        var _loc2_: * = 0;
        var _loc3_: Number = 0;
        this.var_1139 = false;
        var _loc4_: int;
        var _loc5_: int = (_loc4_ = int(this.method_2639)) - 2;
        var _loc6_: uint = Number(this._vertexData.length) / Number(this.method_4110) * _loc4_;
        if (!param1) {
            param1 = new Vector.<Number>();
        }
        param1.fixed = false;
        param1.length = _loc6_;
        param1.fixed = true;
        _loc2_ = uint(this.method_2585);
        _loc3_ = 0;
        while (_loc2_ < _loc6_) {
            var _loc7_: *;
            param1[_loc7_ = _loc2_++] = _loc3_ * 0.5;
            var _loc8_: *;
            param1[_loc8_ = _loc2_++] = 1 - (_loc3_ & 1);
            _loc2_ += _loc5_;
            if (++_loc3_ == 3) {
                _loc3_ = 0;
            }
        }
        return param1;
    }
}
}
