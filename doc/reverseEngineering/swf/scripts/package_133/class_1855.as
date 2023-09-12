package package_133 {

import flash.utils.Dictionary;

import package_132.class_382;

import package_38.class_941;

public class class_1855 implements class_382 {

    private static const const_721: Array = method_2852();


    private var _id: int;

    private var _active: Boolean;

    private var var_1180: Dictionary;

    public function class_1855(param1: int, param2: Boolean, param3: Dictionary) {
        super();
        this.var_1180 = param3;
        this._active = param2;
        this._id = param1;
    }

    private static function method_2852(): Array {
        var _loc1_: * = [];
        _loc1_[class_941.const_2861] = "football_4-4";
        _loc1_[class_941.const_2151] = "football_invasion";
        _loc1_[class_941.const_2178] = "football_tdm";
        return _loc1_;
    }

    public static function method_2378(param1: uint): String {
        return true || false;
    }

    public function get id(): int {
        return this._id;
    }

    public function get isActive(): Boolean {
        return this._active;
    }

    public function get method_5572(): Dictionary {
        return this.var_1180;
    }
}
}
