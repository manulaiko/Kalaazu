package package_301 {

import away3d.arcane;

import flash.display3D.Context3DBlendFactor;
import flash.display3D.Context3DCompareMode;
import flash.display3D.textures.TextureBase;
import flash.geom.Rectangle;

import package_198.class_1208;

import package_298.DOSkybox;

import package_300.class_1759;

import package_305.class_1767;

import package_307.class_1772;

import package_376.class_2145;

import package_377.class_2146;

import package_378.class_2148;

public class class_1760 extends class_1759 {

    private static var var_354: int = 1;

    private static var var_2325: int = 2;

    private static var var_738: int = 3;


    public var var_874: Boolean = false;

    private var var_1312: DOSkybox;

    private var var_2315: class_1772;

    public function class_1760(param1: Boolean = false) {
        this.var_1312 = new DOSkybox();
        super(param1);
    }

    override arcane function set stage3DProxy(param1: class_1208): void {
        super.arcane::stage3DProxy = param1;
    }

    override arcane function method_1416(): class_2145 {
        return new class_2147();
    }

    override protected function method_1506(param1: class_2145, param2: TextureBase = null, param3: Rectangle = null, param4: int = 0): void {
        if (param2) {
            if (this.var_874) {
                this.var_1312.render(_stage3DProxy, param1, var_4489);
            }
            class_2148.var_5018 = this.method_2676(param1.method_6033, param1, var_354);
            class_2148.var_3525 = this.method_2676(param1.method_51, param1, var_354);
        }
        super.method_1506(param1, param2, param3, param4);
    }

    override protected function draw(param1: class_2145, param2: TextureBase): void {
        if (this.var_874) {
            this.var_1312.render(_stage3DProxy, param1, var_4489);
        }
        _context.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ZERO);
        _context.setDepthTest(true, Context3DCompareMode.LESS_EQUAL);
        var _loc3_: int = !!param2 ? int(var_2325) : int(var_738);
        class_2148.var_5018 = this.method_2676(param1.method_6033, param1, _loc3_);
        class_2148.var_3525 = this.method_2676(param1.method_51, param1, _loc3_);
        if (this.var_2315) {
            this.var_2315.arcane::deactivate(_stage3DProxy);
        }
        this.var_2315 = null;
        _context.setDepthTest(false, Context3DCompareMode.LESS_EQUAL);
    }

    private function method_2676(param1: class_2146, param2: class_2145, param3: int): int {
        var _loc5_: * = 0;
        var _loc6_: Number = 0;
        var _loc8_: * = null;
        var _loc9_: int = 0;
        var _loc4_: int = 0;
        var _loc7_: class_1767 = param2.camera;
        while (param1) {
            this.var_2315 = param1.var_3785.material;
            this.var_2315.arcane::method_3403(_context);
            _loc5_ = uint(this.var_2315.arcane::numPasses);
            _loc6_ = 0;
            do {
                _loc8_ = param1;
                if (((_loc9_ = !!this.var_2315.arcane::method_10(_loc6_) ? 1 : 2) & param3) != 0) {
                    this.var_2315.arcane::method_5696(_loc6_, _stage3DProxy, _loc7_);
                    do {
                        _loc4_++;
                        this.var_2315.arcane::method_3858(_loc6_, _loc8_.var_3785, _stage3DProxy, param2, var_4489);
                    }
                    while ((Boolean(_loc8_ = _loc8_.next)) && _loc8_.var_3785.material == this.var_2315);

                    this.var_2315.arcane::method_3124(_loc6_, _stage3DProxy);
                } else {
                    while ((Boolean(_loc8_ = _loc8_.next)) && _loc8_.var_3785.material == this.var_2315) {
                    }
                }
            }
            while (++_loc6_ < _loc5_);

            param1 = _loc8_;
        }
        return _loc4_;
    }

    override arcane function dispose(): void {
        super.arcane::dispose();
    }
}
}
