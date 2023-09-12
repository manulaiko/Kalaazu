package package_376 {

import flash.geom.Vector3D;

import package_294.class_2133;

import package_364.class_2102;

import package_372.class_2224;

public class class_2151 extends class_2145 {


    private var var_2356: Vector3D;

    private var var_404: Vector3D;

    public function class_2151() {
        this.var_2356 = new Vector3D();
        this.var_404 = new Vector3D();
        super();
    }

    public function get name_34(): Vector3D {
        return this.var_2356;
    }

    public function set name_34(param1: Vector3D): void {
        this.var_2356 = param1;
    }

    public function get rayDirection(): Vector3D {
        return this.var_404;
    }

    public function set rayDirection(param1: Vector3D): void {
        this.var_404 = param1;
    }

    override public function method_4368(param1: class_2224): Boolean {
        return param1.method_4598(this.var_2356, this.var_404);
    }

    override public function method_2327(param1: class_2133): void {
    }

    override public function method_82(param1: class_2133): void {
    }

    override public function method_5654(param1: class_2102): void {
    }
}
}
