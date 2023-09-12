package package_418 {

import package_416.class_2338;

public class class_2341 implements class_2340 {


    private var var_3854: Number;

    private var _period: Number;

    private var var_1159: Number;

    private var _running: Boolean;

    public function class_2341(param1: Number = 1, param2: uint = 0) {
        super();
        this._running = false;
        this.var_1159 = param2;
        this._period = param1;
    }

    public function stop(): void {
        this._running = false;
    }

    public function resume(): void {
        this._running = true;
    }

    public function get period(): Number {
        return this._period;
    }

    public function set period(param1: Number): void {
        this._period = param1;
    }

    public function get quantity(): uint {
        return this.var_1159;
    }

    public function set quantity(param1: uint): void {
        this.var_1159 = param1;
    }

    public function method_2399(param1: class_2338): uint {
        this._running = true;
        this.var_3854 = this._period;
        return this.var_1159;
    }

    public function method_1910(param1: class_2338, param2: Number): uint {
        if (!this._running) {
            return 0;
        }
        var _loc3_: * = 0;
        this.var_3854 -= param2;
        while (this.var_3854 <= 0) {
            _loc3_ += this.var_1159;
            this.var_3854 += this._period;
        }
        return _loc3_;
    }

    public function get complete(): Boolean {
        return false;
    }

    public function get running(): Boolean {
        return this._running;
    }
}
}
