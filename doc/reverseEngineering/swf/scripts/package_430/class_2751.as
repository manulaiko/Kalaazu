package package_430 {

import away3d.animators.class_2403;
import away3d.arcane;

import flash.display3D.Context3DVertexBufferFormat;
import flash.geom.ColorTransform;
import flash.geom.Vector3D;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_386.class_2238;
import package_386.class_2575;
import package_386.class_2578;

import package_431.class_2729;

public class class_2751 extends class_2401 {


    private var var_1628: class_2729;

    private var var_291: Boolean;

    private var var_456: Boolean;

    private var var_219: Boolean;

    private var var_81: Boolean;

    private var var_2288: ColorTransform;

    private var var_148: ColorTransform;

    private var var_872: Number;

    private var var_544: Number;

    private var var_3347: Vector3D;

    private var var_576: Vector3D;

    private var var_4398: Vector3D;

    private var var_3119: Vector3D;

    private var var_1681: Vector3D;

    public function class_2751(param1: class_2403, param2: class_2729) {
        super(param1, param2);
        this.var_1628 = param2;
        this.var_291 = this.var_1628.arcane::var_291;
        this.var_456 = this.var_1628.arcane::var_456;
        this.var_219 = this.var_1628.arcane::var_219;
        this.var_81 = this.var_1628.arcane::var_81;
        this.var_2288 = this.var_1628.arcane::var_2288;
        this.var_148 = this.var_1628.arcane::var_148;
        this.var_872 = this.var_1628.arcane::var_872;
        this.var_544 = this.var_1628.arcane::var_544;
        this.method_985();
    }

    public function get startColor(): ColorTransform {
        return this.var_2288;
    }

    public function set startColor(param1: ColorTransform): void {
        this.var_2288 = param1;
        this.method_985();
    }

    public function get endColor(): ColorTransform {
        return this.var_148;
    }

    public function set endColor(param1: ColorTransform): void {
        this.var_148 = param1;
        this.method_985();
    }

    public function get cycleDuration(): Number {
        return this.var_872;
    }

    public function set cycleDuration(param1: Number): void {
        this.var_872 = param1;
        this.method_985();
    }

    public function get cyclePhase(): Number {
        return this.var_544;
    }

    public function set cyclePhase(param1: Number): void {
        this.var_544 = param1;
        this.method_985();
    }

    override public function setRenderState(param1: class_1208, param2: class_2133, param3: class_2575, param4: class_2238, param5: class_1767): void {
        var _loc6_: * = 0;
        param2 = param2;
        param5 = param5;
        if (param4.name_132) {
            _loc6_ = uint(this.var_1628.arcane::var_4676);
            if (this.var_219) {
                param4.method_5167(param4.method_2879(var_3560, class_2729.arcane::const_119), this.var_3347.x, this.var_3347.y, this.var_3347.z, this.var_3347.w);
            }
            if (this.var_291) {
                if (this.var_1628.mode == class_2578.name_24) {
                    param3.method_748(param4.method_2879(var_3560, class_2729.arcane::const_1461), _loc6_, param1, Context3DVertexBufferFormat.FLOAT_4);
                    _loc6_ += 4;
                    param3.method_748(param4.method_2879(var_3560, class_2729.arcane::const_332), _loc6_, param1, Context3DVertexBufferFormat.FLOAT_4);
                    _loc6_ += 4;
                } else {
                    param4.method_5167(param4.method_2879(var_3560, class_2729.arcane::const_1461), this.var_576.x, this.var_576.y, this.var_576.z, this.var_576.w);
                    param4.method_5167(param4.method_2879(var_3560, class_2729.arcane::const_332), this.var_4398.x, this.var_4398.y, this.var_4398.z, this.var_4398.w);
                }
            }
            if (this.var_456) {
                if (this.var_1628.mode == class_2578.name_24) {
                    param3.method_748(param4.method_2879(var_3560, class_2729.arcane::const_1300), _loc6_, param1, Context3DVertexBufferFormat.FLOAT_4);
                    _loc6_ += 4;
                    param3.method_748(param4.method_2879(var_3560, class_2729.arcane::const_2716), _loc6_, param1, Context3DVertexBufferFormat.FLOAT_4);
                    _loc6_ += 4;
                } else {
                    param4.method_5167(param4.method_2879(var_3560, class_2729.arcane::const_1300), this.var_3119.x, this.var_3119.y, this.var_3119.z, this.var_3119.w);
                    param4.method_5167(param4.method_2879(var_3560, class_2729.arcane::const_2716), this.var_1681.x, this.var_1681.y, this.var_1681.z, this.var_1681.w);
                }
            }
        }
    }

    private function method_985(): void {
        if (this.var_219) {
            if (this.var_872 <= 0) {
                throw new Error("the cycle duration must be greater than zero");
            }
            this.var_3347 = new Vector3D(0 / Number(this.var_872), Number(this.var_544) * 0 / 180, 0, 0);
        }
        if (this.var_1628.mode == class_2578.name_100) {
            if (this.var_219) {
                if (this.var_291) {
                    this.var_576 = new Vector3D((this.var_2288.redMultiplier + this.var_148.redMultiplier) / 2, (this.var_2288.greenMultiplier + this.var_148.greenMultiplier) / 2, (this.var_2288.blueMultiplier + this.var_148.blueMultiplier) / 2, (this.var_2288.alphaMultiplier + this.var_148.alphaMultiplier) / 2);
                    this.var_4398 = new Vector3D((Number(this.var_148.redMultiplier) - Number(this.var_2288.redMultiplier)) / 2, (Number(this.var_148.greenMultiplier) - Number(this.var_2288.greenMultiplier)) / 2, (Number(this.var_148.blueMultiplier) - Number(this.var_2288.blueMultiplier)) / 2, (Number(this.var_148.alphaMultiplier) - Number(this.var_2288.alphaMultiplier)) / 2);
                }
                if (this.var_456) {
                    this.var_3119 = new Vector3D((this.var_2288.redOffset + this.var_148.redOffset) / 510, (this.var_2288.greenOffset + this.var_148.greenOffset) / 510, (this.var_2288.blueOffset + this.var_148.blueOffset) / 510, (this.var_2288.alphaOffset + this.var_148.alphaOffset) / 510);
                    this.var_1681 = new Vector3D((Number(this.var_148.redOffset) - Number(this.var_2288.redOffset)) / 510, (Number(this.var_148.greenOffset) - Number(this.var_2288.greenOffset)) / 510, (Number(this.var_148.blueOffset) - Number(this.var_2288.blueOffset)) / 510, (Number(this.var_148.alphaOffset) - Number(this.var_2288.alphaOffset)) / 510);
                }
            } else {
                if (this.var_291) {
                    this.var_576 = new Vector3D(this.var_2288.redMultiplier, this.var_2288.greenMultiplier, this.var_2288.blueMultiplier, this.var_2288.alphaMultiplier);
                    this.var_4398 = new Vector3D(Number(this.var_148.redMultiplier) - Number(this.var_2288.redMultiplier), Number(this.var_148.greenMultiplier) - Number(this.var_2288.greenMultiplier), Number(this.var_148.blueMultiplier) - Number(this.var_2288.blueMultiplier), Number(this.var_148.alphaMultiplier) - Number(this.var_2288.alphaMultiplier));
                }
                if (this.var_456) {
                    this.var_3119 = new Vector3D(Number(this.var_2288.redOffset) / 255, Number(this.var_2288.greenOffset) / 255, Number(this.var_2288.blueOffset) / 255, Number(this.var_2288.alphaOffset) / 255);
                    this.var_1681 = new Vector3D((Number(this.var_148.redOffset) - Number(this.var_2288.redOffset)) / 255, (Number(this.var_148.greenOffset) - Number(this.var_2288.greenOffset)) / 255, (Number(this.var_148.blueOffset) - Number(this.var_2288.blueOffset)) / 255, (Number(this.var_148.alphaOffset) - Number(this.var_2288.alphaOffset)) / 255);
                }
            }
        }
    }
}
}
