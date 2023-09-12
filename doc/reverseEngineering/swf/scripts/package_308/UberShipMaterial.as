package package_308 {

import flash.display.BitmapData;

import package_369.class_2117;

public class UberShipMaterial extends class_1777 {

    public static const const_1541: BitmapData = new BitmapData(128, 128, false, 0);

    public static const const_2391: BitmapData = new BitmapData(128, 128, false, 0);

    {
        const_2391.perlinNoise(32, 32, 8, Math.random() * 1000, true, false, 1);
        const_1541.perlinNoise(32, 32, 8, Math.random() * 1000, true, false, 7, true);
    }

    private var var_2161: UberMaterialMethod;

    public function UberShipMaterial() {
        super();
        this.var_2161 = new UberMaterialMethod(new class_2117(const_2391, true), new class_2117(const_1541, true));
        addMethod(this.var_2161);
    }

    public function get method_995(): UberMaterialMethod {
        return this.var_2161;
    }
}
}

import away3d.arcane;

import flash.utils.getTimer;

import package_198.class_1208;

import package_310.class_1780;
import package_310.class_2252;

import package_369.class_2116;

import package_385.class_2237;
import package_385.class_2251;

class UberMaterialMethod extends class_1780 {


    public var timeScale: Number = 10;

    public var glowStrength: Number = 5;

    private var _colorTex: class_2116;

    private var _offsetTex: class_2116;

    private var _offsetTextureReg: class_2251;

    private var _colorTextureReg: class_2251;

    function UberMaterialMethod(param1: class_2116, param2: class_2116) {
        super();
        this._colorTex = param1;
        this._offsetTex = param2;
    }

    override arcane function initVO(param1: class_2252): void {
        param1.var_3859 = true;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        super.arcane::activate(param1, param2);
        param2.context3D.setTextureAt(this._offsetTextureReg.index, this._offsetTex.method_6425(param2));
        param2.context3D.setTextureAt(this._colorTextureReg.index, this._colorTex.method_6425(param2));
        param1.var_3329[param1.var_2676] = getTimer() / 1000 / Number(this.timeScale);
        param1.var_3329[param1.var_2676 + 1] = this.glowStrength;
    }

    override arcane function deactivate(param1: class_2252, param2: class_1208): void {
        param2.context3D.setTextureAt(this._offsetTextureReg.index, null);
        param2.context3D.setTextureAt(this._colorTextureReg.index, null);
        super.arcane::deactivate(param1, param2);
    }

    override arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        this._offsetTextureReg = param2.method_3238();
        this._colorTextureReg = param2.method_3238();
        var _loc4_: class_2251 = param2.method_1853();
        param1.var_2676 = Number(_loc4_.index) * 4;
        var _loc5_: class_2251 = param2.method_4834();
        param2.method_4539(_loc5_, 1);
        var _loc6_: class_2251 = param2.method_4834();
        param2.method_4539(_loc6_, 1);
        var _loc7_: String = [getTex2DSampleCode(param1, _loc5_, this._offsetTextureReg, this._offsetTex, null, "clamp"), "mul " + _loc6_ + ", " + _loc5_ + ", " + var_1283.var_443, "add " + _loc6_ + ".xy, " + _loc6_ + ".xy, " + _loc4_ + ".xx", getTex2DSampleCode(param1, _loc6_, this._colorTextureReg, this._colorTex, _loc6_, "repeat"), "mul " + _loc5_ + ", " + _loc5_ + ", " + _loc6_, "mul " + _loc5_ + ", " + _loc5_ + ", " + _loc4_ + ".yyyy", "add " + param3 + ".xyz, " + param3 + ", " + _loc5_ + "\n"].join("\n");
        param2.method_771(_loc5_);
        param2.method_771(_loc6_);
        return _loc7_;
    }
}
