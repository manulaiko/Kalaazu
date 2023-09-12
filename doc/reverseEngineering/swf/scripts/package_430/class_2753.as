package package_430 {

import away3d.animators.class_2403;
import away3d.arcane;

import flash.display3D.Context3DVertexBufferFormat;
import flash.geom.Vector3D;
import flash.utils.Dictionary;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_386.class_2238;
import package_386.class_2575;
import package_386.class_2578;

import package_431.class_2733;

public class class_2753 extends class_2401 {


    private var var_4527: class_2733;

    private var var_747: Vector3D;

    public function class_2753(param1: class_2403, param2: class_2733) {
        super(param1, param2);
        this.var_4527 = param2;
        this.var_747 = this.var_4527.arcane::var_747;
    }

    public function get velocity(): Vector3D {
        return this.var_747;
    }

    public function set velocity(param1: Vector3D): void {
        this.var_747 = param1;
    }

    public function method_103(): Vector.<Vector3D> {
        return var_2419;
    }

    public function method_6418(param1: Vector.<Vector3D>): void {
        var_2419 = param1;
        var_1953 = new Dictionary(true);
    }

    override public function setRenderState(param1: class_1208, param2: class_2133, param3: class_2575, param4: class_2238, param5: class_1767): void {
        if (this.var_4527.mode == class_2578.name_117 && true) {
            method_1348(param3);
        }
        var _loc6_: int = int(param4.method_2879(var_3560, class_2733.arcane::const_843));
        if (this.var_4527.mode == class_2578.name_100) {
            param4.method_5167(_loc6_, this.var_747.x, this.var_747.y, this.var_747.z);
        } else {
            param3.method_748(_loc6_, this.var_4527.arcane::var_4676, param1, Context3DVertexBufferFormat.FLOAT_3);
        }
    }
}
}
