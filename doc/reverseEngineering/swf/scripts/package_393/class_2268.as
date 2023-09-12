package package_393 {

import package_317.class_2515;

public class class_2268 {


    private var var_1899: class_2267;

    private var var_113: class_2267;

    private var var_123: class_2267;

    private var _list: Vector.<class_2267>;

    private var var_3877: class_2516;

    public function class_2268() {
        this.var_1899 = new class_2267(class_2515.MMO, 0, 0, true);
        this.var_113 = new class_2267(class_2515.EIC, 0, 0, false);
        this.var_123 = new class_2267(class_2515.VRU, 0, 0, false);
        this._list = new <class_2267>[this.var_1899, this.var_113, this.var_123];
        this.var_3877 = new class_2516();
        super();
    }

    public function get list(): Vector.<class_2267> {
        return this._list;
    }

    public function set name_107(param1: Number): void {
        this.var_1899.score = param1;
        this.method_1293();
        this.method_4048();
    }

    public function set name_139(param1: Number): void {
        this.var_113.score = param1;
        this.method_1293();
        this.method_4048();
    }

    public function set name_27(param1: Number): void {
        this.var_123.score = param1;
        this.method_1293();
        this.method_4048();
    }

    private function method_4048(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this._list) {
            _loc1_.method_261 = _loc1_.score == _loc1_.name_48;
        }
    }

    private function method_1293(): void {
        var _loc2_: * = null;
        var _loc1_: int = Math.max(this.var_1899.score, this.var_113.score, this.var_123.score);
        for each(_loc2_ in this._list) {
            _loc2_.name_48 = _loc1_;
        }
    }

    public function get method_644(): class_2516 {
        return this.var_3877;
    }
}
}
