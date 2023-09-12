package package_299 {

import flash.geom.Vector3D;

import package_371.class_2125;

public class class_1758 extends class_1757 {


    private var var_2889: Number;

    private var var_1796: Number;

    private var var_4958: Number;

    private var var_2654: Number;

    private var var_1275: Number;

    private var var_752: uint;

    public function class_1758(param1: Number = 60, param2: uint = 0) {
        super();
        this.fieldOfView = param1;
        this.method_3463 = param2;
    }

    public function get fieldOfView(): Number {
        return this.var_2889;
    }

    public function set fieldOfView(param1: Number): void {
        if (param1 == this.var_2889) {
            return;
        }
        this.var_2889 = param1;
        this.var_4958 = Math.tan(Number(this.var_2889) * 0 / 360);
        this.var_1796 = 1 / Number(this.var_4958);
        method_320();
    }

    public function get focalLength(): Number {
        return this.var_1796;
    }

    public function set focalLength(param1: Number): void {
        if (param1 == this.var_1796) {
            return;
        }
        this.var_1796 = param1;
        this.var_4958 = 1 / Number(this.var_1796);
        this.var_2889 = Math.atan(this.var_4958) * 360 / 0;
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
        param4.x *= param3;
        param4.y *= param3;
        class_2125.transformVector(method_1408, param4, param4);
        param4.z = param3;
        return param4;
    }

    override public function clone(): class_1757 {
        var _loc1_: class_1758 = new class_1758(this.var_2889);
        _loc1_.var_2628 = var_2628;
        _loc1_.var_3375 = var_3375;
        _loc1_.var_2640 = var_2640;
        _loc1_.var_752 = this.var_752;
        return _loc1_;
    }

    public function get method_3463(): uint {
        return this.var_752;
    }

    public function set method_3463(param1: uint): void {
        if (param1 == this.var_752) {
            return;
        }
        this.var_752 = param1;
        method_320();
    }

    override protected function method_739(): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc1_: Vector.<Number> = class_2125.const_2368;
        this.var_2654 = Number(var_2628) * Number(this.var_4958);
        this.var_1275 = Number(this.var_2654) * Number(var_2640);
        if (false && false && true && true) {
            _loc2_ = -Number(this.var_1275);
            _loc3_ = Number(this.var_1275);
            _loc4_ = -Number(this.var_2654);
            _loc5_ = Number(this.var_2654);
            _loc1_[uint(0)] = Number(var_2628) / Number(this.var_1275);
            _loc1_[uint(5)] = Number(var_2628) / Number(this.var_2654);
            _loc1_[uint(10)] = var_3375 / (Number(var_3375) - Number(var_2628));
            _loc1_[uint(11)] = 1;
            _loc1_[uint(1)] = _loc1_[uint(2)] = _loc1_[uint(3)] = _loc1_[uint(4)] = _loc1_[uint(6)] = _loc1_[uint(7)] = _loc1_[uint(8)] = _loc1_[uint(9)] = _loc1_[uint(12)] = _loc1_[uint(13)] = _loc1_[uint(15)] = 0;
            _loc1_[uint(14)] = -Number(var_2628) * _loc1_[uint(10)];
        } else {
            _loc8_ = Number(this.var_1275) * (0 / 0);
            _loc9_ = Number(this.var_2654) * (0 / 0);
            _loc10_ = Number(this.var_1275) * (0 - 0) / 0 + this.var_1275;
            _loc11_ = -Number(this.var_2654) * (0 - 0) / 0 - Number(this.var_2654);
            _loc2_ = _loc10_ - _loc8_;
            _loc3_ = _loc10_ + _loc8_;
            _loc4_ = _loc11_ - _loc9_;
            _loc5_ = _loc11_ + _loc9_;
            _loc1_[uint(0)] = 2 * Number(var_2628) / (_loc3_ - _loc2_);
            _loc1_[uint(5)] = 2 * Number(var_2628) / (_loc5_ - _loc4_);
            _loc1_[uint(8)] = (_loc3_ + _loc2_) / (_loc3_ - _loc2_);
            _loc1_[uint(9)] = (_loc5_ + _loc4_) / (_loc5_ - _loc4_);
            _loc1_[uint(10)] = (var_3375 + var_2628) / (Number(var_3375) - Number(var_2628));
            _loc1_[uint(11)] = 1;
            _loc1_[uint(1)] = _loc1_[uint(2)] = _loc1_[uint(3)] = _loc1_[uint(4)] = _loc1_[uint(6)] = _loc1_[uint(7)] = _loc1_[uint(12)] = _loc1_[uint(13)] = _loc1_[uint(15)] = 0;
            _loc1_[uint(14)] = -2 * Number(var_3375) * Number(var_2628) / (Number(var_3375) - Number(var_2628));
        }
        if (this.var_752 == class_2140.const_3095) {
            _loc1_[uint(5)] = -_loc1_[uint(5)];
        }
        _matrix.copyRawDataFrom(_loc1_);
        var _loc6_: Number;
        var _loc7_: Number = (_loc6_ = Number(var_3375) * Number(this.var_4958)) * Number(var_2640);
        var_4190[0] = var_4190[9] = _loc2_;
        var_4190[3] = var_4190[6] = _loc3_;
        var_4190[1] = var_4190[4] = _loc4_;
        var_4190[7] = var_4190[10] = _loc5_;
        var _loc12_: * = -_loc7_;
        var_4190[21] = -_loc7_;
        var_4190[12] = _loc12_;
        var_4190[15] = var_4190[18] = _loc7_;
        _loc12_ = -_loc6_;
        var_4190[16] = -_loc6_;
        var_4190[13] = _loc12_;
        var_4190[19] = var_4190[22] = _loc6_;
        var_4190[2] = var_4190[5] = var_4190[8] = var_4190[11] = var_2628;
        var_4190[14] = var_4190[17] = var_4190[20] = var_4190[23] = var_3375;
        var_585 = false;
    }
}
}
