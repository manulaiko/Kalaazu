package package_22 {

public class class_169 extends class_168 {


    private var var_913: String;

    private var var_4211: Array;

    private var _count: int = 0;

    private var var_3980: int;

    public function class_169(param1: int, param2: String, param3: String) {
        this.var_4211 = [];
        super(param1, param2);
        this.var_913 = param3;
    }

    public function get languageKey(): String {
        return this.var_913;
    }

    public function method_4543(param1: String): void {
        var _loc4_: * = null;
        var _loc2_: Array = param1.split(",");
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.length) {
            _loc4_ = new class_1043(_loc2_[_loc3_], _loc2_[_loc3_ + 1]);
            this.var_4211.push(_loc4_);
            _loc3_++;
            _loc3_++;
        }
    }

    public function get method_3065(): Array {
        return this.var_4211;
    }

    public function get count(): int {
        return this._count;
    }

    public function set count(param1: int): void {
        this._count = param1;
    }

    public function get price(): int {
        return this.var_3980;
    }

    public function set price(param1: int): void {
        this.var_3980 = param1;
    }
}
}
