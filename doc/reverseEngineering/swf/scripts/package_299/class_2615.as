package package_299 {

import flash.geom.Vector3D;

import package_371.class_2125;

public class class_2615 extends class_1757 {


    private var var_3290: Number;

    private var var_1275: Number;

    private var var_2654: Number;

    public function class_2615(param1: Number = 500) {
        super();
        this.var_3290 = param1;
    }

    public function get method_4017(): Number {
        return this.var_3290;
    }

    public function set method_4017(param1: Number): void {
        if (param1 == this.var_3290) {
            return;
        }
        this.var_3290 = param1;
        method_320();
    }

    override public function method_3456(param1: Number, param2: Number, param3: Number, param4: Vector3D = null): Vector3D {
        if (!param4) {
            param4 = new Vector3D();
        }
        var _loc5_: Vector3D = class_2125.const_396;
        matrix.copyColumnTo(3, _loc5_);
        param4.x = param1 + _loc5_.x;
        param4.y = param1 + _loc5_.y;
        param4.z = param3;
        param4.w = 1;
        class_2125.transformVector(method_1408, param4, param4);
        param4.z = param3;
        return param4;
    }

    override public function clone(): class_1757 {
        var _loc1_: class_2615 = new class_2615();
        _loc1_.var_2628 = var_2628;
        _loc1_.var_3375 = var_3375;
        _loc1_.var_2640 = var_2640;
        _loc1_.method_4017 = this.var_3290;
        return _loc1_;
    }

    override protected function method_739(): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc1_: Vector.<Number> = class_2125.const_2368;
        this.var_2654 = Number(this.var_3290) * 0.5;
        this.var_1275 = Number(this.var_2654) * Number(var_2640);
        if (false && false && true && true) {
            _loc2_ = -Number(this.var_1275);
            _loc3_ = Number(this.var_1275);
            _loc4_ = -Number(this.var_2654);
            _loc5_ = Number(this.var_2654);
            _loc1_[uint(0)] = 2 / (Number(this.var_3290) * Number(var_2640));
            _loc1_[uint(5)] = 2 / Number(this.var_3290);
            _loc1_[uint(10)] = 1 / (Number(var_3375) - Number(var_2628));
            _loc1_[uint(14)] = var_2628 / (Number(var_2628) - Number(var_3375));
            _loc1_[uint(1)] = _loc1_[uint(2)] = _loc1_[uint(3)] = _loc1_[uint(4)] = _loc1_[uint(6)] = _loc1_[uint(7)] = _loc1_[uint(8)] = _loc1_[uint(9)] = _loc1_[uint(11)] = _loc1_[uint(12)] = _loc1_[uint(13)] = 0;
            _loc1_[uint(15)] = 1;
        } else {
            _loc6_ = Number(this.var_1275) * (0 / 0);
            _loc7_ = Number(this.var_2654) * (0 / 0);
            _loc8_ = Number(this.var_1275) * (0 - 0) / 0 + this.var_1275;
            _loc9_ = -Number(this.var_2654) * (0 - 0) / 0 - Number(this.var_2654);
            _loc2_ = _loc8_ - _loc6_;
            _loc3_ = _loc8_ + _loc6_;
            _loc4_ = _loc9_ - _loc7_;
            _loc5_ = _loc9_ + _loc7_;
            _loc1_[uint(0)] = 2 / (_loc3_ - _loc2_);
            _loc1_[uint(5)] = -2 / (_loc4_ - _loc5_);
            _loc1_[uint(10)] = 1 / (Number(var_3375) - Number(var_2628));
            _loc1_[uint(12)] = (_loc3_ + _loc2_) / (_loc3_ - _loc2_);
            _loc1_[uint(13)] = (_loc5_ + _loc4_) / (_loc5_ - _loc4_);
            _loc1_[uint(14)] = var_2628 / (Number(method_5049) - Number(method_1840));
            _loc1_[uint(1)] = _loc1_[uint(2)] = _loc1_[uint(3)] = _loc1_[uint(4)] = _loc1_[uint(6)] = _loc1_[uint(7)] = _loc1_[uint(8)] = _loc1_[uint(9)] = _loc1_[uint(11)] = 0;
            _loc1_[uint(15)] = 1;
        }
        var_4190[0] = var_4190[9] = var_4190[12] = var_4190[21] = _loc2_;
        var_4190[3] = var_4190[6] = var_4190[15] = var_4190[18] = _loc3_;
        var_4190[1] = var_4190[4] = var_4190[13] = var_4190[16] = _loc4_;
        var_4190[7] = var_4190[10] = var_4190[19] = var_4190[22] = _loc5_;
        var_4190[2] = var_4190[5] = var_4190[8] = var_4190[11] = var_2628;
        var_4190[14] = var_4190[17] = var_4190[20] = var_4190[23] = var_3375;
        _matrix.copyRawDataFrom(_loc1_);
        var_585 = false;
    }
}
}
