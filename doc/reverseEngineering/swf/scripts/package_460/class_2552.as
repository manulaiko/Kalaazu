package package_460 {

import flash.geom.Matrix;

import package_459.class_2551;
import package_459.class_2559;

public class class_2552 extends class_2551 {


    public var x: Number = 0;

    public var y: Number = 0;

    public var var_789: Number = 0;

    public var var_2238: Number = 0;

    public var var_831: Number = 0;

    public var var_3765: Number = 0;

    public var rotation: Number = 0;

    public var var_2695: Number = 0;

    private var var_1185: Number;

    private var var_3162: Number;

    private var var_2306: Number;

    public var sortID: int = -1;

    public function class_2552() {
        super();
    }

    public function get method_2668(): Number {
        if (var_5033 != this.var_1185 || var_386 != this.var_3162) {
            this.var_2306 = Number(var_5033) * Number(var_386) * Number(var_386) * 0.5;
            this.var_1185 = var_5033;
            this.var_3162 = var_386;
        }
        return this.var_2306;
    }

    override public function initialize(): void {
        super.initialize();
        this.x = 0;
        this.y = 0;
        this.var_789 = 0;
        this.var_2238 = 0;
        this.var_831 = 0;
        this.var_3765 = 0;
        this.rotation = 0;
        this.var_2695 = 0;
        this.sortID = -1;
    }

    public function get method_6186(): Matrix {
        var _loc1_: Number = Number(scale) * Math.cos(this.rotation);
        var _loc2_: Number = Number(scale) * Math.sin(this.rotation);
        return new Matrix(_loc1_, _loc2_, -_loc2_, _loc1_, this.x, this.y);
    }

    override public function clone(param1: class_2559 = null): class_2551 {
        var _loc2_: * = null;
        if (param1) {
            _loc2_ = param1.method_1095() as class_2552;
        } else {
            _loc2_ = new class_2552();
        }
        method_2154(_loc2_);
        _loc2_.x = this.x;
        _loc2_.y = this.y;
        _loc2_.var_831 = this.var_831;
        _loc2_.var_3765 = this.var_3765;
        _loc2_.rotation = this.rotation;
        _loc2_.var_2695 = this.var_2695;
        return _loc2_;
    }
}
}
