package package_75 {

import package_29.class_85;

import package_35.class_338;
import package_35.class_348;

public class class_1838 extends class_348 {


    private var _type: uint = 0;

    private var _target: class_85;

    private var var_4216: int = 0;

    public function class_1838(param1: class_85, param2: class_85, param3: uint, param4: int) {
        super(class_338.const_2837, param1, const_925, null);
        this._target = param2;
        this.var_4216 = param4;
        this._type = param3;
    }

    public function get target(): class_85 {
        return this._target;
    }

    public function get name_36(): int {
        return this.var_4216;
    }

    public function get method_1007(): uint {
        return this._type;
    }

    override public function isValid(): Boolean {
        return super.isValid() && this._target != null;
    }
}
}
