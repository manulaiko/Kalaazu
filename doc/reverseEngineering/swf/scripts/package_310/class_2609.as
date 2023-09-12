package package_310 {

import away3d.arcane;

import package_198.class_1208;

import package_199.class_2253;

import package_294.class_2133;

import package_305.class_1767;

import package_385.class_2237;
import package_385.class_2250;
import package_385.class_2251;

import package_429.NearDirectionalShadowMapper;

public class class_2609 extends class_2608 {


    private var var_1463: class_2608;

    private var var_1308: Number;

    private var var_1682: NearDirectionalShadowMapper;

    public function class_2609(param1: class_2608, param2: Number = 0.1) {
        super(param1.method_5833);
        this.var_1463 = param1;
        this.var_1308 = param2;
        this.var_1682 = var_1527.method_493 as NearDirectionalShadowMapper;
        if (!this.var_1682) {
            throw new Error("NearShadowMapMethod requires a light that has a NearDirectionalShadowMapper instance assigned to shadowMapper.");
        }
        this.var_1463.addEventListener(class_2253.const_3136, this.method_404);
    }

    public function get method_5573(): class_2608 {
        return this.var_1463;
    }

    public function set method_5573(param1: class_2608): void {
        if (this.var_1463 == param1) {
            return;
        }
        this.var_1463.removeEventListener(class_2253.const_3136, this.method_404);
        this.var_1463 = param1;
        this.var_1463.addEventListener(class_2253.const_3136, this.method_404, false, 0, true);
        method_220();
    }

    override arcane function method_4956(param1: class_2252): void {
        super.arcane::method_4956(param1);
        this.var_1463.arcane::method_4956(param1);
        var _loc2_: Vector.<Number> = param1.var_3329;
        var _loc3_: int = int(param1.var_4227);
        _loc2_[_loc3_ + 2] = 0;
        _loc2_[_loc3_ + 3] = 1;
    }

    override arcane function initVO(param1: class_2252): void {
        this.var_1463.arcane::initVO(param1);
        param1.var_1986 = true;
    }

    override public function dispose(): void {
        this.var_1463.removeEventListener(class_2253.const_3136, this.method_404);
    }

    override public function get alpha(): Number {
        return this.var_1463.alpha;
    }

    override public function set alpha(param1: Number): void {
        this.var_1463.alpha = param1;
    }

    override public function get epsilon(): Number {
        return this.var_1463.epsilon;
    }

    override public function set epsilon(param1: Number): void {
        this.var_1463.epsilon = param1;
    }

    public function get method_3201(): Number {
        return this.var_1308;
    }

    public function set method_3201(param1: Number): void {
        this.var_1308 = param1;
    }

    override arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc4_: String = this.var_1463.arcane::getFragmentCode(param1, param2, param3);
        var _loc5_: class_2251 = param2.method_1853();
        var _loc6_: class_2251 = param2.method_4883();
        param1.var_4227 = Number(_loc5_.index) * 4;
        return _loc4_ + ("abs " + _loc6_ + ", " + var_1283.var_1930 + ".w\n" + "sub " + _loc6_ + ", " + _loc6_ + ", " + _loc5_ + ".x\n" + "mul " + _loc6_ + ", " + _loc6_ + ", " + _loc5_ + ".y\n" + "sat " + _loc6_ + ", " + _loc6_ + "\n" + "sub " + _loc6_ + ", " + _loc5_ + ".w," + _loc6_ + "\n" + "sub " + param3 + ".w, " + _loc5_ + ".w," + param3 + ".w\n" + "mul " + param3 + ".w, " + param3 + ".w, " + _loc6_ + "\n" + "sub " + param3 + ".w, " + _loc5_ + ".w," + param3 + ".w\n");
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        this.var_1463.arcane::activate(param1, param2);
    }

    override arcane function deactivate(param1: class_2252, param2: class_1208): void {
        this.var_1463.arcane::deactivate(param1, param2);
    }

    override arcane function setRenderState(param1: class_2252, param2: class_2133, param3: class_1208, param4: class_1767): void {
        var _loc5_: Number = Number(param4.lens.method_5049);
        var _loc6_: Number = Number(param4.lens.method_1840) - _loc5_;
        var _loc7_: Number;
        var _loc8_: Number = (_loc7_ = Number(this.var_1682.method_1334)) * (1 - Number(this.var_1308));
        _loc7_ = _loc5_ + _loc7_ * _loc6_;
        _loc8_ = _loc5_ + _loc8_ * _loc6_;
        var _loc9_: Vector.<Number> = param1.var_3329;
        var _loc10_: int = int(param1.var_4227);
        _loc9_[_loc10_] = _loc8_;
        _loc9_[_loc10_ + 1] = 1 / (_loc7_ - _loc8_);
        this.var_1463.arcane::setRenderState(param1, param2, param3, param4);
    }

    override arcane function getVertexCode(param1: class_2252, param2: class_2237): String {
        return this.var_1463.arcane::getVertexCode(param1, param2);
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

    private function method_404(param1: class_2253): void {
        method_220();
    }
}
}
