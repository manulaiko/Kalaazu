package package_310 {

import away3d.arcane;

import flash.display3D.textures.Texture;
import flash.geom.Matrix3D;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_309.class_1774;
import package_309.class_2699;

import package_385.class_2237;
import package_385.class_2250;
import package_385.class_2251;

public class class_2623 extends class_2612 {


    private var var_2616: class_2699;

    private var var_1112: class_2251;

    private var var_2725: class_2251;

    private var var_2699: Number;

    private var var_108: Number = 1;

    private var var_1808: class_2251;

    private var var_3017: uint = 16777215;

    private var var_2652: class_2251;

    private var var_4290: class_2251;

    private var var_2511: Number = 1;

    private var var_1456: Number = 1;

    private var var_2880: Number = 1;

    private var var_2566: class_2251;

    public function class_2623(param1: int = 512, param2: Number = 15) {
        super(this.method_4887);
        var_746 = new Vector.<class_1774>();
        this.var_2616 = new class_2699(param1, param2);
        var_746.push(this.var_2616);
        this.var_2699 = 0.2;
        this.var_108 = 1;
    }

    override arcane function method_4956(param1: class_2252): void {
        super.arcane::method_4956(param1);
        var _loc2_: Vector.<Number> = param1.name_104;
        var _loc3_: int = int(param1.var_3320);
        _loc2_[_loc3_] = 0.5;
        _loc2_[_loc3_ + 1] = -0.5;
        _loc2_[_loc3_ + 2] = 0;
        _loc2_[_loc3_ + 3] = 1;
        _loc2_ = param1.var_3329;
        _loc3_ = int(param1.var_4227);
        _loc2_[_loc3_ + 3] = 1;
        _loc2_[_loc3_ + 4] = 1;
        _loc2_[_loc3_ + 5] = 0.00392156862745098;
        _loc2_[_loc3_ + 6] = 0.000015378700499807768;
        _loc2_[_loc3_ + 7] = 6.030862941101084e-8;
        _loc2_[_loc3_ + 10] = 0.5;
        _loc2_[_loc3_ + 11] = -0.1;
    }

    override arcane function method_3031(): void {
        super.arcane::method_3031();
        this.var_1112 = null;
        this.var_2725 = null;
        this.var_1808 = null;
        this.var_2652 = null;
        this.var_4290 = null;
        this.var_2566 = null;
    }

    public function get scattering(): Number {
        return this.var_2699;
    }

    public function set scattering(param1: Number): void {
        this.var_2699 = param1;
    }

    public function get translucency(): Number {
        return this.var_108;
    }

    public function set translucency(param1: Number): void {
        this.var_108 = param1;
    }

    public function get scatterColor(): uint {
        return this.var_3017;
    }

    public function set scatterColor(param1: uint): void {
        this.var_3017 = param1;
        this.var_2511 = (param1 >> 16 & 255) / 255;
        this.var_1456 = (param1 >> 8 & 255) / 255;
        this.var_2880 = (param1 & 255) / 255;
    }

    override arcane function getVertexCode(param1: class_2252, param2: class_2237): String {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc3_: String = super.arcane::getVertexCode(param1, param2);
        var _loc6_: class_2251 = param2.method_3118();
        _loc5_ = param2.method_5384();
        param1.var_3320 = Number(_loc5_.index) * 4;
        this.var_1112 = param2.method_5601();
        _loc4_ = param2.method_5384();
        param2.method_5384();
        param2.method_5384();
        param2.method_5384();
        return _loc3_ + ("m44 " + _loc6_ + ", vt0, " + _loc4_ + "\n" + "div " + _loc6_ + ".xyz, " + _loc6_ + ".xyz, " + _loc6_ + ".w\n" + "mul " + _loc6_ + ".xy, " + _loc6_ + ".xy, " + _loc5_ + ".xy\n" + "add " + _loc6_ + ".xy, " + _loc6_ + ".xy, " + _loc5_ + ".xx\n" + "mov " + this.var_1112 + ".xyz, " + _loc6_ + ".xyz\n" + "mov " + this.var_1112 + ".w, va0.w\n");
    }

    override arcane function method_1029(param1: class_2252, param2: class_2237): String {
        this.var_2652 = param2.method_1853();
        this.var_4290 = param2.method_1853();
        this.var_2725 = param2.method_1853();
        param1.var_4227 = Number(this.var_2652.index) * 4;
        return super.arcane::method_1029(param1, param2);
    }

    override arcane function method_4161(param1: class_2252, param2: class_2251, param3: class_2251, param4: class_2237): String {
        var_3130 = true;
        this.var_1808 = param3;
        return super.arcane::method_4161(param1, param2, param3, param4);
    }

    override arcane function method_5951(param1: class_2252, param2: class_2237, param3: class_2251): String {
        var _loc4_: String = super.arcane::method_5951(param1, param2, param3);
        var _loc5_: class_2251 = param2.method_4834();
        _loc4_ += "mul " + _loc5_ + ".xyz, " + this.var_1808 + ".xyz, " + this.var_2566 + ".w\n" + "mul " + _loc5_ + ".xyz, " + _loc5_ + ".xyz, " + this.var_2652 + ".xyz\n" + "add " + param3 + ".xyz, " + param3 + ".xyz, " + _loc5_ + ".xyz\n";
        if (this.var_2566 != var_1283.var_4238) {
            param2.method_771(param3);
        }
        return _loc4_;
    }

    override arcane function activate(param1: class_2252, param2: class_1208): void {
        super.arcane::activate(param1, param2);
        var _loc3_: int = int(param1.var_4227);
        var _loc4_: Vector.<Number>;
        (_loc4_ = param1.var_3329)[_loc3_] = this.var_2511;
        _loc4_[_loc3_ + 1] = this.var_1456;
        _loc4_[_loc3_ + 2] = this.var_2880;
        _loc4_[_loc3_ + 8] = this.var_2699;
        _loc4_[_loc3_ + 9] = this.var_108;
    }

    override arcane function setRenderState(param1: class_2252, param2: class_2133, param3: class_1208, param4: class_1767): void {
        var _loc5_: Texture = this.var_2616.arcane::method_5952(param2, param3);
        var _loc6_: Matrix3D = this.var_2616.arcane::method_2022(param2);
        param3.arcane::var_4582.setTextureAt(param1.var_4217, _loc5_);
        _loc6_.copyRawDataTo(param1.name_104, param1.var_3320 + 4, true);
    }

    private function method_4887(param1: class_2252, param2: class_2251, param3: class_2237, param4: class_2250): String {
        if (!var_3130) {
            return "";
        }
        var_3130 = false;
        var _loc5_: String = "";
        var _loc6_: class_2251 = param3.method_3238();
        if (param4.var_4238) {
            this.var_2566 = param4.var_4238;
        } else {
            this.var_2566 = param3.method_4834();
            param3.method_4539(this.var_2566, 1);
        }
        param1.var_4217 = _loc6_.index;
        var _loc7_: class_2251 = param3.method_4834();
        return (_loc5_ += "tex " + _loc7_ + ", " + this.var_1112 + ", " + _loc6_ + " <2d,nearest,clamp>\n" + "dp4 " + param2 + ".z, " + _loc7_ + ", " + this.var_4290 + "\n") + ("sub " + param2 + ".z, " + this.var_1112 + ".z, " + param2 + ".z\n" + "sub " + param2 + ".z, " + this.var_2725 + ".x, " + param2 + ".z\n" + "mul " + param2 + ".z, " + this.var_2725 + ".y, " + param2 + ".z\n" + "sat " + param2 + ".z, " + param2 + ".z\n" + "neg " + param2 + ".y, " + param2 + ".x\n" + "mul " + param2 + ".y, " + param2 + ".y, " + this.var_2725 + ".z\n" + "add " + param2 + ".y, " + param2 + ".y, " + this.var_2725 + ".z\n" + "mul " + this.var_2566 + ".w, " + param2 + ".z, " + param2 + ".y\n" + "sub " + param2 + ".y, " + this.var_2652 + ".w, " + this.var_2566 + ".w\n" + "mul " + param2 + ".w, " + param2 + ".w, " + param2 + ".y\n");
    }
}
}
