package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_369.class_2116;

import package_385.class_2237;
import package_385.class_2251;

public class class_2242 extends class_1779 {


    private var _texture: class_2116;

    private var _useTexture: Boolean;

    protected var var_4416: class_2251;

    public function class_2242() {
        super();
    }

    override arcane function initVO(param1: class_2252): void {
        param1.var_3859 = Boolean(this._texture);
    }

    arcane function get tangentSpace(): Boolean {
        return true;
    }

    arcane function get method_5395(): Boolean {
        return this._useTexture;
    }

    override public function copyFrom(param1: class_1779): void {
        this.normalMap = class_2242(param1).normalMap;
    }

    public function get normalMap(): class_2116 {
        return this._texture;
    }

    public function set normalMap(param1: class_2116): void {
        if (Boolean(param1) != this._useTexture || param1 && this._texture && (param1.method_5818 != this._texture.method_5818 || param1.format != this._texture.format)) {
            method_220();
        }
        this._useTexture = Boolean(param1);
        this._texture = param1;
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_4416 = null;
    }

    override public function dispose(): void {
        if (this._texture) {
            this._texture = null;
        }
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        if (param1.var_2852 >= 0) {
            param2.arcane::var_4582.setTextureAt(param1.var_2852, this._texture.method_6425(param2));
        }
    }

    arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        this.var_4416 = param2.method_3238();
        param1.var_2852 = this.var_4416.index;
        return getTex2DSampleCode(param1, param3, this.var_4416, this._texture) + "sub " + param3 + ".xyz, " + param3 + ".xyz, " + var_1283.var_1569 + ".xxx\t\n" + "nrm " + param3 + ".xyz, " + param3 + ".xyz\t\t\t\t\t\t\t\n";
    }
}
}
