package package_422 {

import flash.geom.Point;

import package_460.class_2552;

public class class_2349 implements class_2348 {


    private var _point: Point;

    public function class_2349(param1: Point = null) {
        super();
        if (param1 == null) {
            this._point = new Point(0, 0);
        } else {
            this._point = param1;
        }
    }

    public function get point(): Point {
        return this._point;
    }

    public function set point(param1: Point): void {
        this._point = param1;
    }

    public function get x(): Number {
        return this._point.x;
    }

    public function set x(param1: Number): void {
        this._point.x = param1;
    }

    public function get y(): Number {
        return this._point.y;
    }

    public function set y(param1: Number): void {
        this._point.y = param1;
    }

    public function contains(param1: Number, param2: Number): Boolean {
        return this._point.x == param1 && this._point.y == param2;
    }

    public function getLocation(): Point {
        return this._point.clone();
    }

    public function method_3613(): Number {
        return 1;
    }

    public function method_423(param1: class_2552, param2: Number = 1): Boolean {
        var _loc19_: Number = NaN;
        var _loc3_: Number = Number(param1.var_789) - Number(this._point.x);
        var _loc4_: Number = Number(param1.var_2238) - Number(this._point.y);
        var _loc5_: Number;
        if ((_loc5_ = _loc3_ * Number(param1.var_831) + _loc4_ * Number(param1.var_3765)) >= 0) {
            return false;
        }
        var _loc6_: Number = Number(param1.x) - Number(this._point.x);
        var _loc7_: Number = Number(param1.y) - Number(this._point.y);
        var _loc8_: Number = Number(param1.var_386);
        if ((_loc5_ = _loc6_ * Number(param1.var_831) + _loc7_ * Number(param1.var_3765)) <= 0) {
            if (_loc6_ > _loc8_ || _loc6_ < -_loc8_) {
                return false;
            }
            if (_loc7_ > _loc8_ || _loc7_ < -_loc8_) {
                return false;
            }
            if (_loc6_ * _loc6_ + _loc7_ * _loc7_ > _loc8_ * _loc8_) {
                return false;
            }
        }
        var _loc9_: Number = _loc6_ - _loc3_;
        var _loc10_: Number = _loc7_ - _loc4_;
        var _loc11_: Number = _loc9_ * _loc9_ + _loc10_ * _loc10_;
        var _loc12_: Number = 2 * (_loc3_ * _loc9_ + _loc4_ * _loc10_);
        var _loc13_: Number = _loc3_ * _loc3_ + _loc4_ * _loc4_ - _loc8_ * _loc8_;
        var _loc14_: Number;
        if ((_loc14_ = _loc12_ * _loc12_ - 4 * _loc11_ * _loc13_) < 0) {
            return false;
        }
        var _loc15_: Number = Math.sqrt(_loc14_);
        var _loc16_: Number = (-_loc12_ + _loc15_) / (2 * _loc11_);
        var _loc17_: Number = (-_loc12_ - _loc15_) / (2 * _loc11_);
        var _loc18_: Array = new Array();
        if (_loc16_ > 0 && _loc16_ <= 1) {
            _loc18_.push(_loc16_);
        }
        if (_loc17_ > 0 && _loc17_ <= 1) {
            _loc18_.push(_loc17_);
        }
        if (_loc18_.length == 0) {
            return false;
        }
        if (_loc18_.length == 1) {
            _loc19_ = Number(_loc18_[0]);
        } else {
            _loc19_ = Math.min(_loc16_, _loc17_);
        }
        var _loc20_: Number = _loc3_ + _loc19_ * _loc9_ + this._point.x;
        var _loc21_: Number = _loc4_ + _loc19_ * _loc10_ + this._point.y;
        var _loc22_: Number = _loc20_ - Number(this._point.x);
        var _loc23_: Number = _loc21_ - Number(this._point.y);
        var _loc24_: Number = Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_);
        _loc22_ /= _loc24_;
        _loc23_ /= _loc24_;
        var _loc25_: Number = _loc9_ * _loc22_ + _loc10_ * _loc23_;
        _loc9_ -= 2 * _loc22_ * _loc25_;
        _loc10_ -= 2 * _loc23_ * _loc25_;
        param1.x = _loc20_ + (1 - _loc19_) * _loc9_;
        param1.y = _loc21_ + (1 - _loc19_) * _loc10_;
        var _loc26_: Number = Number(param1.var_831) * _loc22_ + Number(param1.var_3765) * _loc23_;
        param1.var_831 -= (1 + param2) * _loc22_ * _loc26_;
        param1.var_3765 -= (1 + param2) * _loc23_ * _loc26_;
        return true;
    }
}
}
