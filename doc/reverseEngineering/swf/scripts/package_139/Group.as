package package_139 {

public class Group {

    public static const const_1241: int = 0;

    public static const const_3283: int = 1;

    public static const const_3160: int = 1;

    public static const const_1275: int = 2;

    public static const const_2217: int = 3;


    private var _id: int;

    private var var_3282: int;

    private var var_3637: int;

    private var var_19: int;

    private var var_4379: int;

    private var var_587: Vector.<class_1156>;

    private var var_1568: Boolean;

    private var var_4054: class_1156;

    public function Group() {
        this.var_587 = new Vector.<class_1156>();
        super();
    }

    public function method_6494(param1: int): class_1156 {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        while (_loc3_ < this.var_587.length) {
            if (this.var_587[_loc3_].id == param1) {
                _loc2_ = this.var_587[_loc3_];
            }
            _loc3_++;
        }
        return _loc2_;
    }

    public function method_281(param1: class_1156): void {
        this.method_2123(param1.id);
        this.var_587.push(param1);
        this.sort();
    }

    public function method_2123(param1: int): void {
        var _loc2_: int = 0;
        while (_loc2_ < this.var_587.length) {
            if (this.var_587[_loc2_].id == param1) {
                this.var_587.splice(_loc2_, 1);
                break;
            }
            _loc2_++;
        }
        this.sort();
    }

    public function init(param1: int, param2: int, param3: int, param4: int, param5: int): void {
        this._id = param1;
        this.var_3282 = param2;
        this.var_3637 = param3;
        this.var_19 = param4;
        this.var_4379 = param5;
    }

    public function get method_5475(): int {
        return this.var_3282;
    }

    public function set method_5475(param1: int): void {
        this.var_3282 = param1;
    }

    public function get method_445(): int {
        return this.var_3637;
    }

    public function get method_3852(): int {
        return this.var_19;
    }

    public function set method_3852(param1: int): void {
        this.var_19 = param1;
    }

    public function get method_5629(): int {
        return this.var_4379;
    }

    public function set method_5629(param1: int): void {
        this.var_4379 = param1;
    }

    public function get name_113(): Vector.<class_1156> {
        return this.var_587;
    }

    public function get method_3369(): Boolean {
        return this.var_1568;
    }

    public function set method_3369(param1: Boolean): void {
        this.var_1568 = param1;
        this.sort();
    }

    public function get id(): int {
        return this._id;
    }

    public function method_538(param1: int): void {
        if (this.var_4054) {
            if (this.var_4054.id != param1) {
                this.var_4054.var_2305 = false;
                this.method_1674(param1);
            }
        } else {
            this.method_1674(param1);
        }
    }

    private function method_1674(param1: int): void {
        this.var_4054 = this.method_6494(param1);
        if (this.var_4054) {
            this.var_4054.var_2305 = true;
        }
    }

    private function sort(): void {
        this.var_587.sort(this.method_6069);
    }

    private function method_6069(param1: class_1156, param2: class_1156): int {
        return !!param1.name_111 ? -1 : (!!param2.name_111 ? 1 : Number(param1.id) - Number(param2.id));
    }
}
}
