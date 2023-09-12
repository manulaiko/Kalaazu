package package_442 {

public class class_2447 {


    private var _x: Number;

    private var _y: Number;

    private var _z: Number;

    private var _index: uint;

    public function class_2447(param1: Number = 0, param2: Number = 0, param3: Number = 0, param4: uint = 0) {
        super();
        this._x = param1;
        this._y = param2;
        this._z = param3;
        this._index = param4;
    }

    public function set index(param1: uint): void {
        this._index = param1;
    }

    public function get index(): uint {
        return this._index;
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

    public function clone(): class_2447 {
        return new class_2447(this._x, this._y, this._z);
    }

    public function toString(): String {
        return this._x + "," + this._y + "," + this._z;
    }
}
}
