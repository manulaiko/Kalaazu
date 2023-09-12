package package_163 {

public class class_1017 {


    private var _min: int = 0;

    private var _max: int = 0;

    private var var_4791: int = 0;

    public function class_1017(param1: int, param2: int, param3: int) {
        super();
        this._min = param1;
        this._max = param2;
        this.var_4791 = param3;
    }

    public function get min(): int {
        return this._min;
    }

    public function get max(): int {
        return this._max;
    }

    public function get increment(): int {
        return this.var_4791;
    }

    public function get method_1398(): int {
        return int(this._min + (Number(this._max) - Number(this._min)) / 2);
    }
}
}
