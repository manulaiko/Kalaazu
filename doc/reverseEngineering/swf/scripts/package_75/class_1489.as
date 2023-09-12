package package_75 {

import package_35.Effect;
import package_35.class_338;

public class class_1489 extends Effect {


    private var _x: int;

    private var _y: int;

    private var var_2790: Vector.<String>;

    public function class_1489(param1: int, param2: int, param3: Vector.<String>) {
        super(class_338.const_2447, const_925, null);
        this._x = param1;
        this._y = param2;
        this.var_2790 = param3;
    }

    public function get x(): int {
        return this._x;
    }

    public function get y(): int {
        return this._y;
    }

    public function get patterns(): Vector.<String> {
        return this.var_2790;
    }
}
}
