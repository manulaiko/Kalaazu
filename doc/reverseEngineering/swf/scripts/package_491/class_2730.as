package package_491 {

import flash.geom.ColorTransform;

import package_386.class_2580;

import package_465.class_2594;

public class class_2730 extends class_2594 {


    private var var_1319: class_2594;

    private var var_2499: class_2594;

    private var var_1084: class_2594;

    private var var_2470: class_2594;

    private var var_2873: class_2594;

    private var var_2478: class_2594;

    private var var_4793: class_2594;

    private var var_138: class_2594;

    public function class_2730(param1: String, param2: class_2594, param3: class_2594, param4: class_2594, param5: class_2594, param6: class_2594, param7: class_2594, param8: class_2594, param9: class_2594) {
        super(param1);
        this.var_1319 = param2;
        this.var_2499 = param3;
        this.var_1084 = param4;
        this.var_2470 = param5;
        this.var_2873 = param6;
        this.var_2478 = param7;
        this.var_4793 = param8;
        this.var_138 = param9;
    }

    override public function method_1777(param1: class_2580): void {
        param1[var_78] = this.generateOneValue(param1.index, param1.total);
    }

    override public function generateOneValue(param1: int = 0, param2: int = 1): * {
        var _loc3_: Number = !!this.var_1319 ? Number(this.var_1319.generateOneValue(param1, param2)) : 0;
        var _loc4_: Number = !!this.var_2499 ? Number(this.var_2499.generateOneValue(param1, param2)) : 0;
        var _loc5_: Number = !!this.var_1084 ? Number(this.var_1084.generateOneValue(param1, param2)) : 0;
        var _loc6_: Number = !!this.var_2470 ? Number(this.var_2470.generateOneValue(param1, param2)) : 0;
        var _loc7_: Number = !!this.var_2873 ? Number(this.var_2873.generateOneValue(param1, param2)) : 0;
        var _loc8_: Number = !!this.var_2478 ? Number(this.var_2478.generateOneValue(param1, param2)) : 0;
        var _loc9_: Number = !!this.var_4793 ? Number(this.var_4793.generateOneValue(param1, param2)) : 0;
        var _loc10_: Number = !!this.var_138 ? Number(this.var_138.generateOneValue(param1, param2)) : 0;
        return new ColorTransform(_loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_, _loc9_, _loc10_);
    }

    override public function method_5590(param1: class_2580): void {
        if (this.var_1319) {
            this.var_1319.method_5590(param1);
        }
        if (this.var_2499) {
            this.var_2499.method_5590(param1);
        }
        if (this.var_1084) {
            this.var_1084.method_5590(param1);
        }
        if (this.var_2470) {
            this.var_2470.method_5590(param1);
        }
        if (this.var_2873) {
            this.var_2873.method_5590(param1);
        }
        if (this.var_2478) {
            this.var_2478.method_5590(param1);
        }
        if (this.var_4793) {
            this.var_4793.method_5590(param1);
        }
        if (this.var_138) {
            this.var_138.method_5590(param1);
        }
    }

    override public function method_3724(param1: class_2580): void {
        if (this.var_1319) {
            this.var_1319.method_3724(param1);
        }
        if (this.var_2499) {
            this.var_2499.method_3724(param1);
        }
        if (this.var_1084) {
            this.var_1084.method_3724(param1);
        }
        if (this.var_2470) {
            this.var_2470.method_3724(param1);
        }
        if (this.var_2873) {
            this.var_2873.method_3724(param1);
        }
        if (this.var_2478) {
            this.var_2478.method_3724(param1);
        }
        if (this.var_4793) {
            this.var_4793.method_3724(param1);
        }
        if (this.var_138) {
            this.var_138.method_3724(param1);
        }
    }
}
}
