package package_419 {

import flash.geom.Point;

import package_413.class_2334;

import package_416.class_2338;

import package_422.class_2348;

import package_459.class_2551;

import package_460.class_2552;

public class Position extends class_2334 {


    private var var_394: class_2348;

    public function Position(param1: class_2348 = null) {
        super();
        this.method_1818 = param1;
    }

    public function get method_1818(): class_2348 {
        return this.var_394;
    }

    public function set method_1818(param1: class_2348): void {
        this.var_394 = param1;
    }

    override public function initialize(param1: class_2338, param2: class_2551): void {
        var _loc3_: * = null;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        _loc3_ = class_2552(param2);
        var _loc4_: Point = this.var_394.getLocation();
        if (_loc3_.rotation == 0) {
            _loc3_.x += _loc4_.x;
            _loc3_.y += _loc4_.y;
        } else {
            _loc5_ = Math.sin(_loc3_.rotation);
            _loc6_ = Math.cos(_loc3_.rotation);
            _loc3_.x += _loc6_ * _loc4_.x - _loc5_ * _loc4_.y;
            _loc3_.y += _loc6_ * _loc4_.y + _loc5_ * _loc4_.x;
        }
        _loc3_.var_789 = _loc3_.x;
        _loc3_.var_2238 = _loc3_.y;
    }
}
}
