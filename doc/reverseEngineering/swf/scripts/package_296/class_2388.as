package package_296 {

import away3d.arcane;

import flash.geom.Vector3D;

import package_295.class_1762;
import package_295.class_2128;

import package_304.class_1766;

import package_376.class_2145;
import package_376.class_2151;

import package_377.class_2150;

public class class_2388 implements class_2096 {

    private static const const_2487: Vector3D = new Vector3D();

    private static const const_2981: Vector3D = new Vector3D();


    private var var_331: Boolean;

    private var var_1421: class_2151;

    private var var_884: Array;

    private var var_3350: Boolean = true;

    protected var var_341: Vector.<class_1766>;

    protected var var_1564: uint;

    protected var var_1306: Boolean;

    public function class_2388(param1: Boolean) {
        this.var_1421 = new class_2151();
        this.var_884 = new Array();
        super();
        this.var_331 = param1;
        this.var_341 = new Vector.<class_1766>();
    }

    public function get method_3139(): Boolean {
        return this.var_3350;
    }

    public function set method_3139(param1: Boolean): void {
        this.var_3350 = param1;
    }

    public function method_3281(param1: Number, param2: Number, param3: class_1762): class_1754 {
        var _loc8_: * = null;
        var _loc4_: class_2145;
        if ((_loc4_ = param3.arcane::method_924).method_5950 == 0) {
            return null;
        }
        var _loc5_: Vector3D = param3.method_3456(param1, param2, 0, const_2487);
        var _loc6_: Vector3D = param3.method_3456(param1, param2, 1, const_2981);
        _loc6_.x -= _loc5_.x;
        _loc6_.y -= _loc5_.y;
        _loc6_.z -= _loc5_.z;
        this.var_1564 = 0;
        var _loc7_: class_2150 = _loc4_.method_5004;
        while (_loc7_) {
            _loc8_ = _loc7_.entity;
            if (this.method_863(_loc8_)) {
                _loc7_ = _loc7_.next;
            } else {
                if (Boolean(_loc8_.arcane::isVisible) && Boolean(_loc8_.method_4598(_loc5_, _loc6_))) {
                    var _loc9_: *;
                    this.var_341[_loc9_ = this.var_1564++] = _loc8_;
                }
                _loc7_ = _loc7_.next;
            }
        }
        if (!this.var_1564) {
            return null;
        }
        return this.method_4430();
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
            _loc5_ = _loc4_.entity;
            if (this.method_863(_loc5_)) {
                _loc4_ = _loc4_.next;
            } else {
                var _loc6_: *;
                this.var_341[_loc6_ = this.var_1564++] = _loc5_;
                _loc4_ = _loc4_.next;
            }
        }
        if (!this.var_1564) {
            return null;
        }
        return this.method_4430();
    }

    public function method_4438(param1: Vector3D, param2: Vector3D, param3: Vector.<class_1766>): class_1754 {
        var _loc4_: * = null;
        param1 = param1;
        param2 = param2;
        this.var_1564 = 0;
        for each(_loc4_ in param3) {
            if (_loc4_.method_4598(param1, param2)) {
                var _loc7_: *;
                this.var_341[_loc7_ = this.var_1564++] = _loc4_;
            }
        }
        return this.method_4430();
    }

    public function method_4758(param1: Array): void {
        this.var_884 = param1;
    }

    private function method_863(param1: class_1766): Boolean {
        var _loc2_: * = null;
        if (Boolean(this.var_3350) && (!param1.arcane::var_3982 || !param1.mouseEnabled)) {
            return true;
        }
        for each(_loc2_ in this.var_884) {
            if (_loc2_ == param1) {
                return true;
            }
        }
        return false;
    }

    private function method_5062(param1: class_1766, param2: class_1766): Number {
        return param1.method_3450.var_2865 > param2.method_3450.var_2865 ? 1 : -1;
    }

    private function method_4430(): class_1754 {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: Number = 0;
        this.var_341.length = this.var_1564;
        this.var_341 = this.var_341.sort(this.method_5062);
        var _loc1_: Number = 0;
        _loc5_ = 0;
        while (_loc5_ < this.var_1564) {
            _loc3_ = (_loc4_ = this.var_341[_loc5_]).arcane::var_643;
            if (_loc4_.pickingCollider) {
                if ((_loc2_ == null || _loc3_.var_2865 < _loc2_.var_2865) && Boolean(_loc4_.arcane::method_2840(_loc1_, this.var_331))) {
                    _loc1_ = Number(_loc3_.var_2865);
                    _loc2_ = _loc3_;
                    if (!this.var_331) {
                        this.method_3677(_loc3_);
                        return _loc3_;
                    }
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

    public function dispose(): void {
    }
}
}
