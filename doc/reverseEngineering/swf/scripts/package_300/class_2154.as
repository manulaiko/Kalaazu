package package_300 {

import away3d.arcane;

import flash.display3D.Context3DBlendFactor;
import flash.display3D.Context3DCompareMode;
import flash.display3D.textures.TextureBase;
import flash.geom.Matrix3D;
import flash.geom.Rectangle;
import flash.geom.Vector3D;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_307.class_1772;

import package_364.DirectionalLight;
import package_364.PointLight;
import package_364.class_2102;

import package_371.class_2125;

import package_376.class_2145;

import package_377.class_2146;

import package_429.class_2393;

public class class_2154 extends class_1759 {

    private static var var_354: int = 1;

    private static var var_2325: int = 2;

    private static var var_738: int = 3;


    private var var_2315: class_1772;

    private var var_210: class_2152;

    private var var_905: class_2152;

    private var var_1601: Matrix3D;

    private var var_4839: Matrix3D;

    private var var_4171: Vector3D;

    public function class_2154() {
        this.var_1601 = new Matrix3D();
        this.var_4839 = new Matrix3D();
        this.var_4171 = new Vector3D();
        super();
        this.var_905 = new class_2152();
        this.var_210 = new class_2152(false, true);
    }

    override arcane function set stage3DProxy(param1: class_1208): void {
        super.arcane::stage3DProxy = param1;
        this.var_210.arcane::stage3DProxy = this.var_905.arcane::stage3DProxy = param1;
    }

    override protected function method_1506(param1: class_2145, param2: TextureBase = null, param3: Rectangle = null, param4: int = 0): void {
        this.method_395(param1);
        if (param2) {
            this.method_2676(param1.method_6033, param1, var_354);
            this.method_2676(param1.method_51, param1, var_354);
        }
        super.method_1506(param1, param2, param3, param4);
    }

    private function method_395(param1: class_2145): void {
        var _loc4_: * = 0;
        var _loc5_: Number = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc2_: Vector.<DirectionalLight> = param1.method_1935;
        var _loc3_: Vector.<PointLight> = param1.method_833;
        _loc4_ = _loc2_.length;
        _loc5_ = 0;
        while (_loc5_ < _loc4_) {
            _loc7_ = (_loc6_ = _loc2_[_loc5_]).method_493;
            if (Boolean(_loc6_.method_825) && (Boolean(_loc7_.method_3634) || Boolean(_loc7_.arcane::var_2459))) {
                _loc7_.arcane::method_1457(_stage3DProxy, param1, this.var_905);
            }
            _loc5_++;
        }
        _loc4_ = _loc3_.length;
        _loc5_ = 0;
        while (_loc5_ < _loc4_) {
            _loc7_ = (_loc6_ = _loc3_[_loc5_]).method_493;
            if (Boolean(_loc6_.method_825) && (Boolean(_loc7_.method_3634) || Boolean(_loc7_.arcane::var_2459))) {
                _loc7_.arcane::method_1457(_stage3DProxy, param1, this.var_210);
            }
            _loc5_++;
        }
    }

    override protected function draw(param1: class_2145, param2: TextureBase): void {
        _context.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ZERO);
        if (param1.method_1346) {
            if (this.var_2315) {
                this.var_2315.arcane::deactivate(_stage3DProxy);
            }
            this.var_2315 = null;
            _context.setDepthTest(false, Context3DCompareMode.ALWAYS);
            this.method_5797(param1);
        }
        _context.setDepthTest(true, Context3DCompareMode.LESS_EQUAL);
        var _loc3_: int = !!param2 ? int(var_2325) : int(var_738);
        this.method_2676(param1.method_6033, param1, _loc3_);
        this.method_2676(param1.method_51, param1, _loc3_);
        _context.setDepthTest(false, Context3DCompareMode.LESS_EQUAL);
        if (this.var_2315) {
            this.var_2315.arcane::deactivate(_stage3DProxy);
        }
        this.var_2315 = null;
    }

    private function method_5797(param1: class_2145): void {
        var _loc2_: class_2133 = param1.method_1346;
        var _loc3_: class_1772 = _loc2_.material;
        var _loc4_: class_1767 = param1.camera;
        this.method_4718(_loc4_);
        _loc3_.arcane::method_5696(0, _stage3DProxy, _loc4_);
        _loc3_.arcane::method_3858(0, _loc2_, _stage3DProxy, param1, this.var_1601);
        _loc3_.arcane::method_3124(0, _stage3DProxy);
    }

    private function method_4718(param1: class_1767): void {
        this.var_1601.copyFrom(var_4489);
        this.var_1601.copyRowTo(2, this.var_4171);
        var _loc2_: Vector3D = param1.method_3037;
        var _loc3_: Number = Number(this.var_4171.x);
        var _loc4_: Number = Number(this.var_4171.y);
        var _loc5_: Number = Number(this.var_4171.z);
        var _loc6_: Number = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
        this.var_4171.x = 0;
        this.var_4171.y = 0;
        this.var_4171.z = 0;
        this.var_4171.w = 1;
        this.var_4839.copyFrom(param1.sceneTransform);
        this.var_4839.copyColumnFrom(3, this.var_4171);
        this.var_4171.x = 0;
        this.var_4171.y = 0;
        this.var_4171.z = 1;
        this.var_4171.w = 0;
        class_2125.transformVector(this.var_4839, this.var_4171, this.var_4171);
        this.var_4171.normalize();
        var _loc7_: Number = Math.acos(Number(this.var_4171.x) * (_loc3_ / _loc6_) + Number(this.var_4171.y) * (_loc4_ / _loc6_) + Number(this.var_4171.z) * (_loc5_ / _loc6_));
        if (Math.abs(_loc7_) > 0.000001) {
            return;
        }
        var _loc8_: Number = -(_loc3_ * _loc2_.x + _loc4_ * _loc2_.y + _loc5_ * _loc2_.z + _loc6_);
        var _loc9_: Number = _loc3_ >= 0 ? 1 : -1;
        var _loc10_: Number = _loc4_ >= 0 ? 1 : -1;
        var _loc11_: Vector3D;
        (_loc11_ = this.var_4171).x = _loc9_;
        _loc11_.y = _loc10_;
        _loc11_.z = 1;
        _loc11_.w = 1;
        this.var_4839.copyFrom(this.var_1601);
        this.var_4839.invert();
        var _loc12_: Vector3D = class_2125.transformVector(this.var_4839, _loc11_, class_2125.const_396);
        this.var_1601.copyRowTo(3, _loc11_);
        var _loc13_: Number = (_loc12_.x * _loc11_.x + _loc12_.y * _loc11_.y + _loc12_.z * _loc11_.z + _loc12_.w * _loc11_.w) / (_loc3_ * _loc12_.x + _loc4_ * _loc12_.y + _loc5_ * _loc12_.z + _loc8_ * _loc12_.w);
        this.var_4171.x = _loc3_ * _loc13_;
        this.var_4171.y = _loc4_ * _loc13_;
        this.var_4171.z = _loc5_ * _loc13_;
        this.var_4171.w = _loc8_ * _loc13_;
        this.var_1601.copyRowFrom(2, this.var_4171);
    }

    private function method_2676(param1: class_2146, param2: class_2145, param3: int): void {
        var _loc4_: * = 0;
        var _loc5_: Number = 0;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        var _loc6_: class_1767 = param2.camera;
        while (param1) {
            this.var_2315 = param1.var_3785.material;
            this.var_2315.arcane::method_3403(_context);
            _loc4_ = uint(this.var_2315.arcane::numPasses);
            _loc5_ = 0;
            do {
                _loc7_ = param1;
                if (((_loc8_ = !!this.var_2315.arcane::method_10(_loc5_) ? 1 : 2) & param3) != 0) {
                    this.var_2315.arcane::method_5696(_loc5_, _stage3DProxy, _loc6_);
                    do {
                        this.var_2315.arcane::method_3858(_loc5_, _loc7_.var_3785, _stage3DProxy, param2, var_4489);
                    }
                    while ((Boolean(_loc7_ = _loc7_.next)) && _loc7_.var_3785.material == this.var_2315);

                    this.var_2315.arcane::method_3124(_loc5_, _stage3DProxy);
                } else {
                    while ((Boolean(_loc7_ = _loc7_.next)) && _loc7_.var_3785.material == this.var_2315) {
                    }
                }
            }
            while (++_loc5_ < _loc4_);

            param1 = _loc7_;
        }
    }

    override arcane function dispose(): void {
        super.arcane::dispose();
        this.var_905.arcane::dispose();
        this.var_210.arcane::dispose();
        this.var_905 = null;
        this.var_210 = null;
    }
}
}
