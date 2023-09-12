package com.bigpoint.utils {

import flash.geom.Point;

import package_99.class_266;

public class class_73 {

    public static const ZERO: class_73 = new class_73(0, 0, 0);


    protected var _x: Number;

    protected var _y: Number;

    protected var _z: Number;

    public function class_73(param1: Number = 0, param2: Number = 0, param3: Number = 0) {
        super();
        this._x = param1;
        this._y = param2;
        this._z = param3;
    }

    public static function method_2700(param1: Point): class_73 {
        return new class_73(param1.x, param1.y);
    }

    public static function method_5461(param1: class_73, param2: class_73): Number {
        return param1.method_3849(param2.x, param2.y, param2.z);
    }

    public static function clone(param1: class_73): class_73 {
        return new class_73(param1.x, param1.y, param1.z);
    }

    public function add(param1: class_73): class_73 {
        return new class_73(this.x + param1.x, this.y + param1.y, this.z + param1.z);
    }

    public function toString(): String {
        return "PointLite(" + this.x + "/" + this.y + "/" + this.z + ") ";
    }

    public function normalize(param1: Number = 1): void {
        var _loc2_: Number = param1 / Math.sqrt(Number(this._x) * Number(this._x) + Number(this._y) * Number(this._y) + Number(this._z) * Number(this._z));
        this.x *= _loc2_;
        this.y *= _loc2_;
        this.z *= _loc2_;
    }

    public function setTo(param1: Number, param2: Number, param3: Number): void {
        this._x = param1;
        this._y = param2;
        this._z = param3;
    }

    public function subtract(param1: class_73): class_73 {
        return new class_73(Number(this.x) - Number(param1.x), Number(this.y) - Number(param1.y), Number(this.z) - Number(param1.z));
    }

    public function get length(): Number {
        return class_266.sqrt(Number(this.x) * Number(this.x) + Number(this.y) * Number(this.y) + Number(this.z) * Number(this.z));
    }

    public function method_3137(): Point {
        return new Point(this.x, this.y);
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

    public function get z(): Number {
        return this._z;
    }

    public function set z(param1: Number): void {
        this._z = param1;
    }

    public function equals(param1: class_73): Boolean {
        return this.x == param1.x && this.y == param1.y && this.z == param1.z;
    }

    public function clone(): class_73 {
        return new class_73(this.x, this.y, this.z);
    }

    public function incrementBy(param1: class_73): void {
        this.x += param1.x;
        this.y += param1.y;
        this.z += param1.z;
    }

    public function method_3849(param1: Number, param2: Number, param3: Number = 0): Number {
        var _loc4_: Number = Number(this._x) - param1;
        var _loc5_: Number = Number(this._y) - param2;
        var _loc6_: Number = Number(this._z) - param3;
        return Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_);
    }
}
}
