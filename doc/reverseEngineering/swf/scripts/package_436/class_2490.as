package package_436 {

import flash.geom.Vector3D;

public class class_2490 extends class_2489 {


    private var _width: Number;

    private var _height: Number;

    private var _depth: Number;

    public function class_2490(param1: Number = 100, param2: Number = 100, param3: Number = 100, param4: uint = 16777215, param5: Number = 1) {
        super(param4, param5);
        this._width = param1;
        this._height = param2;
        this._depth = param3;
    }

    public function get width(): Number {
        return this._width;
    }

    public function set width(param1: Number): void {
        this._width = param1;
        method_2121();
    }

    public function get height(): Number {
        return this._height;
    }

    public function set height(param1: Number): void {
        if (param1 <= 0) {
            throw new Error("Value needs to be greater than 0");
        }
        this._height = param1;
        method_2121();
    }

    public function get depth(): Number {
        return this._depth;
    }

    public function set depth(param1: Number): void {
        this._depth = param1;
        method_2121();
    }

    override protected function method_389(): void {
        var _loc1_: Vector3D = new Vector3D();
        var _loc2_: Vector3D = new Vector3D();
        var _loc3_: Number = Number(this._width) * 0.5;
        var _loc4_: Number = Number(this._height) * 0.5;
        var _loc5_: Number = Number(this._depth) * 0.5;
        _loc1_.x = -_loc3_;
        _loc1_.y = _loc4_;
        _loc1_.z = -_loc5_;
        _loc2_.x = -_loc3_;
        _loc2_.y = -_loc4_;
        _loc2_.z = -_loc5_;
        method_3280(0, _loc1_, _loc2_);
        _loc1_.z = _loc5_;
        _loc2_.z = _loc5_;
        method_3280(1, _loc1_, _loc2_);
        _loc1_.x = _loc3_;
        _loc2_.x = _loc3_;
        method_3280(2, _loc1_, _loc2_);
        _loc1_.z = -_loc5_;
        _loc2_.z = -_loc5_;
        method_3280(3, _loc1_, _loc2_);
        _loc1_.x = -_loc3_;
        _loc1_.y = -_loc4_;
        _loc1_.z = -_loc5_;
        _loc2_.x = _loc3_;
        _loc2_.y = -_loc4_;
        _loc2_.z = -_loc5_;
        method_3280(4, _loc1_, _loc2_);
        _loc1_.y = _loc4_;
        _loc2_.y = _loc4_;
        method_3280(5, _loc1_, _loc2_);
        _loc1_.z = _loc5_;
        _loc2_.z = _loc5_;
        method_3280(6, _loc1_, _loc2_);
        _loc1_.y = -_loc4_;
        _loc2_.y = -_loc4_;
        method_3280(7, _loc1_, _loc2_);
        _loc1_.x = -_loc3_;
        _loc1_.y = -_loc4_;
        _loc1_.z = -_loc5_;
        _loc2_.x = -_loc3_;
        _loc2_.y = -_loc4_;
        _loc2_.z = _loc5_;
        method_3280(8, _loc1_, _loc2_);
        _loc1_.y = _loc4_;
        _loc2_.y = _loc4_;
        method_3280(9, _loc1_, _loc2_);
        _loc1_.x = _loc3_;
        _loc2_.x = _loc3_;
        method_3280(10, _loc1_, _loc2_);
        _loc1_.y = -_loc4_;
        _loc2_.y = -_loc4_;
        method_3280(11, _loc1_, _loc2_);
    }
}
}
