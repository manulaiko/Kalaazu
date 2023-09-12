package package_65 {

import package_38.class_861;

public class class_203 {


    private var _id: uint;

    private var var_1926: Vector.<class_861>;

    private var _type: class_1096;

    private var var_1187: class_1093;

    private var var_1195: Array;

    private var _category: String = "std";

    private var _rewards: Array;

    private var _running: Boolean;

    private var var_328: String;

    private var var_3195: String;

    private var _title: String;

    private var _description: String;

    public function class_203(param1: uint, param2: class_1093, param3: Array, param4: Boolean, param5: String, param6: String) {
        this._type = new class_1096();
        this.var_1195 = [];
        super();
        this._id = param1;
        this.var_1187 = param2;
        this._rewards = param3;
        this._running = param4;
        this.var_328 = param5;
        this.var_3195 = param6;
    }

    public function get id(): uint {
        return this._id;
    }

    public function method_2655(param1: int, param2: int, param3: Boolean, param4: Boolean): void {
        this.var_1187.updateCondtition(param1, param2, param3, param4);
    }

    public function method_2963(): class_1093 {
        return this.var_1187;
    }

    public function get category(): String {
        return this._category;
    }

    public function set category(param1: String): void {
        this._category = param1;
    }

    public function get method_3950(): Array {
        return this.var_1195;
    }

    public function set method_3950(param1: Array): void {
        this.var_1195 = param1;
    }

    public function get title(): String {
        if (!this._title) {
            this._title = class_1094.method_5673(this.id, this.var_3195, this.type);
        }
        return this._title;
    }

    public function get description(): String {
        if (!this._description) {
            this._description = class_1094.method_3606(this.id, this.var_3195, this.type);
        }
        return this._description;
    }

    public function get rewards(): Array {
        return this._rewards;
    }

    public function set name_160(param1: Vector.<class_861>): void {
        this.var_1926 = param1;
        this._type.init(this.var_1926);
        if (this._id == 10000) {
            this._type.setType(class_1096.const_1484);
        }
    }

    public function get type(): class_1096 {
        return this._type;
    }

    public function method_768(param1: Boolean): void {
        this.method_4638(param1, this.method_3950);
    }

    private function method_4638(param1: Boolean, param2: Array): void {
        var _loc3_: * = null;
        for each(_loc3_ in param2) {
            _loc3_.questIsRunning = param1;
            if (_loc3_.children) {
                this.method_4638(param1, _loc3_.children);
            }
        }
    }

    public function get running(): Boolean {
        return this._running;
    }

    public function set running(param1: Boolean): void {
        this._running = param1;
    }

    public function get name_19(): String {
        return this.var_328;
    }
}
}
