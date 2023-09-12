package package_490 {

import flash.geom.Matrix;
import flash.geom.Matrix3D;

public class class_2720 {


    private var var_2142: Matrix3D;

    private var var_3523: Matrix3D;

    private var var_2868: Matrix;

    public function class_2720() {
        super();
    }

    public function set vertexTransform(param1: Matrix3D): void {
        this.var_2142 = param1;
        this.var_3523 = param1.clone();
        this.var_3523.invert();
        this.var_3523.transpose();
    }

    public function set method_2901(param1: Matrix): void {
        this.var_2868 = param1;
    }

    public function get method_2901(): Matrix {
        return this.var_2868;
    }

    public function get vertexTransform(): Matrix3D {
        return this.var_2142;
    }

    public function get method_6099(): Matrix3D {
        return this.var_3523;
    }
}
}
