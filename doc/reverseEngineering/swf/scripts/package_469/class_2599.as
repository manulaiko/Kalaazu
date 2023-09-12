package package_469 {

import flash.geom.Vector3D;

import package_386.class_2408;
import package_386.class_2580;

import package_465.class_2594;

public class class_2599 extends class_2594 {


    private var var_3966: class_2594;

    private var var_2235: class_2594;

    private var var_3296: class_2594;

    private var var_1409: class_2594;

    private var var_4062: class_2594;

    public function class_2599(param1: String, param2: class_2594, param3: class_2594, param4: class_2594, param5: class_2594, param6: class_2594) {
        super(param1);
        this.var_3966 = param2;
        this.var_2235 = param3;
        this.var_3296 = param4;
        this.var_1409 = param5;
        this.var_4062 = param6;
    }

    override public function method_1777(param1: class_2580): void {
        param1[var_78] = this.generateOneValue(param1.index, param1.total);
    }

    override public function generateOneValue(param1: int = 0, param2: int = 1): * {
        var _loc3_: Vector3D = !!this.var_3966 ? this.var_3966.generateOneValue(param1, param2) : null;
        var _loc4_: Vector3D = !!this.var_2235 ? this.var_2235.generateOneValue(param1, param2) : null;
        var _loc5_: Vector3D = !!this.var_3296 ? this.var_3296.generateOneValue(param1, param2) : null;
        var _loc6_: Number = !!this.var_1409 ? Number(this.var_1409.generateOneValue(param1, param2)) : 0;
        var _loc7_: Number = !!this.var_4062 ? Number(this.var_4062.generateOneValue(param1, param2)) : 1;
        return new class_2408(_loc3_, _loc4_, _loc5_, _loc6_, _loc7_);
    }

    override public function method_5590(param1: class_2580): void {
        if (this.var_3966) {
            this.var_3966.method_5590(param1);
        }
        if (this.var_2235) {
            this.var_2235.method_5590(param1);
        }
        if (this.var_3296) {
            this.var_3296.method_5590(param1);
        }
        if (this.var_1409) {
            this.var_1409.method_5590(param1);
        }
        if (this.var_4062) {
            this.var_4062.method_5590(param1);
        }
    }

    override public function method_3724(param1: class_2580): void {
        if (this.var_3966) {
            this.var_3966.method_3724(param1);
        }
        if (this.var_2235) {
            this.var_2235.method_3724(param1);
        }
        if (this.var_3296) {
            this.var_3296.method_3724(param1);
        }
        if (this.var_1409) {
            this.var_1409.method_3724(param1);
        }
        if (this.var_4062) {
            this.var_4062.method_3724(param1);
        }
    }
}
}
