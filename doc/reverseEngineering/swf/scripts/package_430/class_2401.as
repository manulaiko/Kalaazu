package package_430 {

import away3d.animators.class_2403;
import away3d.arcane;

import flash.geom.Vector3D;
import flash.utils.Dictionary;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_386.class_2238;
import package_386.class_2575;
import package_386.class_2576;

import package_431.class_2406;

public class class_2401 extends class_2400 {


    private var var_559: class_2406;

    protected var var_2419: Vector.<Vector3D>;

    protected var var_1953: Dictionary;

    protected var var_2723: Boolean;

    public function class_2401(param1: class_2403, param2: class_2406, param3: Boolean = false) {
        this.var_2419 = new Vector.<Vector3D>();
        this.var_1953 = new Dictionary(true);
        super(param1, param2);
        this.var_559 = param2;
        this.var_2723 = param3;
    }

    public function get method_338(): Boolean {
        return this.var_2723;
    }

    public function setRenderState(param1: class_1208, param2: class_2133, param3: class_2575, param4: class_2238, param5: class_1767): void {
    }

    protected function method_1348(param1: class_2575): void {
        var _loc7_: * = 0;
        var _loc8_: * = 0;
        var _loc9_: * = 0;
        var _loc10_: * = null;
        var _loc11_: * = null;
        this.var_1953[param1] = true;
        var _loc2_: Vector.<class_2576> = param1.var_2059;
        var _loc3_: Vector.<Number> = param1.name_104;
        var _loc4_: uint = uint(param1.method_93);
        var _loc5_: uint = uint(this.var_559.method_3305);
        var _loc6_: uint = uint(this.var_559.arcane::var_4676);
        var _loc12_: uint = uint(this.var_2419.length);
        var _loc13_: Number = 0;
        var _loc14_: Number = 0;
        var _loc15_: * = 0;
        while (_loc13_ < _loc12_) {
            while (_loc14_ < _loc12_ && (_loc11_ = _loc2_[_loc14_]).index == _loc13_) {
                _loc10_ = this.var_2419[_loc13_];
                _loc7_ = Number(_loc11_.numVertices) * _loc4_;
                _loc8_ = Number(_loc11_.var_3158) * _loc4_ + _loc6_;
                _loc15_ = 0;
                while (_loc15_ < _loc7_) {
                    _loc9_ = _loc8_ + _loc15_;
                    _loc15_ = 0;
                    while (_loc15_ < _loc7_) {
                        _loc9_ = _loc8_ + _loc15_;
                        var _loc16_: *;
                        _loc3_[_loc16_ = _loc9_++] = _loc10_.x;
                        var _loc17_: *;
                        _loc3_[_loc17_ = _loc9_++] = _loc10_.y;
                        var _loc18_: *;
                        _loc3_[_loc18_ = _loc9_++] = _loc10_.z;
                        if (_loc5_ == 4) {
                            var _loc19_: *;
                            _loc3_[_loc19_ = _loc9_++] = _loc10_.w;
                        }
                        _loc15_ += _loc4_;
                    }
                    _loc15_ += _loc4_;
                }
                _loc14_++;
            }
            _loc13_++;
        }
        param1.method_2736();
    }
}
}
