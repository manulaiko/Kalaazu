package package_300 {

import flash.display3D.*;
import flash.display3D.textures.*;
import flash.events.*;

import package_198.*;

import package_199.*;

import package_305.*;

import package_306.*;

import package_384.*;

public class class_2155 {


    private var _filters: Vector.<class_1768>;

    private var var_1323: Vector.<class_2232>;

    private var var_2709: Boolean;

    private var var_1743: TextureBase;

    private var var_411: Boolean;

    private var var_1776: RTTBufferManager;

    private var _stage3DProxy: class_1208;

    private var var_1266: Boolean = true;

    public function class_2155(param1: class_1208) {
        super();
        this._stage3DProxy = param1;
        this._stage3DProxy.addEventListener(class_1209.const_2172, this.method_2082);
        this.var_1776 = RTTBufferManager.getInstance(param1);
        this.var_1776.addEventListener(Event.RESIZE, this.method_5865);
    }

    private function method_2082(param1: class_1209): void {
        this.var_1266 = true;
    }

    private function method_5865(param1: Event): void {
        this.var_1266 = true;
    }

    public function get method_4805(): Boolean {
        return this.var_411;
    }

    public function getMainInputTexture(param1: class_1208): TextureBase {
        if (this.var_2709) {
            this.method_4384(param1);
        }
        return this.var_1743;
    }

    public function get filters(): Vector.<class_1768> {
        return this._filters;
    }

    public function set filters(param1: Vector.<class_1768>): void {
        this._filters = param1;
        this.var_2709 = true;
        this.var_411 = false;
        if (!this._filters) {
            return;
        }
        var _loc2_: int = 0;
        while (_loc2_ < this._filters.length) {
            this.var_411 = Boolean(this.var_411) || Boolean(this._filters[_loc2_].method_4805);
            _loc2_++;
        }
        this.var_1266 = true;
    }

    private function method_4384(param1: class_1208): void {
        var _loc2_: * = 0;
        var _loc3_: * = null;
        if (this.var_1266) {
            this.method_2161();
        }
        if (!this._filters) {
            this.var_1323 = null;
            return;
        }
        this.var_1323 = new Vector.<class_2232>();
        _loc2_ = this._filters.length - 1;
        var _loc4_: Number = 0;
        while (_loc4_ <= _loc2_) {
            _loc3_ = this._filters[_loc4_];
            _loc3_.method_4953(_loc4_ == _loc2_ ? null : class_1768(this._filters[_loc4_ + 1]).getMainInputTexture(param1) as Texture, param1);
            this.var_1323 = this.var_1323.concat(_loc3_.method_3054);
            _loc4_++;
        }
        this.var_1743 = this._filters[0].getMainInputTexture(param1);
    }

    public function render(param1: class_1208, param2: class_1767, param3: Texture, param4: Boolean): void {
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: Context3D = param1.context3D;
        var _loc9_: IndexBuffer3D = this.var_1776.indexBuffer;
        var _loc10_: VertexBuffer3D = this.var_1776.method_2607;
        if (!this._filters) {
            return;
        }
        if (this.var_1266) {
            this.method_2161();
        }
        if (this.var_2709) {
            this.method_4384(param1);
        }
        _loc5_ = int(this._filters.length);
        _loc6_ = 0;
        while (_loc6_ < _loc5_) {
            this._filters[_loc6_].update(param1, param2);
            _loc6_++;
        }
        if ((_loc5_ = int(this.var_1323.length)) > 1) {
            _loc8_.setVertexBufferAt(0, _loc10_, 0, Context3DVertexBufferFormat.FLOAT_2);
            _loc8_.setVertexBufferAt(1, _loc10_, 2, Context3DVertexBufferFormat.FLOAT_2);
        }
        _loc6_ = 0;
        while (_loc6_ < _loc5_) {
            _loc7_ = this.var_1323[_loc6_];
            param1.setRenderTarget(_loc7_.target);
            _loc8_.setTextureAt(0, _loc7_.getMainInputTexture(param1));
            _loc8_.setProgram(_loc7_.method_3985(param1));
            if (!_loc7_.target) {
                param1.method_2358 = null;
                _loc10_ = this.var_1776.method_5717;
                _loc8_.setVertexBufferAt(0, _loc10_, 0, Context3DVertexBufferFormat.FLOAT_2);
                _loc8_.setVertexBufferAt(1, _loc10_, 2, Context3DVertexBufferFormat.FLOAT_2);
            }
            if (!_loc7_.target && param4) {
                _loc8_.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
            } else {
                _loc8_.clear(0, 0, 0, 0);
                _loc8_.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ZERO);
            }
            _loc7_.activate(param1, param2, param3);
            _loc8_.drawTriangles(_loc9_, 0, 2);
            _loc7_.deactivate(param1);
            _loc6_++;
        }
        _loc8_.setTextureAt(0, null);
        _loc8_.setVertexBufferAt(0, null);
        _loc8_.setVertexBufferAt(1, null);
    }

    private function method_2161(): void {
        var _loc1_: int = 0;
        while (_loc1_ < this._filters.length) {
            this._filters[_loc1_].method_1430 = this.var_1776.method_1430;
            this._filters[_loc1_].method_1059 = this.var_1776.method_1059;
            _loc1_++;
        }
        this.var_1266 = false;
    }

    public function dispose(): void {
        this.var_1776.removeEventListener(Event.RESIZE, this.method_5865);
        this.var_1776 = null;
        this._stage3DProxy.removeEventListener(class_1209.const_2172, this.method_2082);
        this._stage3DProxy = null;
    }
}
}
