package package_372 {

import away3d.arcane;

import flash.geom.Vector3D;

import package_304.class_1766;

import package_371.class_2230;

import package_376.class_2144;

public class class_2225 extends class_2224 {


    private var var_2267: class_1766;

    arcane var var_4303: class_2225;

    public function class_2225(param1: class_1766) {
        super();
        this.var_2267 = param1;
        arcane::var_1564 = 1;
    }

    public function get entity(): class_1766 {
        return this.var_2267;
    }

    override public function method_2995(param1: class_2144): void {
        param1.method_5920(this.var_2267);
    }

    public function removeFromParent(): void {
        if (arcane::_parent) {
            arcane::_parent.arcane::removeNode(this);
        }
        arcane::_parent = null;
    }

    override public function method_3128(param1: Vector.<class_2230>, param2: int): Boolean {
        if (!this.var_2267.arcane::isVisible) {
            return false;
        }
        return this.var_2267.method_5720.method_3128(param1, param2);
    }

    override public function method_4598(param1: Vector3D, param2: Vector3D): Boolean {
        if (!this.var_2267.arcane::isVisible) {
            return false;
        }
        return this.var_2267.method_4598(param1, param2);
    }
}
}
