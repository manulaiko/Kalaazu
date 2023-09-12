package package_116 {

import package_22.class_198;

public class class_1178 {


    private var _index: int;

    private var _type: int;

    private var var_3181: int;

    private var _level: int;

    private var var_1375: class_1077;

    public function class_1178(param1: int, param2: int, param3: int, param4: int, param5: class_1077 = null) {
        super();
        this._index = param1;
        this._type = param2;
        this.var_3181 = param3;
        this._level = param4;
        this.var_1375 = param5 || class_198.method_3169(param2, param3, param4);
    }

    public function get index(): int {
        return this._index;
    }

    public function get type(): int {
        return this._type;
    }

    public function get design(): int {
        return this.var_3181;
    }

    public function get level(): int {
        return this._level;
    }

    public function get pattern(): class_1077 {
        return this.var_1375;
    }
}
}
