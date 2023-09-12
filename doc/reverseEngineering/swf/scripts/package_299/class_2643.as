package package_299 {

import flash.geom.Vector3D;

import package_371.class_2125;

public class class_2643 extends class_1757 {


    private var var_1677: Number;

    private var var_2545: Number;

    private var var_2612: Number;

    private var var_1567: Number;

    public function class_2643(param1: Number, param2: Number, param3: Number, param4: Number) {
        super();
        this.var_1677 = param1;
        this.var_2545 = param2;
        this.var_2612 = param3;
        this.var_1567 = param4;
    }

    public function get method_2548(): Number {
        return this.var_1677;
    }

    public function set method_2548(param1: Number): void {
        this.var_1677 = param1;
        method_320();
    }

    public function get method_976(): Number {
        return this.var_2545;
    }

    public function set method_976(param1: Number): void {
        this.var_2545 = param1;
        method_320();
    }

    public function get method_5180(): Number {
        return this.var_2612;
    }

    public function set method_5180(param1: Number): void {
        this.var_2612 = param1;
        method_320();
    }

    public function get method_4138(): Number {
        return this.var_1567;
    }

    public function set method_4138(param1: Number): void {
        this.var_1567 = param1;
        method_320();
    }

    override public function method_3456(param1: Number, param2: Number, param3: Number, param4: Vector3D = null): Vector3D {
        if (!param4) {
            param4 = new Vector3D();
        }
        param4.x = param1;
        param4.y = -param2;
        param4.z = param3;
        param4.w = 1;
        class_2125.transformVector(method_1408, param4, param4);
        param4.z = param3;
        return param4;
    }

    override public function clone(): class_1757 {
        var _loc1_: class_2643 = new class_2643(this.var_1677, this.var_2545, this.var_2612, this.var_1567);
        _loc1_.var_2628 = var_2628;
        _loc1_.var_3375 = var_3375;
        _loc1_.var_2640 = var_2640;
        return _loc1_;
    }

    override protected function method_739(): void {
        var _loc1_: Vector.<Number> = class_2125.const_2368;
        var _loc2_: Number = 1 / (Number(this.var_2545) - Number(this.var_1677));
        var _loc3_: Number = 1 / (Number(this.var_1567) - Number(this.var_2612));
        var _loc4_: Number = 1 / (Number(var_3375) - Number(var_2628));
        _loc1_[0] = 2 * _loc2_;
        _loc1_[5] = 2 * _loc3_;
        _loc1_[10] = _loc4_;
        _loc1_[12] = -(this.var_2545 + this.var_1677) * _loc2_;
        _loc1_[13] = -(this.var_1567 + this.var_2612) * _loc3_;
        _loc1_[14] = -Number(var_2628) * _loc4_;
        _loc1_[15] = 1;
        _loc1_[1] = _loc1_[2] = _loc1_[3] = _loc1_[4] = _loc1_[6] = _loc1_[7] = _loc1_[8] = _loc1_[9] = _loc1_[11] = 0;
        _matrix.copyRawDataFrom(_loc1_);
        var_4190[0] = var_4190[9] = var_4190[12] = var_4190[21] = this.var_1677;
        var_4190[3] = var_4190[6] = var_4190[15] = var_4190[18] = this.var_2545;
        var_4190[1] = var_4190[4] = var_4190[13] = var_4190[16] = this.var_2612;
        var_4190[7] = var_4190[10] = var_4190[19] = var_4190[22] = this.var_1567;
        var_4190[2] = var_4190[5] = var_4190[8] = var_4190[11] = var_2628;
        var_4190[14] = var_4190[17] = var_4190[20] = var_4190[23] = var_3375;
        var_585 = false;
    }
}
}
