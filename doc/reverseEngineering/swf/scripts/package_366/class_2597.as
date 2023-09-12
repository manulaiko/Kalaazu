package package_366 {

import away3d.arcane;

import package_294.class_2591;

import package_437.class_2592;

import package_466.class_2595;

import package_480.class_2693;

public class class_2597 extends class_2108 {


    private var var_4674: class_2693;

    public function class_2597() {
        super();
    }

    public static function supportsType(param1: String): Boolean {
        param1 = param1.toLowerCase();
        return param1 == "pag";
    }

    public static function supportsData(param1: *): Boolean {
        return false;
    }

    public function get method_3651(): class_2591 {
        return this.var_4674.method_3651;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = undefined;
        var _loc3_: * = null;
        if (var_117) {
            _loc1_ = _data.assembler.data;
            _loc2_ = _data.assembler.id;
            _loc3_ = class_2592.method_6525(_loc2_, class_2595.const_2892);
            if (!_loc3_) {
                method_444("Unknown geometry assembler");
            }
            this.var_4674 = new _loc3_();
            method_4558(this.var_4674);
            this.var_4674.method_5169(_loc1_);
        }
        return super.method_196();
    }
}
}
