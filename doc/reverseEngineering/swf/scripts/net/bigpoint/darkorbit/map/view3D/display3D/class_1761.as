package net.bigpoint.darkorbit.map.view3D.display3D {

import away3d.arcane;

import flash.geom.Vector3D;

import package_295.class_2128;

import package_296.*;

import package_304.class_1766;
import package_304.class_2114;

import package_376.class_2151;

import package_377.class_2150;

import package_379.class_2149;

public class class_1761 {


    protected var var_341: Vector.<class_1766>;

    protected var var_1564: uint;

    protected var var_1306: Boolean;

    private var var_1421: class_2151;

    public function class_1761() {
        this.var_1421 = new class_2151();
        super();
        this.var_341 = new Vector.<class_1766>();
    }

    public function method_2787(param1: Vector3D, param2: Vector3D, param3: class_2128): class_1754 {
        var _loc5_: * = null;
        this.var_1421.clear();
        this.var_1421.name_34 = param1;
        this.var_1421.rayDirection = param2;
        param3.method_2653(this.var_1421);
        this.var_1564 = 0;
        var _loc4_: class_2150 = this.var_1421.method_5004;
        while (_loc4_) {
            if ((_loc5_ = _loc4_.entity) is class_2114 && class_2114(_loc5_).parent is class_2149) {
                var _loc6_: *;
                this.var_341[_loc6_ = this.var_1564++] = _loc5_;
            }
            _loc4_ = _loc4_.next;
        }
        if (!this.var_1564) {
            return null;
        }
        return this.method_4430();
    }

    public function dispose(): void {
    }

    private function method_4430(): class_1754 {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: Number = 0;
        this.var_341.length = this.var_1564;
        var _loc1_: Number = 0;
        _loc5_ = 0;
        while (_loc5_ < this.var_1564) {
            _loc3_ = (_loc4_ = this.var_341[_loc5_]).arcane::var_643;
            if (_loc4_.pickingCollider) {
                if ((_loc2_ == null || _loc3_.var_2865 < _loc2_.var_2865) && Boolean(_loc4_.arcane::method_2840(_loc1_, false))) {
                    _loc1_ = Number(_loc3_.var_2865);
                    _loc2_ = _loc3_;
                    this.method_3677(_loc3_);
                    return _loc3_;
                }
            } else if (_loc2_ == null || _loc3_.var_2865 < _loc2_.var_2865) {
                if (!_loc3_.var_3447) {
                    this.method_3677(_loc3_);
                    return _loc3_;
                }
            }
            _loc5_++;
        }
        return _loc2_;
    }

    private function method_3677(param1: class_1754): void {
        var _loc6_: * = param1.name_53 || new Vector3D();
        param1.name_53 = param1.name_53 || new Vector3D();
        var _loc2_: Vector3D = _loc6_;
        var _loc3_: Vector3D = param1.var_2996;
        var _loc4_: Vector3D = param1.var_2096;
        var _loc5_: Number = Number(param1.var_2865);
        _loc2_.x = _loc4_.x + _loc5_ * _loc3_.x;
        _loc2_.y = _loc4_.y + _loc5_ * _loc3_.y;
        _loc2_.z = _loc4_.z + _loc5_ * _loc3_.z;
    }
}
}
