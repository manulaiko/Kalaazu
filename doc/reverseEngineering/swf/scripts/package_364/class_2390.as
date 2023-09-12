package package_364 {

import away3d.arcane;

import flash.geom.Matrix3D;

import package_294.class_2133;

import package_369.class_2570;

import package_372.class_2225;
import package_372.class_2569;

import package_383.class_2226;
import package_383.class_2231;

public class class_2390 extends class_2102 {


    private var var_4670: class_2570;

    private var var_3031: class_2570;

    public function class_2390(param1: class_2570, param2: class_2570 = null) {
        super();
        this.var_4670 = param1;
        this.var_3031 = param2;
    }

    override protected function method_1737(): class_2225 {
        return new class_2569(this);
    }

    public function get method_6006(): class_2570 {
        return this.var_4670;
    }

    public function set method_6006(param1: class_2570): void {
        this.var_4670 = param1;
    }

    public function get specularMap(): class_2570 {
        return this.var_3031;
    }

    public function set specularMap(param1: class_2570): void {
        this.var_3031 = param1;
    }

    override protected function updateBounds(): void {
        var_2006 = false;
    }

    override protected function method_1594(): class_2226 {
        return new class_2231();
    }

    override arcane function method_3242(param1: class_2133, param2: Matrix3D = null): Matrix3D {
        param1 = param1;
        param2 = param2;
        throw new Error("Object projection matrices are not supported for LightProbe objects!");
    }
}
}
