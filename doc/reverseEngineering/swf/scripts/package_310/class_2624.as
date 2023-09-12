package package_310 {

import away3d.*;

import flash.events.*;

import package_198.*;

import package_199.*;

import package_294.*;

import package_305.*;

import package_364.*;

import package_385.*;

import package_429.*;

public class class_2624 extends class_2245 {


    private var var_1463: class_2608;

    private var var_1789: CascadeShadowMapper;

    private var var_4645: Vector.<class_2251>;

    private var var_40: Vector.<class_2251>;

    public function class_2624(param1: class_2608) {
        super(param1.method_5833);
        this.var_1463 = param1;
        if (!(var_1527 is DirectionalLight)) {
            throw new Error("CascadeShadowMapMethod is only compatible with DirectionalLight");
        }
        this.var_1789 = var_1527.method_493 as CascadeShadowMapper;
        if (!this.var_1789) {
            throw new Error("CascadeShadowMapMethod requires a light that has a CascadeShadowMapper instance assigned to shadowMapper.");
        }
        this.var_1789.addEventListener(Event.CHANGE, this.method_2487, false, 0, true);
        this.var_1463.addEventListener(class_2253.const_3136, this.method_404, false, 0, true);
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

    override arcane function initVO(param1: class_2252): void {
        var _loc2_: class_2252 = new class_2252();
        this.var_1463.arcane::initVO(_loc2_);
        param1.var_4475 = true;
        param1.var_1986 = true;
    }

    override arcane function set sharedRegisters(param1: class_2250): void {
        super.arcane::sharedRegisters = param1;
        this.var_1463.arcane::sharedRegisters = param1;
    }

    override arcane function method_4956(param1: class_2252): void {
        var _loc2_: Vector.<Number> = param1.var_3329;
        var _loc3_: Vector.<Number> = param1.name_104;
        var _loc4_: int = int(param1.var_2676);
        _loc2_[_loc4_] = 1;
        _loc2_[_loc4_ + 1] = 0.00392156862745098;
        _loc2_[_loc4_ + 2] = 0.000015378700499807768;
        _loc2_[_loc4_ + 3] = 6.030862941101084e-8;
        _loc2_[_loc4_ + 6] = 0.5;
        _loc2_[_loc4_ + 7] = -0.5;
        _loc4_ = int(param1.var_2112);
        _loc3_[_loc4_] = 0.5;
        _loc3_[_loc4_ + 1] = -0.5;
        _loc3_[_loc4_ + 2] = 0;
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_40 = null;
        this.var_4645 = null;
    }

    override arcane function getVertexCode(param1: class_2252, param2: class_2237): String {
        var _loc3_: String = "";
        var _loc4_: class_2251 = param2.method_5384();
        this.method_230(param2);
        param1.var_2112 = Number(_loc4_.index) * 4;
        var _loc5_: class_2251 = param2.method_3118();
        var _loc6_: int = 0;
        while (_loc6_ < this.var_1789.method_191) {
            _loc3_ += "m44 " + _loc5_ + ", " + var_1283.var_1070 + ", " + this.var_40[_loc6_] + "\n" + "add " + this.var_4645[_loc6_] + ", " + _loc5_ + ", " + _loc4_ + ".zzwz\n";
            _loc6_++;
        }
        return _loc3_;
    }

    private function method_230(param1: class_2237): void {
        this.var_40 = new Vector.<class_2251>(this.var_1789.method_191);
        this.var_4645 = new Vector.<class_2251>(this.var_1789.method_191);
        var _loc2_: int = 0;
        while (_loc2_ < this.var_1789.method_191) {
            this.var_4645[_loc2_] = param1.method_5601();
            this.var_40[_loc2_] = param1.method_5384();
            param1.method_5384();
            param1.method_5384();
            param1.method_5384();
            _loc2_++;
        }
    }

    override arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc10_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc4_: int = int(this.var_1789.method_191);
        var _loc5_: class_2251 = param2.method_3238();
        var _loc6_: class_2251 = param2.method_1853();
        var _loc7_: class_2251 = param2.method_1853();
        var _loc8_: class_2251 = param2.method_1853();
        var _loc9_: Vector.<String> = new <String>[_loc8_ + ".x", _loc8_ + ".y", _loc8_ + ".z", _loc8_ + ".w"];
        param1.var_2676 = Number(_loc6_.index) * 4;
        param1.var_2852 = _loc5_.index;
        var _loc11_: class_2251 = param2.method_4834();
        param2.method_4539(_loc11_, 1);
        var _loc12_: class_2251 = param2.method_4834();
        param2.method_4539(_loc12_, 1);
        _loc10_ = "mov " + _loc12_ + ", " + this.var_4645[_loc4_ - 1] + "\n";
        var _loc13_: int = _loc4_ - 2;
        while (_loc13_ >= 0) {
            _loc14_ = this.var_4645[_loc13_];
            _loc10_ += "slt " + _loc11_ + ".z, " + var_1283.var_1930 + ".z, " + _loc9_[_loc13_] + "\n";
            _loc15_ = param2.method_4834();
            _loc10_ += "sub " + _loc15_ + ", " + _loc14_ + ", " + _loc12_ + "\n" + "mul " + _loc15_ + ", " + _loc15_ + ", " + _loc11_ + ".z\n" + "add " + _loc12_ + ", " + _loc12_ + ", " + _loc15_ + "\n";
            _loc13_--;
        }
        param2.method_771(_loc11_);
        _loc10_ = (_loc10_ += "div " + _loc12_ + ", " + _loc12_ + ", " + _loc12_ + ".w\n" + "mul " + _loc12_ + ".xy, " + _loc12_ + ".xy, " + _loc7_ + ".zw\n" + "add " + _loc12_ + ".xy, " + _loc12_ + ".xy, " + _loc7_ + ".zz\n") + (this.var_1463.arcane::method_6039(param1, param2, _loc6_, _loc5_, _loc12_, param3) + "add " + param3 + ".w, " + param3 + ".w, " + _loc7_ + ".y\n");
        param2.method_771(_loc12_);
        return _loc10_;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        param2.arcane::var_4582.setTextureAt(param1.var_2852, var_1527.method_493.method_3585.method_6425(param2));
        var _loc3_: Vector.<Number> = param1.name_104;
        var _loc4_: int = int(param1.var_2112);
        param1.name_104[param1.var_2112 + 3] = -1 / (Number(this.var_1789.arcane::depth) * Number(var_5040));
        var _loc5_: int = int(this.var_1789.method_191);
        _loc4_ += 4;
        var _loc6_: int = 0;
        while (_loc6_ < _loc5_) {
            this.var_1789.method_1836(_loc6_).copyRawDataTo(_loc3_, _loc4_, true);
            _loc4_ += 16;
            _loc6_++;
        }
        var _loc7_: Vector.<Number> = param1.var_3329;
        var _loc8_: int = int(param1.var_2676);
        _loc7_[uint(_loc8_ + 5)] = 1 - Number(_alpha);
        var _loc9_: Vector.<Number> = this.var_1789.arcane::method_1145;
        _loc8_ += 8;
        var _loc10_: Number = 0;
        while (_loc10_ < _loc5_) {
            _loc7_[uint(_loc8_ + _loc10_)] = _loc9_[_loc10_];
            _loc10_++;
        }
        this.var_1463.arcane::method_766(param1, param2);
    }

    override arcane function setRenderState(param1: class_2252, param2: class_2133, param3: class_1208, param4: class_1767): void {
    }

    private function method_2487(param1: Event): void {
        method_220();
    }

    private function method_404(param1: class_2253): void {
        method_220();
    }
}
}
