package package_296 {

import flash.geom.Vector3D;

import package_294.class_2398;

public class class_2659 implements class_2228 {


    private var var_718: class_2658;

    private var var_4900: class_2660;

    private var var_2662: class_2228;

    public var var_4798: uint = 1024;

    public function class_2659(param1: Boolean = false) {
        super();
        this.var_4900 = new class_2660(param1);
        this.var_718 = new class_2658(param1);
    }

    public function method_2991(param1: Vector3D, param2: Vector3D): void {
        this.var_4900.method_2991(param1, param2);
        this.var_718.method_2991(param1, param2);
    }

    public function method_827(param1: class_2398, param2: class_1754, param3: Number): Boolean {
        this.var_2662 = param1.name_42 > this.var_4798 ? this.var_718 : this.var_4900;
        return this.var_2662.method_827(param1, param2, param3);
    }
}
}
