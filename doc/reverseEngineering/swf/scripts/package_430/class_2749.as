package package_430 {

import away3d.animators.class_2403;
import away3d.arcane;

import flash.display3D.Context3DVertexBufferFormat;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_386.class_2238;
import package_386.class_2575;
import package_386.class_2578;

import package_431.class_2727;

public class class_2749 extends class_2401 {


    private var var_1206: class_2727;

    private var var_860: Number;

    private var _scale: Number;

    public function class_2749(param1: class_2403, param2: class_2727) {
        super(param1, param2);
        this.var_1206 = param2;
        this.var_860 = param2.arcane::var_860;
        this._scale = param2.arcane::_scale;
    }

    override public function setRenderState(param1: class_1208, param2: class_2133, param3: class_2575, param4: class_2238, param5: class_1767): void {
        var _loc6_: int = 0;
        if (param4.name_26) {
            _loc6_ = int(param4.method_2879(var_3560, class_2727.arcane::const_836));
            if (this.var_1206.mode == class_2578.name_100) {
                switch (this.var_1206.arcane::var_1003) {
                    case class_2727.const_1737:
                        param4.method_5167(_loc6_, 0 / Number(this.var_860), this._scale);
                        break;
                    case class_2727.const_1024:
                    default:
                        param4.method_5167(_loc6_, 1 / Number(this.var_860), this._scale);
                }
            } else {
                param3.method_748(_loc6_, this.var_1206.arcane::var_4676, param1, Context3DVertexBufferFormat.FLOAT_2);
            }
        }
    }

    public function get scale(): Number {
        return this._scale;
    }

    public function set scale(param1: Number): void {
        this._scale = param1;
    }

    public function get cycle(): Number {
        return this.var_860;
    }

    public function set cycle(param1: Number): void {
        this.var_860 = param1;
    }
}
}
