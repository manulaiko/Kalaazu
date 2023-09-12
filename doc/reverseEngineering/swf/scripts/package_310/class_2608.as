package package_310 {

import away3d.arcane;

import flash.geom.Vector3D;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_364.PointLight;
import package_364.class_2102;

import package_374.AbstractMethodError;

import package_385.class_2237;
import package_385.class_2251;

import package_429.DirectionalShadowMapper;

public class class_2608 extends class_2245 {


    protected var var_1513: class_2251;

    protected var var_4841: Boolean;

    public function class_2608(param1: class_2102) {
        this.var_4841 = param1 is PointLight;
        super(param1);
    }

    override arcane function initVO(param1: class_2252): void {
        param1.var_3475 = true;
        param1.var_4475 = true;
        param1.var_4342 = this.var_4841;
        param1.var_10 = param1.name_108 > 0;
    }

    override arcane function method_4956(param1: class_2252): void {
        var _loc2_: Vector.<Number> = param1.var_3329;
        var _loc3_: Vector.<Number> = param1.name_104;
        var _loc4_: int = int(param1.var_2676);
        _loc2_[_loc4_] = 1;
        _loc2_[_loc4_ + 1] = 0.00392156862745098;
        _loc2_[_loc4_ + 2] = 0.000015378700499807768;
        _loc2_[_loc4_ + 3] = 6.030862941101084e-8;
        _loc2_[_loc4_ + 6] = 0;
        _loc2_[_loc4_ + 7] = 1;
        if (this.var_4841) {
            _loc2_[_loc4_ + 8] = 0;
            _loc2_[_loc4_ + 9] = 0;
            _loc2_[_loc4_ + 10] = 0;
            _loc2_[_loc4_ + 11] = 1;
        }
        if ((_loc4_ = int(param1.var_2112)) != -1) {
            _loc3_[_loc4_] = 0.5;
            _loc3_[_loc4_ + 1] = -0.5;
            _loc3_[_loc4_ + 2] = 0;
            _loc3_[_loc4_ + 3] = 1;
        }
    }

    arcane function get method_302(): class_2251 {
        return this.var_1513;
    }

    arcane function set method_302(param1: class_2251): void {
        this.var_1513 = param1;
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_1513 = null;
    }

    override arcane function getVertexCode(param1: class_2252, param2: class_2237): String {
        return !!this.var_4841 ? this.method_2671(param1, param2) : this.method_4340(param1, param2);
    }

    protected function method_2671(param1: class_2252, param2: class_2237): String {
        param1.var_2112 = -1;
        return "";
    }

    protected function method_4340(param1: class_2252, param2: class_2237): String {
        var _loc3_: String = "";
        var _loc4_: class_2251 = param2.method_3118();
        var _loc5_: class_2251 = param2.method_5384();
        var _loc6_: class_2251 = param2.method_5384();
        param2.method_5384();
        param2.method_5384();
        param2.method_5384();
        this.var_1513 = param2.method_5601();
        param1.var_2112 = Number(_loc5_.index) * 4;
        return _loc3_ + ("m44 " + _loc4_ + ", " + var_1283.var_1070 + ", " + _loc6_ + "\n" + "div " + _loc4_ + ", " + _loc4_ + ", " + _loc4_ + ".w\n" + "mul " + _loc4_ + ".xy, " + _loc4_ + ".xy, " + _loc5_ + ".xy\n" + "add " + this.var_1513 + ", " + _loc4_ + ", " + _loc5_ + ".xxwz\n");
    }

    override arcane function getFragmentCode(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc4_: String;
        return (_loc4_ = !!this.var_4841 ? this.method_3119(param1, param2, param3) : this.method_157(param1, param2, param3)) + ("add " + param3 + ".w, " + param3 + ".w, fc" + (Number(param1.var_2676) / 4 + 1) + ".y\n" + "sat " + param3 + ".w, " + param3 + ".w\n");
    }

    protected function method_157(param1: class_2252, param2: class_2237, param3: class_2251): String {
        throw new AbstractMethodError();
    }

    protected function method_3119(param1: class_2252, param2: class_2237, param3: class_2251): String {
        throw new AbstractMethodError();
    }

    override arcane function setRenderState(param1: class_2252, param2: class_2133, param3: class_1208, param4: class_1767): void {
        if (!this.var_4841) {
            DirectionalShadowMapper(var_2517).arcane::depthProjection.copyRawDataTo(param1.name_104, param1.var_2112 + 4, true);
        }
    }

    arcane function method_6039(param1: class_2252, param2: class_2237, param3: class_2251, param4: class_2251, param5: class_2251, param6: class_2251): String {
        throw new Error("This shadow method is incompatible with cascade shadows");
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        var _loc3_: Vector.<Number> = param1.var_3329;
        var _loc4_: int = int(param1.var_2676);
        if (this.var_4841) {
            _loc3_[_loc4_ + 4] = -Math.pow(1 / (Number((var_1527 as PointLight).fallOff) * Number(var_5040)), 2);
        } else {
            param1.name_104[param1.var_2112 + 3] = -1 / (Number(DirectionalShadowMapper(var_2517).arcane::depth) * Number(var_5040));
        }
        _loc3_[_loc4_ + 5] = 1 - Number(_alpha);
        if (this.var_4841) {
            _loc5_ = var_1527.method_3037;
            _loc3_[_loc4_ + 8] = _loc5_.x;
            _loc3_[_loc4_ + 9] = _loc5_.y;
            _loc3_[_loc4_ + 10] = _loc5_.z;
            _loc6_ = Number(PointLight(var_1527).arcane::_fallOff);
            _loc3_[_loc4_ + 11] = 1 / (2 * _loc6_ * _loc6_);
        }
        param2.arcane::var_4582.setTextureAt(param1.var_2852, var_1527.method_493.method_3585.method_6425(param2));
    }

    arcane function method_766(param1: class_2252, param2: class_1208): void {
        throw new Error("This shadow method is incompatible with cascade shadows");
    }
}
}
