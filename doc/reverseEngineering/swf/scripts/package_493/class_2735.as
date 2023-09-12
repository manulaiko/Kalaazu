package package_493 {

import flash.geom.Vector3D;

import package_386.class_2580;

import package_465.class_2594;

public class class_2735 extends class_2594 {


    private var var_1626: class_2594;

    private var var_179: class_2594;

    private var var_3117: class_2594;

    private var var_520: class_2594;

    public function class_2735(param1: String, param2: class_2594 = null, param3: class_2594 = null, param4: class_2594 = null, param5: class_2594 = null) {
        super(param1);
        this.var_1626 = param2;
        this.var_179 = param3;
        this.var_3117 = param4;
        this.var_520 = param5;
    }

    override public function method_1777(param1: class_2580): void {
        param1[var_78] = this.generateOneValue(param1.index, param1.total);
    }

    override public function generateOneValue(param1: int = 0, param2: int = 1): * {
        var _loc3_: Number = !!this.var_1626 ? Number(this.var_1626.generateOneValue(param1, param2)) : 0;
        var _loc4_: Number = !!this.var_179 ? Number(this.var_179.generateOneValue(param1, param2)) : 0;
        var _loc5_: Number = !!this.var_3117 ? Number(this.var_3117.generateOneValue(param1, param2)) : 0;
        var _loc6_: Number = !!this.var_520 ? Number(this.var_520.generateOneValue(param1, param2)) : 0;
        return new Vector3D(_loc3_, _loc4_, _loc5_, _loc6_);
    }

    override public function method_5590(param1: class_2580): void {
        if (this.var_1626) {
            this.var_1626.method_5590(param1);
        }
        if (this.var_179) {
            this.var_179.method_5590(param1);
        }
        if (this.var_3117) {
            this.var_3117.method_5590(param1);
        }
        if (this.var_520) {
            this.var_520.method_5590(param1);
        }
    }

    override public function method_3724(param1: class_2580): void {
        if (this.var_1626) {
            this.var_1626.method_3724(param1);
        }
        if (this.var_179) {
            this.var_179.method_3724(param1);
        }
        if (this.var_3117) {
            this.var_3117.method_3724(param1);
        }
        if (this.var_520) {
            this.var_520.method_3724(param1);
        }
    }
}
}
