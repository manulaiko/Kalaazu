package package_387 {

import away3d.arcane;

import package_198.class_1208;

import package_310.class_1780;
import package_310.class_2252;

import package_369.class_2116;

import package_385.class_2237;
import package_385.class_2251;

public class class_2247 extends class_1780 {

    public static const const_2845: Number = 0.5;


    private var _texture: class_2116;

    public function class_2247() {
        super();
    }

    public function get texture(): class_2116 {
        return this._texture;
    }

    public function set texture(param1: class_2116): void {
        if (Boolean(param1) != Boolean(this._texture) || param1 && this._texture && (param1.method_5818 != this._texture.method_5818 || param1.format != this._texture.format)) {
            method_220();
        }
        this._texture = param1;
    }

    override arcane function initVO(param1: class_2252): void {
        param1.var_3859 = this._texture != null;
        param1.var_4636 = true;
        param1.var_2526 = Boolean(this._texture) && Boolean(this._texture.method_5818);
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        if (this._texture) {
            param1.var_3329[param1.var_2676] = const_2845;
            param2.arcane::var_4582.setTextureAt(param1.var_2852, this._texture.method_6425(param2));
        }
    }

    override arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (this._texture) {
            _loc4_ = param2.method_3238();
            _loc5_ = param2.method_4834();
            param2.method_4539(_loc5_, 1);
            _loc6_ = param2.method_4834();
            param2.method_4539(_loc6_, 1);
            param1.var_2852 = _loc4_.index;
            _loc7_ = param2.method_1853();
            param1.var_2676 = Number(_loc7_.index) * 4;
            _loc8_ = getTex2DSampleCode(param1, _loc5_, _loc4_, this._texture, var_1283.var_443) + "mov " + _loc6_ + ", " + _loc5_ + "\n" + "sub " + _loc5_ + ".x, " + _loc5_ + ".x, " + _loc7_ + ".x\n" + "kill " + _loc5_ + ".x\n" + "mul " + param3 + ", " + param3 + ", " + _loc6_ + ".x\n";
            param2.method_771(_loc5_);
            param2.method_771(_loc6_);
            return _loc8_;
        }
        return "";
    }
}
}
