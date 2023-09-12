package package_355 {

import com.bigpoint.utils.class_73;

import package_10.class_305;

import package_29.class_85;

import package_9.class_50;

public class class_2329 {


    private var var_759: Array;

    private var var_4357: Vector.<class_305>;

    private var var_1231: class_85;

    private var var_3383: int;

    private var var_804: class_73;

    public function class_2329(param1: Array, param2: class_85) {
        this.var_4357 = new Vector.<class_305>();
        super();
        this.var_1231 = param2;
        this.var_759 = param1;
        this.method_3199();
    }

    private function method_3199(): void {
        var _loc3_: * = null;
        var _loc1_: int = int(this.var_759.length);
        var _loc2_: int = 0;
        while (_loc2_ < _loc1_) {
            _loc3_ = class_50.getInstance().map.method_327(this.var_759[_loc2_]);
            if (_loc3_) {
                this.var_4357.push(_loc3_.position);
            }
            _loc2_++;
        }
        this.var_804 = !!this.var_1231 ? this.var_1231.position : new class_73();
    }

    public function get name_79(): Vector.<class_305> {
        return this.var_4357;
    }

    public function get name_133(): int {
        return this.var_3383;
    }

    public function get method_4231(): class_73 {
        return this.var_804;
    }
}
}
