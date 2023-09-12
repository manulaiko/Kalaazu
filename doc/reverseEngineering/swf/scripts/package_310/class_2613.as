package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_369.class_2116;

import package_385.class_2237;
import package_385.class_2251;

public class class_2613 extends class_2612 {

    public static const MULTIPLY: String = "multiply";

    public static const ADD: String = "add";


    private var _texture: class_2116;

    private var _blendMode: String;

    private var var_1769: Boolean;

    public function class_2613(param1: class_2116, param2: String = "multiply", param3: Boolean = false, param4: class_2246 = null) {
        super(null, param4);
        this.var_1769 = param3;
        this._texture = param1;
        this.blendMode = param2;
    }

    override arcane function initVO(param1: class_2252): void {
        param1.var_1737 = this.var_1769;
        param1.var_3859 = !this.var_1769;
    }

    public function get blendMode(): String {
        return this._blendMode;
    }

    public function set blendMode(param1: String): void {
        if (param1 != ADD && param1 != MULTIPLY) {
            throw new Error("Unknown blendmode!");
        }
        if (this._blendMode == param1) {
            return;
        }
        this._blendMode = param1;
        method_220();
    }

    public function get method_2532(): class_2116 {
        return this._texture;
    }

    public function set method_2532(param1: class_2116): void {
        this._texture = param1;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        param2.arcane::var_4582.setTextureAt(param1.var_4217, this._texture.method_6425(param2));
        super.arcane::activate(param1, param2);
    }

    override arcane function method_5951(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc4_: * = null;
        var _loc5_: class_2251 = param2.method_3238();
        var _loc6_: class_2251 = param2.method_4834();
        param1.var_4217 = _loc5_.index;
        _loc4_ = getTex2DSampleCode(param1, _loc6_, _loc5_, this._texture, var_1283.var_1121);
        switch (this._blendMode) {
            case MULTIPLY:
                _loc4_ += "mul " + var_800 + ", " + var_800 + ", " + _loc6_ + "\n";
                break;
            case ADD:
                _loc4_ += "add " + var_800 + ", " + var_800 + ", " + _loc6_ + "\n";
        }
        return _loc4_ + super.arcane::method_5951(param1, param2, param3);
    }
}
}
