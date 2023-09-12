package package_430 {

import away3d.animators.class_2403;
import away3d.arcane;

import flash.geom.Matrix3D;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_386.class_2238;
import package_386.class_2575;

import package_431.class_2406;
import package_431.class_2736;

public class class_2754 extends class_2401 {


    private var _matrix: Matrix3D;

    public function class_2754(param1: class_2403, param2: class_2406) {
        this._matrix = new Matrix3D();
        super(param1, param2);
    }

    override public function setRenderState(param1: class_1208, param2: class_2133, param3: class_2575, param4: class_2238, param5: class_1767): void {
        if (param4.var_3591) {
            this._matrix.copyFrom(param2.sceneTransform);
            this._matrix.append(param5.method_2908);
            param4.method_1255(param4.method_2879(var_3560, class_2736.arcane::const_947), this._matrix);
        }
    }
}
}
