package package_308 {

import package_369.class_2115;

public class SectorControlBeaconMaterial extends class_1777 {


    private var var_2164: ProgressMethod;

    public function SectorControlBeaconMaterial() {
        super();
        this.var_2164 = new ProgressMethod();
        addMethod(this.var_2164);
    }

    override public function get glowMap(): class_2115 {
        return this.var_2164.texture;
    }

    override public function set glowMap(param1: class_2115): void {
        this.var_2164.texture = param1;
    }
}
}

import away3d.arcane;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_310.class_1780;
import package_310.class_2252;

import package_369.class_2115;

import package_385.class_2237;
import package_385.class_2251;

class ProgressMethod extends class_1780 {


    private var _useTexture: Boolean;

    private var _texture: class_2115;

    function ProgressMethod() {
        super();
    }

    override arcane function initVO(param1: class_2252): void {
        super.arcane::initVO(param1);
        param1.var_3859 = true;
    }

    public function get texture(): class_2115 {
        return this._texture;
    }

    public function set texture(param1: class_2115): void {
        if (Boolean(param1) != this._useTexture || param1 && this._texture && (param1.method_5818 != this._texture.method_5818 || param1.format != this._texture.format)) {
            method_220();
        }
        this._useTexture = Boolean(param1);
        this._texture = param1;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        if (this._useTexture) {
            param2.context3D.setTextureAt(param1.var_2852, this._texture.method_6425(param2));
        }
    }

    override arcane function setRenderState(param1: class_2252, param2: class_2133, param3: class_1208, param4: class_1767): void {
        var _loc5_: Number = NaN;
        var _loc6_: * = 0;
        super.arcane::setRenderState(param1, param2, param3, param4);
        if (this._useTexture) {
            _loc5_ = Number(!!param2.name_55 ? Number(param2.name_55.progress) || false : 0);
            _loc6_ = uint(!!param2.name_55 ? uint(param2.name_55.progressColor) || false : 0);
            param1.var_3329[param1.var_2676 + 0] = (_loc6_ >> 16 & 255) / 255;
            param1.var_3329[param1.var_2676 + 1] = (_loc6_ >> 8 & 255) / 255;
            param1.var_3329[param1.var_2676 + 2] = (_loc6_ >> 0 & 255) / 255;
            param1.var_3329[param1.var_2676 + 3] = 1 - _loc5_;
            param1.var_3329[param1.var_2676 + 4] = 1.5;
        }
    }

    override arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc4_: String = "";
        if (this._useTexture) {
            _loc5_ = param2.method_3238();
            param1.var_2852 = _loc5_.index;
            _loc6_ = param2.method_1853();
            param1.var_2676 = Number(_loc6_.index) * 4;
            _loc7_ = param2.method_1853();
            _loc8_ = param2.method_4834();
            param2.method_4539(_loc8_, 1);
            _loc4_ += [getTex2DSampleCode(param1, _loc8_, _loc5_, this._texture), "mul " + _loc8_ + ".xyz, " + _loc8_ + ".xyz, " + _loc6_ + ".xyz", "sge " + _loc8_ + ".w, " + _loc8_ + ".wwww, " + _loc6_ + ".wwww", "mul " + _loc8_ + ".xyz, " + _loc8_ + ".xyz, " + _loc8_ + ".wwww", "mul " + _loc8_ + ".xyz, " + _loc8_ + ".xyz, " + _loc7_ + ".xxxx", "add " + param3 + ".xyz, " + param3 + ", " + _loc8_].join("\n") + "\n";
            param2.method_771(_loc8_);
        } else {
            _loc4_ += "mov " + param3 + ", " + param3 + "\n";
        }
        return _loc4_;
    }
}
