package package_300 {

import away3d.arcane;

import flash.display3D.Context3DBlendFactor;
import flash.display3D.Context3DCompareMode;
import flash.display3D.textures.TextureBase;
import flash.geom.Rectangle;

import package_294.class_2133;

import package_304.class_1766;

import package_305.class_1767;

import package_307.class_1772;

import package_371.class_2230;

import package_376.class_2145;

import package_377.class_2146;

public class class_2152 extends class_1759 {


    private var var_2315: class_1772;

    private var var_693: Boolean;

    private var var_1620: Boolean;

    private var var_3215: Boolean;

    public function class_2152(param1: Boolean = false, param2: Boolean = false) {
        super();
        this.var_693 = param1;
        this.var_1620 = param2;
        var_322 = 1;
        var_3609 = 1;
        var_2804 = 1;
    }

    public function get method_1981(): Boolean {
        return this.var_3215;
    }

    public function set method_1981(param1: Boolean): void {
        this.var_3215 = param1;
    }

    override arcane function set method_2738(param1: Number): void {
    }

    override arcane function set method_699(param1: Number): void {
    }

    override arcane function set method_5020(param1: Number): void {
    }

    arcane function method_5201(param1: class_2145, param2: TextureBase, param3: uint, param4: Vector.<Rectangle>, param5: Vector.<class_1767>): void {
        var_2232 = param2;
        var_3365 = 0;
        var_3782.sort(param1);
        _stage3DProxy.setRenderTarget(param2, true, 0);
        _context.clear(1, 1, 1, 1, 1, 0);
        _context.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ZERO);
        _context.setDepthTest(true, Context3DCompareMode.LESS);
        var _loc6_: class_2146 = param1.method_6033;
        var _loc7_: Boolean = true;
        var _loc8_: int = param3 - 1;
        while (_loc8_ >= 0) {
            _stage3DProxy.method_2358 = param4[_loc8_];
            this.method_2142(_loc6_, param5[_loc8_], _loc7_ ? null : param5[_loc8_].method_5756);
            _loc7_ = false;
            _loc8_--;
        }
        if (this.var_2315) {
            this.var_2315.arcane::method_4073(_stage3DProxy);
        }
        this.var_2315 = null;
        _context.setDepthTest(false, Context3DCompareMode.LESS_EQUAL);
        _stage3DProxy.method_2358 = null;
    }

    private function method_2142(param1: class_2146, param2: class_1767, param3: Vector.<class_2230>): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        while (param1) {
            if (param1.var_474) {
                param1 = param1.next;
            } else {
                _loc6_ = (_loc5_ = param1.var_3785).method_1409;
                if (!param3 || Boolean(_loc6_.method_5720.method_3128(param3, 4))) {
                    _loc4_ = _loc5_.material;
                    if (this.var_2315 != _loc4_) {
                        if (this.var_2315) {
                            this.var_2315.arcane::method_4073(_stage3DProxy);
                        }
                        this.var_2315 = _loc4_;
                        this.var_2315.arcane::method_1463(_stage3DProxy, param2, false);
                    }
                    this.var_2315.arcane::method_4057(_loc5_, _stage3DProxy, param2, param2.method_2785);
                } else {
                    param1.var_474 = true;
                }
                param1 = param1.next;
            }
        }
    }

    override protected function draw(param1: class_2145, param2: TextureBase): void {
        _context.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ZERO);
        _context.setDepthTest(true, Context3DCompareMode.LESS);
        this.method_2676(param1.method_6033, param1);
        if (this.var_3215) {
            _context.setColorMask(false, false, false, false);
        }
        if (this.var_693) {
            this.method_2676(param1.method_51, param1);
        }
        if (this.var_2315) {
            this.var_2315.arcane::method_4073(_stage3DProxy);
        }
        if (this.var_3215) {
            _context.setColorMask(true, true, true, true);
        }
        this.var_2315 = null;
    }

    private function method_2676(param1: class_2146, param2: class_2145): void {
        var _loc4_: * = null;
        var _loc3_: class_1767 = param2.camera;
        while (param1) {
            this.var_2315 = param1.var_3785.material;
            if (Boolean(this.var_3215) && Boolean(this.var_2315.arcane::method_2221())) {
                _loc4_ = param1;
                while ((Boolean(_loc4_ = _loc4_.next)) && _loc4_.var_3785.material == this.var_2315) {
                }
            } else {
                this.var_2315.arcane::method_1463(_stage3DProxy, _loc3_, this.var_1620);
                _loc4_ = param1;
                do {
                    this.var_2315.arcane::method_4057(_loc4_.var_3785, _stage3DProxy, _loc3_, var_4489);
                }
                while ((Boolean(_loc4_ = _loc4_.next)) && _loc4_.var_3785.material == this.var_2315);

                this.var_2315.arcane::method_4073(_stage3DProxy);
            }
            param1 = _loc4_;
        }
    }
}
}
