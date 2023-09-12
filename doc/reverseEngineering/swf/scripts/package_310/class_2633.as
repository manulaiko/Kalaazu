package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_364.DirectionalLight;

import package_371.class_2702;

import package_385.class_2237;
import package_385.class_2251;

public class class_2633 extends class_2608 {


    private var _range: Number = 1;

    private var var_2353: int;

    private var var_3581: Vector.<Number>;

    public function class_2633(param1: DirectionalLight, param2: int = 5, param3: Number = 1) {
        super(param1);
        this.method_2452 = param2;
        this.range = param3;
    }

    public function get method_2452(): int {
        return this.var_2353;
    }

    public function set method_2452(param1: int): void {
        this.var_2353 = param1;
        if (this.var_2353 < 1) {
            this.var_2353 = 1;
        } else if (this.var_2353 > 32) {
            this.var_2353 = 32;
        }
        this.var_3581 = class_2702.method_129(this.var_2353);
        method_220();
    }

    public function get range(): Number {
        return this._range;
    }

    public function set range(param1: Number): void {
        this._range = param1;
    }

    override arcane function method_4956(param1: class_2252): void {
        super.arcane::method_4956(param1);
        param1.var_3329[param1.var_2676 + 8] = 1 / Number(this.var_2353);
        param1.var_3329[param1.var_2676 + 9] = 0;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        super.arcane::activate(param1, param2);
        var _loc3_: Number = 0.5 * Number(this._range) / Number(var_1527.method_493.depthMapSize);
        var _loc4_: Vector.<Number> = param1.var_3329;
        var _loc5_: uint = param1.var_2676 + 10;
        var _loc6_: uint = Number(this.var_2353) << 1;
        var _loc7_: int = 0;
        while (_loc7_ < _loc6_) {
            _loc4_[uint(_loc5_ + _loc7_)] = Number(this.var_3581[_loc7_]) * _loc3_;
            _loc7_++;
        }
    }

    override protected function method_157(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc4_: class_2251 = param2.method_3238();
        var _loc5_: class_2251 = param2.method_1853();
        var _loc6_: class_2251 = param2.method_1853();
        var _loc7_: class_2251 = param2.method_1853();
        param1.var_2676 = Number(_loc5_.index) * 4;
        param1.var_2852 = _loc4_.index;
        return this.method_4494(param2, _loc4_, _loc5_, param3, _loc7_);
    }

    private function method_854(param1: class_2251, param2: class_2251, param3: class_2251, param4: class_2251, param5: class_2237): String {
        var _loc6_: class_2251 = param5.method_4834();
        return "tex " + _loc6_ + ", " + param1 + ", " + param2 + " <2d,nearest,clamp>\n" + "dp4 " + _loc6_ + ".z, " + _loc6_ + ", " + param3 + "\n" + "slt " + param1 + ".w, " + var_1513 + ".z, " + _loc6_ + ".z\n" + "add " + param4 + ".w, " + param4 + ".w, " + param1 + ".w\n";
    }

    override arcane function method_766(param1: class_2252, param2: class_1208): void {
        super.arcane::activate(param1, param2);
        var _loc3_: Number = Number(this._range) / Number(var_1527.method_493.depthMapSize);
        var _loc4_: Vector.<Number> = param1.var_3329;
        var _loc5_: uint = uint(param1.var_4227);
        var _loc6_: uint = Number(this.var_2353) << 1;
        _loc4_[_loc5_] = 1 / Number(this.var_2353);
        _loc4_[uint(_loc5_ + 1)] = 0;
        _loc5_ += 2;
        var _loc7_: int = 0;
        while (_loc7_ < _loc6_) {
            _loc4_[uint(_loc5_ + _loc7_)] = Number(this.var_3581[_loc7_]) * _loc3_;
            _loc7_++;
        }
        if (_loc6_ % 4 == 0) {
            _loc4_[uint(_loc5_ + _loc6_)] = 0;
            _loc4_[uint(_loc5_ + _loc6_ + 1)] = 0;
        }
    }

    override arcane function method_6039(param1: class_2252, param2: class_2237, param3: class_2251, param4: class_2251, param5: class_2251, param6: class_2251): String {
        var_1513 = param5;
        var _loc7_: class_2251 = param2.method_1853();
        param1.var_4227 = Number(_loc7_.index) * 4;
        return this.method_4494(param2, param4, param3, param6, _loc7_);
    }

    private function method_4494(param1: class_2237, param2: class_2251, param3: class_2251, param4: class_2251, param5: class_2251): String {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc12_: * = null;
        var _loc8_: Vector.<String> = new <String>[param5 + ".zw"];
        _loc6_ = param1.method_4834();
        param1.method_4539(_loc6_, 1);
        var _loc9_: class_2251 = param1.method_4834();
        var _loc10_: * = Number(this.var_2353) >> 1;
        var _loc11_: int = 0;
        while (_loc11_ < _loc10_) {
            _loc12_ = param1.method_1853();
            _loc8_.push(_loc12_ + ".xy");
            _loc8_.push(_loc12_ + ".zw");
            _loc11_++;
        }
        _loc11_ = 0;
        while (_loc11_ < this.var_2353) {
            if (_loc11_ == 0) {
                _loc7_ = "add " + _loc6_ + ", " + var_1513 + ", " + param5 + ".zwyy\n";
                _loc7_ = "add " + _loc6_ + ", " + var_1513 + ", " + param5 + ".zwyy\n" + ("tex " + _loc9_ + ", " + _loc6_ + ", " + param2 + " <2d,nearest,clamp>\n" + "dp4 " + _loc9_ + ".z, " + _loc9_ + ", " + param3 + "\n" + "slt " + param4 + ".w, " + var_1513 + ".z, " + _loc9_ + ".z\n");
            } else {
                _loc7_ = (_loc7_ += "add " + _loc6_ + ".xy, " + var_1513 + ".xy, " + _loc8_[_loc11_] + "\n") + this.method_854(_loc6_, param2, param3, param4, param1);
            }
            _loc11_++;
        }
        param1.method_771(_loc6_);
        return _loc7_ + ("mul " + param4 + ".w, " + param4 + ".w, " + param5 + ".x\n");
    }
}
}
