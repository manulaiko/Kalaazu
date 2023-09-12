package package_65 {

public class class_1093 implements class_1092 {


    public var id: uint;

    private var _conditions: Array;

    private var var_1837: Array;

    private var _active: Boolean;

    private var var_3030: Boolean;

    private var var_1205: Boolean;

    private var var_734: uint = 0;

    private var var_3398: String;

    private var _children: Array;

    private var var_2169: int;

    private var _completed: Boolean;

    private var var_839: Boolean = true;

    public function class_1093() {
        this._conditions = [];
        this._children = [];
        super();
    }

    public function updateCondtition(param1: int, param2: int, param3: Boolean, param4: Boolean): Boolean {
        var _loc6_: * = undefined;
        var _loc5_: int = 0;
        while (_loc5_ < this.children.length) {
            if ((_loc6_ = this.children[_loc5_]) != null) {
                if (_loc6_ is class_1093) {
                    if (class_1093(_loc6_).updateCondtition(param1, param2, param3, param4)) {
                        return true;
                    }
                } else if (class_236(_loc6_).updateCondtition(param1, param2, param3, param4)) {
                    return true;
                }
            }
            _loc5_++;
        }
        return false;
    }

    public function toTextTree(): String {
        this.var_3398 = "Case " + this.id + "\n";
        var _loc1_: int = 0;
        while (_loc1_ < this._children.length) {
            if (this._children[_loc1_] != null) {
                this.var_3398 += this._children[_loc1_].toTextTree();
            }
            _loc1_++;
        }
        return this.var_3398;
    }

    public function get conditions(): Array {
        return this._conditions;
    }

    public function get method_702(): Array {
        return this.var_1837;
    }

    public function get active(): Boolean {
        return this._active;
    }

    public function set active(param1: Boolean): void {
        this._active = param1;
    }

    public function get name_62(): Boolean {
        return this.var_3030;
    }

    public function set name_62(param1: Boolean): void {
        this.var_3030 = param1;
    }

    public function get ordered(): Boolean {
        return this.var_1205;
    }

    public function set ordered(param1: Boolean): void {
        this.var_1205 = param1;
    }

    public function get method_1918(): uint {
        return this.var_734;
    }

    public function set method_1918(param1: uint): void {
        this.var_734 = param1;
    }

    public function method_1324(param1: class_1093, param2: uint): void {
        if (this.var_1837 == null) {
            this.var_1837 = [];
        }
        this.var_1837[param2] = param1;
        if (param1.name_62) {
            ++this.var_2169;
        }
        this.method_6138(param1);
    }

    public function method_4029(param1: class_1093): void {
        if (this.var_1837 == null) {
            this.var_1837 = [];
        }
        this.method_1324(param1, this.var_1837.length);
    }

    public function method_3964(param1: class_236, param2: uint): void {
        if (this._conditions == null) {
            this._conditions = [];
        }
        if (param1.name_62) {
            ++this.var_2169;
        }
        this._conditions[param2] = param1;
        this.method_6138(param1);
    }

    private function method_6138(param1: *): void {
        this._children.push(param1);
    }

    public function method_242(param1: class_236): void {
        if (this._conditions == null) {
            this._conditions = [];
        }
        this.method_3964(param1, this._conditions.length);
    }

    public function get children(): Array {
        return this._children;
    }

    public function get method_3320(): int {
        return this.var_2169;
    }

    public function get completed(): Boolean {
        return this._completed;
    }

    public function set completed(param1: Boolean): void {
        this._completed = param1;
    }

    public function set method_3882(param1: Boolean): void {
        this.var_839 = param1;
    }

    public function get method_3882(): Boolean {
        return this.var_839;
    }
}
}
