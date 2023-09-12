package package_120 {

import flash.geom.Point;

public class class_1194 {


    private var _position: Point;

    private var var_126: int;

    private var var_2635: Boolean;

    public function class_1194(param1: Point, param2: int, param3: Boolean) {
        super();
        this.var_2635 = param3;
        this.var_126 = param2;
        this._position = param1;
    }

    public function get position(): Point {
        return this._position;
    }

    public function get radius(): int {
        return this.var_126;
    }

    public function method_4376(param1: Point, param2: Boolean = true): Point {
        return param2 ? this._position.subtract(param1) : param1.subtract(this._position);
    }

    public function get name_149(): Boolean {
        return this.var_2635;
    }
}
}
