package package_22 {

import flash.utils.Dictionary;

public class class_1068 {


    private var _type: String;

    private var var_1641: Dictionary;

    public function class_1068(param1: String, param2: Dictionary) {
        super();
        this.var_1641 = param2;
        this._type = param1;
    }

    public function get type(): String {
        return this._type;
    }

    public function method_6207(param1: int): String {
        return this.var_1641[param1] || this.var_1641[0] || this.var_1641[1] || this.method_1722;
    }

    private function get method_1722(): String {
        var _loc1_: * = null;
        var _loc2_: int = 0;
        var _loc3_: * = this.var_1641;
        for (_loc1_ in _loc3_) {
            return this.var_1641[_loc1_];
        }
        return null;
    }
}
}
