package package_279 {

import package_19.class_68;
import package_19.class_70;

public class class_2328 {

    public static const const_1588: uint = 3203878;

    public static const const_2547: uint = 33023;

    public static const const_2415: uint = 16776960;


    private var _width: Number = 50;

    private var _height: Number = 3;

    private var var_1229: uint = 33023;

    private var var_915: uint = 16776960;

    private var var_4498: uint = 3203878;

    public const changed: class_68 = new class_70();

    public function class_2328() {
        super();
    }

    public function get width(): Number {
        return this._width;
    }

    public function get height(): Number {
        return this._height;
    }

    public function get method_180(): uint {
        return this.var_1229;
    }

    public function get method_3762(): uint {
        return this.var_915;
    }

    public function get method_2541(): uint {
        return this.var_4498;
    }

    public function set width(param1: Number): void {
        if (this._width != param1) {
            this._width = param1;
            this.changed.dispatch();
        }
    }

    public function set height(param1: Number): void {
        if (this._height != param1) {
            this._height = param1;
            this.changed.dispatch();
        }
    }
}
}
