package package_300 {

import away3d.arcane;

import flash.display.BitmapData;
import flash.display3D.Context3D;
import flash.display3D.Context3DCompareMode;
import flash.display3D.textures.TextureBase;
import flash.events.Event;
import flash.geom.Matrix3D;
import flash.geom.Rectangle;

import package_198.class_1208;

import package_199.class_1209;

import package_369.class_2116;

import package_374.AbstractMethodError;

import package_375.class_2141;
import package_375.class_2142;

import package_376.class_2145;

public class class_1759 {


    protected var _context: Context3D;

    protected var _stage3DProxy: class_1208;

    protected var var_322: Number = 0;

    protected var var_3609: Number = 0;

    protected var var_2804: Number = 0;

    protected var _backgroundAlpha: Number = 1;

    protected var var_1338: Boolean = false;

    protected var var_2232: TextureBase;

    protected var var_3365: int;

    protected var _viewWidth: Number;

    protected var _viewHeight: Number;

    protected var var_3782: class_2141;

    private var var_3071: class_2143;

    private var _background: class_2116;

    protected var var_3093: Boolean;

    protected var var_29: uint;

    protected var var_2675: Number = 1;

    protected var var_261: Number = 1;

    private var var_3352: BitmapData;

    private var var_1103: Boolean;

    private var var_3448: Boolean = true;

    protected var var_4489: Matrix3D;

    public function class_1759(param1: Boolean = false) {
        this.var_4489 = new Matrix3D();
        super();
        this.var_3782 = new class_2142();
        this.var_3093 = param1;
    }

    arcane function method_1416(): class_2145 {
        return new class_2145();
    }

    arcane function get viewWidth(): Number {
        return this._viewWidth;
    }

    arcane function set viewWidth(param1: Number): void {
        this._viewWidth = param1;
    }

    arcane function get viewHeight(): Number {
        return this._viewHeight;
    }

    arcane function set viewHeight(param1: Number): void {
        this._viewHeight = param1;
    }

    arcane function get method_2502(): Boolean {
        return this.var_3093;
    }

    public function get method_2825(): class_2141 {
        return this.var_3782;
    }

    public function set method_2825(param1: class_2141): void {
        this.var_3782 = param1;
    }

    arcane function get method_4728(): Boolean {
        return this.var_3448;
    }

    arcane function set method_4728(param1: Boolean): void {
        this.var_3448 = param1;
    }

    arcane function get method_2738(): Number {
        return this.var_322;
    }

    arcane function set method_2738(param1: Number): void {
        this.var_322 = param1;
    }

    arcane function get method_699(): Number {
        return this.var_3609;
    }

    arcane function set method_699(param1: Number): void {
        this.var_3609 = param1;
    }

    arcane function get method_5020(): Number {
        return this.var_2804;
    }

    arcane function set method_5020(param1: Number): void {
        this.var_2804 = param1;
    }

    arcane function get stage3DProxy(): class_1208 {
        return this._stage3DProxy;
    }

    arcane function set stage3DProxy(param1: class_1208): void {
        if (param1 == this._stage3DProxy) {
            return;
        }
        if (!param1) {
            if (this._stage3DProxy) {
                this._stage3DProxy.removeEventListener(class_1209.const_2496, this.method_5775);
                this._stage3DProxy.removeEventListener(class_1209.const_2172, this.method_5775);
            }
            this._stage3DProxy = null;
            this._context = null;
            return;
        }
        this._stage3DProxy = param1;
        this._stage3DProxy.addEventListener(class_1209.const_2496, this.method_5775);
        this._stage3DProxy.addEventListener(class_1209.const_2172, this.method_5775);
        if (this.var_3071) {
            this.var_3071.stage3DProxy = param1;
        }
        if (param1.context3D) {
            this._context = param1.context3D;
        }
    }

    arcane function get shareContext(): Boolean {
        return this.var_1338;
    }

    arcane function set shareContext(param1: Boolean): void {
        this.var_1338 = param1;
    }

    arcane function dispose(): void {
        this.arcane::stage3DProxy = null;
        if (this.var_3071) {
            this.var_3071.dispose();
            this.var_3071 = null;
        }
    }

    arcane function render(param1: class_2145, param2: TextureBase = null, param3: Rectangle = null, param4: int = 0): void {
        if (!this._stage3DProxy || !this._context) {
            return;
        }
        this.var_4489.copyFrom(param1.camera.method_2785);
        this.var_4489.appendScale(this.var_2675, this.var_261, 1);
        this.method_1506(param1, param2, param3, param4);
        var _loc5_: Number = 0;
        while (_loc5_ < 8) {
            this._context.setVertexBufferAt(_loc5_, null);
            this._context.setTextureAt(_loc5_, null);
            _loc5_++;
        }
    }

    protected function method_1506(param1: class_2145, param2: TextureBase = null, param3: Rectangle = null, param4: int = 0): void {
        this.var_2232 = param2;
        this.var_3365 = param4;
        if (this.var_3782) {
            this.var_3782.sort(param1);
        }
        if (this.var_3093) {
            this.method_548(param1);
        }
        this._stage3DProxy.setRenderTarget(param2, true, param4);
        if ((param2 || !this.var_1338) && Boolean(this.var_3448)) {
            this._context.clear(this.var_322, this.var_3609, this.var_2804, this._backgroundAlpha, 1, 0);
        }
        this._context.setDepthTest(false, Context3DCompareMode.ALWAYS);
        this._stage3DProxy.method_2358 = param3;
        if (this.var_3071) {
            this.var_3071.render();
        }
        this.draw(param1, param2);
        this._context.setDepthTest(false, Context3DCompareMode.LESS_EQUAL);
        if (!this.var_1338) {
            if (Boolean(this.var_1103) && Boolean(this.var_3352)) {
                this._context.drawToBitmapData(this.var_3352);
                this.var_1103 = false;
            }
        }
        this._stage3DProxy.method_2358 = null;
    }

    public function method_3604(param1: BitmapData): void {
        this.var_1103 = true;
        this.var_3352 = param1;
    }

    protected function method_548(param1: class_2145): void {
        throw new AbstractMethodError();
    }

    protected function draw(param1: class_2145, param2: TextureBase): void {
        throw new AbstractMethodError();
    }

    private function method_5775(param1: Event): void {
        this._context = this._stage3DProxy.context3D;
    }

    arcane function get backgroundAlpha(): Number {
        return this._backgroundAlpha;
    }

    arcane function set backgroundAlpha(param1: Number): void {
        this._backgroundAlpha = param1;
    }

    arcane function get background(): class_2116 {
        return this._background;
    }

    arcane function set background(param1: class_2116): void {
        if (Boolean(this.var_3071) && !param1) {
            this.var_3071.dispose();
            this.var_3071 = null;
        }
        if (!this.var_3071 && Boolean(param1)) {
            this.var_3071 = new class_2143(this._stage3DProxy);
        }
        this._background = param1;
        if (this.var_3071) {
            this.var_3071.texture = param1;
        }
    }

    public function get method_3770(): class_2143 {
        return this.var_3071;
    }

    public function get method_6236(): uint {
        return this.var_29;
    }

    public function set method_6236(param1: uint): void {
        this.var_29 = param1;
    }

    arcane function get method_5446(): Number {
        return this.var_2675;
    }

    arcane function set method_5446(param1: Number): void {
        this.var_2675 = param1;
    }

    arcane function get method_1932(): Number {
        return this.var_261;
    }

    arcane function set method_1932(param1: Number): void {
        this.var_261 = param1;
    }
}
}
