package package_363 {

import away3d.arcane;

import flash.geom.Vector3D;

import package_293.class_1749;
import package_293.class_1751;
import package_293.class_2131;

import package_294.class_2133;

import package_364.DirectionalLight;
import package_364.PointLight;
import package_364.class_2102;
import package_364.class_2390;

import package_376.class_2145;

public class class_2100 extends class_1749 implements class_1751 {


    protected var var_1458: uint;

    protected var var_231: uint;

    protected var var_2133: uint;

    protected var var_4980: uint;

    protected var var_1052: uint;

    protected var var_3683: Vector.<class_2102>;

    protected var var_156: Vector.<PointLight>;

    protected var var_4387: Vector.<PointLight>;

    protected var var_1547: Vector.<DirectionalLight>;

    protected var var_807: Vector.<DirectionalLight>;

    protected var var_3768: Vector.<class_2390>;

    protected var var_829: Vector.<Number>;

    public function class_2100() {
        super();
    }

    public function dispose(): void {
    }

    public function get assetType(): String {
        return class_2131.const_133;
    }

    public function get method_3204(): uint {
        return this.var_231;
    }

    public function get method_2262(): uint {
        return this.var_1458;
    }

    public function get method_5889(): uint {
        return this.var_4980;
    }

    public function get method_2416(): uint {
        return this.var_2133;
    }

    public function get method_1248(): uint {
        return this.var_1052;
    }

    public function get method_833(): Vector.<PointLight> {
        return this.var_156;
    }

    public function get method_1935(): Vector.<DirectionalLight> {
        return this.var_1547;
    }

    public function get method_3158(): Vector.<PointLight> {
        return this.var_4387;
    }

    public function get method_2074(): Vector.<DirectionalLight> {
        return this.var_807;
    }

    public function get method_1997(): Vector.<class_2390> {
        return this.var_3768;
    }

    public function get method_2762(): Vector.<Number> {
        return this.var_829;
    }

    public function get method_2314(): Vector.<class_2102> {
        return this.var_3683;
    }

    public function method_2281(param1: class_2133, param2: class_2145): void {
        this.method_6179(param1);
    }

    private function method_6179(param1: class_2133): void {
        var _loc3_: * = null;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc12_: int = 0;
        var _loc2_: Vector3D = param1.method_1409.method_3037;
        var _loc4_: Number = _loc2_.x;
        var _loc5_: Number = _loc2_.y;
        var _loc6_: Number = _loc2_.z;
        var _loc11_: Number = 0;
        _loc12_ = 0;
        while (_loc12_ < this.var_1052) {
            _loc3_ = this.var_3768[_loc12_].method_3037;
            _loc7_ = _loc4_ - _loc3_.x;
            _loc8_ = _loc5_ - _loc3_.y;
            _loc9_ = _loc6_ - _loc3_.z;
            _loc10_ = (_loc10_ = _loc7_ * _loc7_ + _loc8_ * _loc8_ + _loc9_ * _loc9_) > 0.00001 ? 1 / _loc10_ : 50000000;
            this.var_829[_loc12_] = _loc10_;
            _loc11_ += _loc10_;
            _loc12_++;
        }
        _loc11_ = 1 / _loc11_;
        _loc12_ = 0;
        while (_loc12_ < this.var_1052) {
            this.var_829[_loc12_] *= _loc11_;
            _loc12_++;
        }
    }
}
}
