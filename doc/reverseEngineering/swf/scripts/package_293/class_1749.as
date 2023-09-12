package package_293 {

import flash.events.EventDispatcher;

import package_199.class_2123;

public class class_1749 extends EventDispatcher {

    public static const const_2887: String = "default";


    private var var_2251: String;

    private var var_790: String;

    private var _name: String;

    private var _id: String;

    private var var_3899: Array;

    public function class_1749(param1: String = null) {
        super();
        if (param1 == null) {
            param1 = "null";
        }
        this._name = param1;
        this.var_2251 = param1;
        this.method_2287();
    }

    public function get method_6100(): String {
        return this.var_2251;
    }

    public function get id(): String {
        return this._id;
    }

    public function set id(param1: String): void {
        this._id = param1;
    }

    public function get name(): String {
        return this._name;
    }

    public function set name(param1: String): void {
        var _loc2_: * = null;
        _loc2_ = this._name;
        this._name = param1;
        if (this._name == null) {
            this._name = "null";
        }
        this.method_2287();
        if (hasEventListener(class_2123.const_2616)) {
            dispatchEvent(new class_2123(class_2123.const_2616, class_1751(this), _loc2_));
        }
    }

    public function get method_2094(): String {
        return this.var_790;
    }

    public function get method_915(): Array {
        return this.var_3899;
    }

    public function method_3923(param1: String, param2: String): Boolean {
        return this._name == param1 && (!param2 || this.var_790 == param2);
    }

    public function method_4647(param1: String, param2: String = null, param3: Boolean = true): void {
        this._name = !!param1 ? param1 : "null";
        this.var_790 = !!param2 ? param2 : const_2887;
        if (param3) {
            this.var_2251 = this._name;
        }
        this.method_2287();
    }

    private function method_2287(): void {
        this.var_3899 = [this.var_790, this._name];
    }
}
}
