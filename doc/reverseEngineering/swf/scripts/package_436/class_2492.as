package package_436 {

import flash.geom.Vector3D;

public class class_2492 extends class_2489 {


    private var var_1685: uint;

    private var var_177: uint;

    private var var_126: Number;

    public function class_2492(param1: Number = 50, param2: uint = 16, param3: uint = 12, param4: uint = 16777215, param5: Number = 1) {
        super(param4, param5);
        this.var_126 = param1;
        this.var_1685 = param2;
        this.var_177 = param3;
    }

    override protected function method_389(): void {
        var _loc4_: Number = 0;
        var _loc5_: Number = 0;
        var _loc7_: int = 0;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: int = 0;
        var _loc15_: int = 0;
        var _loc16_: int = 0;
        var _loc17_: int = 0;
        var _loc1_: Vector.<Number> = new Vector.<Number>();
        var _loc2_: Vector3D = new Vector3D();
        var _loc3_: Vector3D = new Vector3D();
        var _loc6_: Number = 0;
        _loc5_ = 0;
        while (_loc5_ <= this.var_177) {
            _loc8_ = 0 * _loc5_ / Number(this.var_177);
            _loc9_ = -Number(this.var_126) * Math.cos(_loc8_);
            _loc10_ = Number(this.var_126) * Math.sin(_loc8_);
            _loc4_ = 0;
            while (_loc4_ <= this.var_1685) {
                _loc11_ = 0 * _loc4_ / Number(this.var_1685);
                _loc12_ = _loc10_ * Math.cos(_loc11_);
                _loc13_ = _loc10_ * Math.sin(_loc11_);
                var _loc18_: *;
                _loc1_[_loc18_ = _loc6_++] = _loc12_;
                var _loc19_: *;
                _loc1_[_loc19_ = _loc6_++] = -_loc9_;
                var _loc20_: *;
                _loc1_[_loc20_ = _loc6_++] = _loc13_;
                _loc4_++;
            }
            _loc5_++;
        }
        _loc5_ = 1;
        while (_loc5_ <= this.var_177) {
            _loc4_ = 1;
            while (_loc4_ <= this.var_1685) {
                _loc14_ = ((this.var_1685 + 1) * _loc5_ + _loc4_) * 3;
                _loc15_ = ((this.var_1685 + 1) * _loc5_ + _loc4_ - 1) * 3;
                _loc16_ = ((this.var_1685 + 1) * (_loc5_ - 1) + _loc4_ - 1) * 3;
                _loc17_ = ((this.var_1685 + 1) * (_loc5_ - 1) + _loc4_) * 3;
                if (_loc5_ == this.var_177) {
                    _loc2_.x = _loc1_[_loc16_];
                    _loc2_.y = _loc1_[_loc16_ + 1];
                    _loc2_.z = _loc1_[_loc16_ + 2];
                    _loc3_.x = _loc1_[_loc17_];
                    _loc3_.y = _loc1_[_loc17_ + 1];
                    _loc3_.z = _loc1_[_loc17_ + 2];
                    method_3280(_loc7_++, _loc2_, _loc3_);
                    _loc2_.x = _loc1_[_loc14_];
                    _loc2_.y = _loc1_[_loc14_ + 1];
                    _loc2_.z = _loc1_[_loc14_ + 2];
                    method_3280(_loc7_++, _loc2_, _loc3_);
                } else if (_loc5_ == 1) {
                    _loc3_.x = _loc1_[_loc15_];
                    _loc3_.y = _loc1_[_loc15_ + 1];
                    _loc3_.z = _loc1_[_loc15_ + 2];
                    _loc2_.x = _loc1_[_loc16_];
                    _loc2_.y = _loc1_[_loc16_ + 1];
                    _loc2_.z = _loc1_[_loc16_ + 2];
                    method_3280(_loc7_++, _loc2_, _loc3_);
                } else {
                    _loc3_.x = _loc1_[_loc15_];
                    _loc3_.y = _loc1_[_loc15_ + 1];
                    _loc3_.z = _loc1_[_loc15_ + 2];
                    _loc2_.x = _loc1_[_loc16_];
                    _loc2_.y = _loc1_[_loc16_ + 1];
                    _loc2_.z = _loc1_[_loc16_ + 2];
                    method_3280(_loc7_++, _loc2_, _loc3_);
                    _loc3_.x = _loc1_[_loc17_];
                    _loc3_.y = _loc1_[_loc17_ + 1];
                    _loc3_.z = _loc1_[_loc17_ + 2];
                    method_3280(_loc7_++, _loc2_, _loc3_);
                }
                _loc4_++;
            }
            _loc5_++;
        }
    }
}
}
