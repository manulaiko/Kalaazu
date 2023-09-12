package package_65 {

public class class_233 {


    private var var_4911: Array;

    private var var_2801: Array;

    private var var_2216: int;

    private var var_1934: int;

    public function class_233() {
        super();
        this.var_4911 = [];
        this.var_2801 = [];
        this.var_2216 = 0;
        this.var_1934 = 0;
    }

    public function method_2703(param1: int): class_203 {
        if (this.var_4911[param1] != undefined) {
            return this.var_4911[param1];
        }
        return null;
    }

    public function method_6351(param1: class_203, param2: int): void {
        if (this.var_4911[param2] == undefined) {
            this.var_4911[param2] = param1;
            this.var_2801.push(param2);
            ++this.var_2216;
        } else if (param1.running) {
            (this.var_4911[param2] as class_203).running = true;
            param1.method_768(false);
            (this.var_4911[param2] as class_203).method_768(param1.running);
        }
    }

    public function method_4262(param1: int): void {
        var _loc2_: int = 0;
        if (this.var_4911[param1] is class_203) {
            delete this.var_4911[param1];
            _loc2_ = int(this.var_2801.indexOf(param1));
            this.var_2801.splice(_loc2_, 1);
            --this.var_2216;
        }
    }

    public function method_201(): int {
        var _loc1_: int = 0;
        for each(_loc1_ in this.var_2801) {
            if (this.var_4911[_loc1_] != undefined && Boolean((this.var_4911[_loc1_] as class_203).running)) {
                return _loc1_;
            }
        }
        return -1;
    }

    public function method_5524(param1: int): int {
        var _loc3_: * = null;
        var _loc2_: int = -1;
        for each(_loc3_ in this.var_4911) {
            if (_loc3_.method_3950[param1] != null) {
                _loc2_ = int(_loc3_.id);
            }
        }
        return _loc2_;
    }

    public function get method_5713(): int {
        return this.var_1934;
    }

    public function set method_5713(param1: int): void {
        this.var_1934 = param1;
    }

    public function get method_1512(): int {
        return this.var_2216;
    }
}
}
