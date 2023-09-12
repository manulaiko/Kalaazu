package package_308 {

import flash.display.BitmapData;
import flash.display.BlendMode;

import package_307.class_1772;

import package_369.class_2116;
import package_369.class_2117;

public class AnimatedCloudMaterial extends class_1772 implements class_1773 {

    public static const const_1541: BitmapData = new BitmapData(128, 128, false, 0);

    {
        const_1541.perlinNoise(128, 128, 4, Math.random() * 1000, true, true, 7, true);
    }

    private var var_686: AnimatedCloudMaterialPass;

    public function AnimatedCloudMaterial() {
        super();
        this.var_686 = new AnimatedCloudMaterialPass(new class_2117(const_1541, true));
        method_5388(this.var_686);
        this.blendMode = BlendMode.LAYER;
        alphaPremultiplied = false;
    }

    override public function set blendMode(param1: String): void {
        super.blendMode = param1;
        this.var_686.method_4125(blendMode == BlendMode.NORMAL && Boolean(this.method_4490) ? "null" : blendMode);
    }

    override public function get method_4490(): Boolean {
        return true;
    }

    public function get method_2181(): AnimatedCloudMaterialPass {
        return this.var_686;
    }

    public function get texture(): class_2116 {
        return this.var_686.diffuse;
    }

    public function set texture(param1: class_2116): void {
        this.var_686.diffuse = param1;
    }
}
}

import away3d.arcane;

import flash.display3D.Context3D;
import flash.display3D.Context3DCompareMode;
import flash.display3D.Context3DProgramType;
import flash.display3D.Context3DTextureFormat;
import flash.geom.Matrix3D;
import flash.utils.getTimer;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_309.class_1774;

import package_369.class_2115;
import package_369.class_2116;

import package_371.class_2125;

class AnimatedCloudMaterialPass extends class_1774 {


    public var timeScale: Number = 180;

    public var border: Number = 0.1;

    private var _offsetTex: class_2116;

    private var _texture: class_2116;

    private var _fragmentData: Vector.<Number>;

    function AnimatedCloudMaterialPass(param1: class_2116) {
        this._fragmentData = new Vector.<Number>(4, true);
        super();
        this._offsetTex = param1;
        method_2615 = false;
        depthCompareMode = Context3DCompareMode.LESS_EQUAL;
    }

    override arcane function getVertexCode(): String {
        return ["m44 op, va0, vc0", "mov v0, va1"].join("\n") + "\n";
    }

    public function set diffuse(param1: class_2116): void {
        if (Boolean(param1) != Boolean(this._texture) || param1 && this._texture && (param1.method_5818 != this._texture.method_5818 || param1.format != this._texture.format)) {
            arcane::method_220();
        }
        this._texture = param1;
    }

    public function get diffuse(): class_2116 {
        return this._texture;
    }

    override arcane function activate(param1: class_1208, param2: class_1767): void {
        super.arcane::activate(param1, param2);
        if (this._texture) {
            param1.arcane::var_4582.setTextureAt(0, this._texture.method_6425(param1));
            param1.arcane::var_4582.setTextureAt(1, this._offsetTex.method_6425(param1));
            this._fragmentData[0] = getTimer() / 1000 / Number(this.timeScale);
            this._fragmentData[1] = this.border;
            this._fragmentData[2] = 1;
        } else {
            this._fragmentData[0] = 1;
            this._fragmentData[1] = 0;
            this._fragmentData[2] = 0;
            this._fragmentData[3] = 1;
        }
        param1.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, this._fragmentData);
    }

    override arcane function render(param1: class_2133, param2: class_1208, param3: class_1767, param4: Matrix3D): void {
        var _loc5_: Matrix3D;
        (_loc5_ = class_2125.const_1289).copyFrom(param1.method_846(param3));
        _loc5_.append(param4);
        param2.arcane::var_4582.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, _loc5_, true);
        param1.method_748(0, param2);
        param1.method_2801(1, param2);
        param2.arcane::var_4582.drawTriangles(param1.method_612(param2), 0, param1.name_42);
    }

    override arcane function deactivate(param1: class_1208): void {
        var _loc2_: Context3D = param1.arcane::var_4582;
        if (this._texture) {
            _loc2_.setTextureAt(0, null);
            _loc2_.setTextureAt(1, null);
        }
        _loc2_.setVertexBufferAt(0, null);
        _loc2_.setVertexBufferAt(1, null);
        super.arcane::deactivate(param1);
    }

    override arcane function getFragmentCode(param1: String): String {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (this._texture) {
            _loc3_ = "fs0";
            _loc4_ = "fs1";
            _loc5_ = "ft0";
            _loc6_ = "ft1";
            _loc7_ = "v0";
            return (_loc8_ = [this.getTex2DSampleCode(_loc5_, _loc4_, this._offsetTex, _loc7_, "clamp"), "mul " + _loc5_ + ", " + _loc5_ + ", " + _loc7_, "add " + _loc5_ + ".x, " + _loc5_ + ".xy, " + "fc0" + ".xx", this.getTex2DSampleCode(_loc6_, _loc3_, this._texture, _loc5_, "repeat"), "div " + _loc5_ + ".xy, v0.xy, " + "fc0" + ".yy", "sub " + _loc5_ + ".zw," + "fc0" + ".zzzz, " + _loc7_ + ".xxxy", "div " + _loc5_ + ".zw," + _loc5_ + ".xxzw, " + "fc0" + ".yyyy", "sat " + _loc5_ + ", " + _loc5_, "mul " + _loc6_ + ".w, " + _loc6_ + ".w" + _loc5_ + ".x", "mul " + _loc6_ + ".w, " + _loc6_ + ".w" + _loc5_ + ".y", "mul " + _loc6_ + ".w, " + _loc6_ + ".w" + _loc5_ + ".z", "mul " + _loc6_ + ".w, " + _loc6_ + ".w" + _loc5_ + ".w", "mov oc, " + _loc6_].join("\n")) + "\n";
        }
        return "mov oc, fc0\n";
    }

    protected function getTex2DSampleCode(param1: String, param2: String, param3: class_2115, param4: String, param5: String): String {
        var _loc7_: * = null;
        var _loc6_: String = param5;
        var _loc8_: String = this.getFormatStringForTexture(param3);
        var _loc9_: Boolean = Boolean(var_2370) && Boolean(param3.method_5818);
        if (_smooth) {
            _loc7_ = _loc9_ ? "linear,miplinear" : "linear";
        } else {
            _loc7_ = _loc9_ ? "nearest,mipnearest" : "nearest";
        }
        return "tex " + param1 + ", " + param4 + ", " + param2 + " <2d," + _loc7_ + "," + _loc8_ + _loc6_ + ">\n";
    }

    private function getFormatStringForTexture(param1: class_2115): String {
        switch (param1.format) {
            case Context3DTextureFormat.COMPRESSED:
                return "dxt1,";
            case "compressedAlpha":
                return "dxt5,";
            default:
                return "";
        }
    }
}
