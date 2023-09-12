package package_298 {

import away3d.arcane;

import flash.geom.Matrix3D;
import flash.geom.Vector3D;

import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;

import package_198.class_1208;

import package_295.class_1752;

import package_304.class_2114;

import package_369.class_2116;

import package_376.class_2145;

public class DOSkybox {


    private var var_1333: class_2114;

    private var var_642: DOSkyBoxMaterialPass;

    private var _loading: Boolean = false;

    public function DOSkybox() {
        super();
        this.var_642 = new DOSkyBoxMaterialPass();
    }

    public function render(param1: class_1208, param2: class_2145, param3: Matrix3D): void {
        var _loc4_: * = null;
        if (this.var_1333) {
            _loc4_ = class_1210.instance.method_3528.method_4821.method_4267;
            this.var_1333.moveTo(_loc4_.x, _loc4_.y, _loc4_.z);
            this.var_642.arcane::activate(param1, param2.camera);
            this.var_642.arcane::render(this.var_1333.method_3381[0], param1, param2.camera, param3);
            this.var_642.arcane::deactivate(param1);
        } else if (!this._loading) {
            class_1210.instance.method_3562.loadTexture("skybox_stars", class_1210.const_2789).addOnce(this.method_6020);
            this._loading = true;
        }
    }

    private function method_6020(param1: class_2116): void {
        class_1210.instance.method_3562.method_4006(param1);
        this.var_642.starsTexture = param1;
        class_1210.instance.method_3562.loadTexture("skybox_mask", class_1210.const_2789).addOnce(this.method_623);
    }

    private function method_623(param1: class_2116): void {
        class_1210.instance.method_3562.method_4006(param1);
        this.var_642.starsMaskTexture = param1;
        class_1210.instance.method_3761.method_3479("skybox_geometry", class_1210.const_2789).addOnce(this.method_2874);
    }

    private function method_2874(param1: class_1752): void {
        class_1210.instance.method_3761.method_1440(param1);
        this.var_1333 = param1.getChildAt(0) as class_2114;
        this.var_1333.scale(10000);
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

class DOSkyBoxMaterialPass extends class_1774 {


    public var starsTexture: class_2116;

    public var starsMaskTexture: class_2116;

    public var timeScale: Number = 120;

    private const _fragmentData: Vector.<Number> = new Vector.<Number>(4, true);

    function DOSkyBoxMaterialPass() {
        super();
        method_2615 = false;
        depthCompareMode = Context3DCompareMode.LESS_EQUAL;
        alphaPremultiplied = false;
        _smooth = true;
    }

    override arcane function render(param1: class_2133, param2: class_1208, param3: class_1767, param4: Matrix3D): void {
        var _loc5_: Matrix3D;
        (_loc5_ = class_2125.const_1289).copyFrom(param1.method_846(param3));
        _loc5_.append(param4);
        param2.arcane::var_4582.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, _loc5_, true);
        param1.method_748(0, param2);
        param1.method_2801(1, param2);
        var _loc6_: Number = getTimer() / 1000 / Number(this.timeScale);
        this._fragmentData[0] = _loc6_ * 2;
        this._fragmentData[1] = _loc6_ + 1;
        this._fragmentData[2] = -_loc6_ * 1.5;
        this._fragmentData[3] = _loc6_ + 0.3;
        param2.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, this._fragmentData);
        param2.arcane::var_4582.setTextureAt(0, this.starsTexture.method_6425(param2));
        param2.arcane::var_4582.setTextureAt(1, this.starsMaskTexture.method_6425(param2));
        param2.arcane::var_4582.drawTriangles(param1.method_612(param2));
    }

    override arcane function deactivate(param1: class_1208): void {
        var _loc2_: Context3D = param1.arcane::var_4582;
        _loc2_.setTextureAt(0, null);
        _loc2_.setTextureAt(1, null);
        _loc2_.setTextureAt(2, null);
        _loc2_.setVertexBufferAt(0, null);
        _loc2_.setVertexBufferAt(1, null);
        super.arcane::deactivate(param1);
    }

    override arcane function getVertexCode(): String {
        return ["m44 op, va0, vc0", "mov v0, va1"].join("\n") + "\n";
    }

    override arcane function getFragmentCode(param1: String): String {
        var _loc9_: String;
        return (_loc9_ = ["add ft0, v0, fc0", this.getTex2DSampleCode("ft0", "fs1", this.starsMaskTexture, "ft0", "repeat"), "add ft2, v0, fc0.zw", this.getTex2DSampleCode("ft2", "fs1", this.starsMaskTexture, "ft2", "repeat"), "mul ft0, ft0, ft2", this.getTex2DSampleCode("ft2", "fs0", this.starsTexture, "v0", "clamp"), "mul ft0, ft0, ft2", "mov oc, ft0"].join("\n")) + "\n";
    }

    private function getTex2DSampleCode(param1: String, param2: String, param3: class_2115, param4: String, param5: String): String {
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
