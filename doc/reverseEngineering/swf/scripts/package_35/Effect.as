package package_35 {

import avmplus.getQualifiedClassName;

import flash.utils.clearTimeout;
import flash.utils.setTimeout;

import package_22.class_198;
import package_22.class_339;

import package_9.class_50;

public class Effect {

    public static const const_925: int = 0;

    public static const const_2311: int = 1;

    public static const const_2856: int = 2;


    private var var_1873: uint = 0;

    private var _id: int;

    private var _type: int = 0;

    private var var_1375: class_339;

    private var var_4141: Number;

    protected var var_1367: uint = 0;

    public function Effect(param1: int, param2: int, param3: class_339 = null) {
        super();
        this._id = param1;
        this._type = param2;
        this.var_1375 = param3 || class_198.var_1616[param1];
    }

    public function get id(): int {
        return this._id;
    }

    public function set id(param1: int): void {
        this._id = param1;
    }

    public function get type(): int {
        return this._type;
    }

    public function get pattern(): class_339 {
        return this.var_1375;
    }

    public function set pattern(param1: class_339): void {
        this.var_1375 = param1;
    }

    public function get method_2711(): Number {
        return this.var_4141;
    }

    public function set method_2711(param1: Number): void {
        this.var_4141 = param1;
    }

    public function get method_4512(): uint {
        return this.var_1367;
    }

    public function get method_1664(): Boolean {
        return this._type == const_2311;
    }

    public function get timeout(): Boolean {
        return this._type == const_2856;
    }

    public function activate(): Boolean {
        if (this.timeout) {
            this.method_864();
        }
        return true;
    }

    public function method_5571(param1: Effect): void {
        if (this.timeout) {
            this.method_864();
        }
    }

    public function deactivate(): void {
        clearTimeout(this.var_1873);
    }

    public function isValid(): Boolean {
        return true;
    }

    public function toString(): String {
        var _loc1_: String = getQualifiedClassName(this);
        _loc1_ = _loc1_.substr(_loc1_.lastIndexOf("::") + 2);
        return _loc1_ + " id: " + this.id + " - type: " + (!!this.method_1664 ? "persistant" : (!!this.timeout ? "timeout" : "notPersistant"));
    }

    private function method_864(): void {
        clearTimeout(this.var_1873);
        this.var_1873 = setTimeout(this.method_1926, this.var_4141);
    }

    private function method_1926(): void {
        class_50.getInstance().map.effects.method_1847(this);
    }

    public function get method_5314(): Boolean {
        return false;
    }
}
}
