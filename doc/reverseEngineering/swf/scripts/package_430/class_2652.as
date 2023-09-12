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

import package_431.class_2651;

public class class_2652 extends class_2401 {


    private var var_1361: class_2651;

    private var var_291: Boolean;

    private var var_456: Boolean;

    private var var_1860: ColorTransform;

    private var var_2571: Vector3D;

    private var var_810: Vector3D;

    public function class_2652(param1: class_2403, param2: class_2651) {
        super(param1, param2);
        this.var_1361 = param2;
        this.var_291 = param2.arcane::var_291;
        this.var_456 = param2.arcane::var_456;
        this.var_1860 = param2.arcane::var_1860;
        this.method_985();
    }

    public function get method_5929(): ColorTransform {
        return this.var_1860;
    }

    public function set method_5929(param1: ColorTransform): void {
        this.var_1860 = param1;
        this.method_985();
    }

    override public function setRenderState(param1: class_1208, param2: class_2133, param3: class_2575, param4: class_2238, param5: class_1767): void {
        var _loc6_: * = 0;
        param2 = param2;
        param5 = param5;
        if (param4.name_132) {
            if (this.var_1361.mode == class_2578.name_24) {
                _loc6_ = uint(this.var_1361.arcane::var_4676);
                if (this.var_291) {
                    param3.method_748(param4.method_2879(var_3560, class_2651.arcane::const_160), _loc6_, param1, Context3DVertexBufferFormat.FLOAT_4);
                    _loc6_ += 4;
                }
                if (this.var_456) {
                    param3.method_748(param4.method_2879(var_3560, class_2651.arcane::const_862), _loc6_, param1, Context3DVertexBufferFormat.FLOAT_4);
                }
            } else {
                if (this.var_291) {
                    param4.method_5167(param4.method_2879(var_3560, class_2651.arcane::const_160), this.var_2571.x, this.var_2571.y, this.var_2571.z, this.var_2571.w);
                }
                if (this.var_456) {
                    param4.method_5167(param4.method_2879(var_3560, class_2651.arcane::const_862), this.var_810.x, this.var_810.y, this.var_810.z, this.var_810.w);
                }
            }
        }
    }

    private function method_985(): void {
        if (this.var_1361.mode == class_2578.name_100) {
            if (this.var_291) {
                this.var_2571 = new Vector3D(this.var_1860.redMultiplier, this.var_1860.greenMultiplier, this.var_1860.blueMultiplier, this.var_1860.alphaMultiplier);
            }
            if (this.var_456) {
                this.var_810 = new Vector3D(Number(this.var_1860.redOffset) / 255, Number(this.var_1860.greenOffset) / 255, Number(this.var_1860.blueOffset) / 255, Number(this.var_1860.alphaOffset) / 255);
            }
        }
    }
}
}
