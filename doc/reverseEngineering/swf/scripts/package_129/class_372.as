package package_129 {

import package_22.class_339;

import package_29.class_85;

import package_35.class_348;

public class class_372 extends class_348 {


    private var var_1329: uint;

    private var var_975: Boolean;

    private var _color: uint;

    private var name_97: Number = 1.5;

    private var var_1200: Number = 0;

    public function class_372(param1: int, param2: class_85, param3: uint = 16777215, param4: uint = 20, param5: Boolean = true, param6: class_339 = null, param7: int = -1) {
        super(param1, param2, const_2311, param6, param7);
        this._color = param3;
        this.var_1329 = param4;
        this.var_975 = param5;
    }

    public function get glowStrength(): Number {
        return this.name_97;
    }

    public function set glowStrength(param1: Number): void {
        this.name_97 = param1;
    }

    public function get method_701(): Number {
        return this.var_1200;
    }

    public function set method_701(param1: Number): void {
        this.var_1200 = param1;
    }

    public function get color(): uint {
        return this._color;
    }

    public function get method_1784(): uint {
        return this.var_1329;
    }

    public function get method_5518(): Boolean {
        return this.var_975;
    }
}
}
