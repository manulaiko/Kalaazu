package package_417 {

import org.flintparticles.common.utils.class_2561;

import package_416.class_2338;

import package_459.class_2551;
import package_459.class_2559;

import package_460.class_2552;
import package_460.class_2560;

public class class_2339 extends class_2338 {

    protected static var var_610: class_2560 = new class_2560();


    protected var _x: Number = 0;

    protected var _y: Number = 0;

    protected var _rotation: Number = 0;

    public var var_4188: Boolean = false;

    public function class_2339() {
        super();
        var_4480 = var_610;
    }

    public static function get method_3080(): class_2559 {
        return var_610;
    }

    public function get x(): Number {
        return this._x;
    }

    public function set x(param1: Number): void {
        this._x = param1;
    }

    public function get y(): Number {
        return this._y;
    }

    public function set y(param1: Number): void {
        this._y = param1;
    }

    public function get rotation(): Number {
        return class_2561.method_1945(this._rotation);
    }

    public function set rotation(param1: Number): void {
        this._rotation = class_2561.method_1180(param1);
    }

    public function get method_867(): Number {
        return this._rotation;
    }

    public function set method_867(param1: Number): void {
        this._rotation = param1;
    }

    override protected function method_1004(param1: class_2551): void {
        var _loc2_: class_2552 = class_2552(param1);
        _loc2_.x = this._x;
        _loc2_.y = this._y;
        _loc2_.var_789 = this._x;
        _loc2_.var_2238 = this._y;
        _loc2_.rotation = this._rotation;
    }

    override protected function method_3022(): void {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        if (this.var_4188) {
            var_278.sortOn("x", Array.NUMERIC);
            _loc1_ = 0;
            _loc2_ = 0;
            while (_loc2_ < _loc1_) {
                class_2552(var_278[_loc2_]).sortID = _loc2_;
                _loc2_++;
            }
        }
    }
}
}
