package package_133 {

import package_132.class_382;

public class class_383 implements class_382 {


    private var var_2837: int;

    private var _type: uint;

    private var _active: Boolean;

    public function class_383(param1: uint, param2: Boolean, param3: uint) {
        super();
        this._active = param2;
        this._type = param1;
        this.var_2837 = param3;
    }

    public function get id(): int {
        return this._type;
    }

    public function get isActive(): Boolean {
        return this._active;
    }

    public function get method_3098(): int {
        return this.var_2837;
    }
}
}
