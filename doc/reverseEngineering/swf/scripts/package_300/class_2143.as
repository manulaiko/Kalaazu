package package_300 {

import com.adobe.utils.AGALMiniAssembler;

import flash.display3D.Context3D;
import flash.display3D.Context3DBlendFactor;
import flash.display3D.Context3DProgramType;
import flash.display3D.Context3DTextureFormat;
import flash.display3D.Context3DVertexBufferFormat;
import flash.display3D.IndexBuffer3D;
import flash.display3D.Program3D;
import flash.display3D.VertexBuffer3D;

import package_198.class_1208;

import package_291.class_1745;

import package_369.class_2116;

public class class_2143 {


    private var var_3992: Program3D;

    private var _texture: class_2116;

    private var _indexBuffer: IndexBuffer3D;

    private var _vertexBuffer: VertexBuffer3D;

    private var _stage3DProxy: class_1208;

    private var _context: Context3D;

    public function class_2143(param1: class_1208) {
        super();
        this.stage3DProxy = param1;
    }

    public function get stage3DProxy(): class_1208 {
        return this._stage3DProxy;
    }

    public function set stage3DProxy(param1: class_1208): void {
        if (param1 == this._stage3DProxy) {
            return;
        }
        this._stage3DProxy = param1;
        this.method_5340();
    }

    private function method_5340(): void {
        if (this._vertexBuffer) {
            this._vertexBuffer.dispose();
            this._vertexBuffer = null;
            this.var_3992.dispose();
            this.var_3992 = null;
            this._indexBuffer.dispose();
            this._indexBuffer = null;
        }
    }

    private function getVertexCode(): String {
        return "mov op, va0\nmov v0, va1";
    }

    private function getFragmentCode(): String {
        var _loc1_: * = null;
        switch (this._texture.format) {
            case Context3DTextureFormat.COMPRESSED:
                _loc1_ = "dxt1,";
                break;
            case "compressedAlpha":
                _loc1_ = "dxt5,";
                break;
            default:
                _loc1_ = "";
        }
        return "tex ft0, v0, fs0 <2d, " + _loc1_ + "linear>\t\n" + "mov oc, ft0";
    }

    public function dispose(): void {
        this.method_5340();
    }

    public function render(): void {
        var _loc1_: Context3D = this._stage3DProxy.context3D;
        if (_loc1_ != this._context) {
            this.method_5340();
            this._context = _loc1_;
        }
        if (!_loc1_) {
            return;
        }
        if (!this._vertexBuffer) {
            this.method_3670(_loc1_);
        }
        _loc1_.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ZERO);
        _loc1_.setProgram(this.var_3992);
        _loc1_.setTextureAt(0, this._texture.method_6425(this._stage3DProxy));
        _loc1_.setVertexBufferAt(0, this._vertexBuffer, 0, Context3DVertexBufferFormat.FLOAT_2);
        _loc1_.setVertexBufferAt(1, this._vertexBuffer, 2, Context3DVertexBufferFormat.FLOAT_2);
        _loc1_.drawTriangles(this._indexBuffer, 0, 2);
        _loc1_.setVertexBufferAt(0, null);
        _loc1_.setVertexBufferAt(1, null);
        _loc1_.setTextureAt(0, null);
    }

    private function method_3670(param1: Context3D): void {
        this._vertexBuffer = param1.createVertexBuffer(4, 4);
        this.var_3992 = param1.createProgram();
        this._indexBuffer = param1.createIndexBuffer(6);
        this._indexBuffer.uploadFromVector(Vector.<uint>([2, 1, 0, 3, 2, 0]), 0, 6);
        this.var_3992.upload(new AGALMiniAssembler(class_1745.active).assemble(Context3DProgramType.VERTEX, this.getVertexCode()), new AGALMiniAssembler(class_1745.active).assemble(Context3DProgramType.FRAGMENT, this.getFragmentCode()));
        var _loc2_: Number = 2;
        var _loc3_: Number = 2;
        var _loc4_: Number = -1;
        var _loc5_: Number = 1;
        if (this._stage3DProxy.method_2358) {
            _loc4_ = (Number(this._stage3DProxy.method_2358.x) * 2 - Number(this._stage3DProxy.viewPort.width)) / Number(this._stage3DProxy.viewPort.width);
            _loc5_ = (Number(this._stage3DProxy.method_2358.y) * 2 - Number(this._stage3DProxy.viewPort.height)) / Number(this._stage3DProxy.viewPort.height) * -1;
            _loc2_ = 2 / (Number(this._stage3DProxy.viewPort.width) / Number(this._stage3DProxy.method_2358.width));
            _loc3_ = 2 / (Number(this._stage3DProxy.viewPort.height) / Number(this._stage3DProxy.method_2358.height));
        }
        this._vertexBuffer.uploadFromVector(Vector.<Number>([_loc4_, _loc5_ - _loc3_, 0, 1, _loc4_ + _loc2_, _loc5_ - _loc3_, 1, 1, _loc4_ + _loc2_, _loc5_, 1, 0, _loc4_, _loc5_, 0, 0]), 0, 4);
    }

    public function get texture(): class_2116 {
        return this._texture;
    }

    public function set texture(param1: class_2116): void {
        this._texture = param1;
    }
}
}
