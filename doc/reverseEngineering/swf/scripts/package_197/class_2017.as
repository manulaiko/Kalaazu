package package_197 {

import com.bigpoint.utils.class_73;

public class class_2017 {


    private var _blendMode: String;

    private var var_590: int;

    private var _id: int;

    private var var_727: class_73;

    private var var_4695: Boolean;

    public function class_2017(param1: int, param2: int, param3: class_73, param4: Boolean, param5: String = null) {
        super();
        this._id = param1;
        this.var_590 = param2;
        this.var_727 = param3;
        this.var_4695 = param4;
        this._blendMode = param5;
    }

    public function get typeID(): int {
        return this.var_590;
    }

    public function get id(): int {
        return this._id;
    }

    public function get method_960(): class_73 {
        return this.var_727;
    }

    public function get method_1851(): Boolean {
        return this.var_4695;
    }

    public function get blendMode(): String {
        return this._blendMode;
    }
}
}
