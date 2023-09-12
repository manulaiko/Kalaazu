package package_361 {

import package_22.class_1065;
import package_22.class_198;

public class class_2094 extends class_2089 {


    private var _rotation: int;

    private var var_590: int;

    private var _x: int;

    private var _y: int;

    public function class_2094(param1: int, param2: int, param3: int, param4: int, param5: Number, param6: int) {
        super(param6, param5);
        this.var_590 = param1;
        this._x = param2 * 10;
        this._y = param3 * 10;
        this._rotation = param4;
    }

    public function get rotation(): int {
        return this._rotation;
    }

    public function get pattern(): class_1065 {
        return class_198.var_4738[this.var_590];
    }

    public function get typeID(): int {
        return this.var_590;
    }

    public function get x(): int {
        return this._x;
    }

    public function get y(): int {
        return this._y;
    }
}
}
