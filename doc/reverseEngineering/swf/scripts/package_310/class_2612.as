package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_199.class_2253;

import package_369.class_2116;

import package_385.class_2237;
import package_385.class_2250;
import package_385.class_2251;

public class class_2612 extends class_2246 {


    protected var var_1463: class_2246;

    public function class_2612(param1: Function = null, param2: class_2246 = null) {
        super();
        this.var_1463 = param2 || new class_2246();
        this.var_1463.arcane::var_366 = param1;
        this.var_1463.addEventListener(class_2253.const_3136, this.method_404);
    }

    public function get method_5573(): class_2246 {
        return this.var_1463;
    }

    public function set method_5573(param1: class_2246): void {
        if (this.var_1463 == param1) {
            return;
        }
        this.var_1463.removeEventListener(class_2253.const_3136, this.method_404);
        this.var_1463 = param1;
        this.var_1463.addEventListener(class_2253.const_3136, this.method_404, false, 0, true);
        method_220();
    }

    override arcane function initVO(param1: class_2252): void {
        this.var_1463.arcane::initVO(param1);
    }

    override arcane function method_4956(param1: class_2252): void {
        this.var_1463.arcane::method_4956(param1);
    }

    override public function dispose(): void {
        this.var_1463.removeEventListener(class_2253.const_3136, this.method_404);
        this.var_1463.dispose();
    }

    override public function get alphaThreshold(): Number {
        return this.var_1463.alphaThreshold;
    }

    override public function set alphaThreshold(param1: Number): void {
        this.var_1463.alphaThreshold = param1;
    }

    override public function get texture(): class_2116 {
        return this.var_1463.texture;
    }

    override public function set texture(param1: class_2116): void {
        this.var_1463.texture = param1;
    }

    override public function get method_111(): Number {
        return this.var_1463.method_111;
    }

    override public function get method_5048(): uint {
        return this.var_1463.method_5048;
    }

    override public function set method_5048(param1: uint): void {
        this.var_1463.method_5048 = param1;
    }

    override public function set method_111(param1: Number): void {
        this.var_1463.method_111 = param1;
    }

    override arcane function method_1029(param1: class_2252, param2: class_2237): String {
        return this.var_1463.arcane::method_1029(param1, param2);
    }

    override arcane function method_4161(param1: class_2252, param2: class_2251, param3: class_2251, param4: class_2237): String {
        var _loc5_: String = this.var_1463.arcane::method_4161(param1, param2, param3, param4);
        var_800 = this.var_1463.var_800;
        return _loc5_;
    }

    override arcane function method_1573(param1: class_2252, param2: class_2251, param3: String, param4: class_2237): String {
        var _loc5_: String = this.var_1463.arcane::method_1573(param1, param2, param3, param4);
        var_800 = this.var_1463.var_800;
        return _loc5_;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        this.var_1463.arcane::activate(param1, param2);
    }

    override arcane function deactivate(param1: class_2252, param2: class_1208): void {
        this.var_1463.arcane::deactivate(param1, param2);
    }

    override arcane function getVertexCode(param1: class_2252, param2: class_2237): String {
        return this.var_1463.arcane::getVertexCode(param1, param2);
    }

    override arcane function method_5951(param1: class_2252, param2: class_2237, param3: class_2251): String {
        return this.var_1463.arcane::method_5951(param1, param2, param3);
    }

    override arcane function reset(): void {
        this.var_1463.arcane::reset();
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_1463.arcane::method_3031();
    }

    override arcane function set sharedRegisters(param1: class_2250): void {
        super.arcane::sharedRegisters = this.var_1463.arcane::sharedRegisters = param1;
    }

    override arcane function set shadowRegister(param1: class_2251): void {
        super.arcane::shadowRegister = param1;
        this.var_1463.arcane::shadowRegister = param1;
    }

    private function method_404(param1: class_2253): void {
        method_220();
    }
}
}
