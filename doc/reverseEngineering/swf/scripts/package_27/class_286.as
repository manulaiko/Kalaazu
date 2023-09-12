package package_27 {

import package_22.class_168;

public class class_286 extends class_168 {


    private var loop: Boolean;

    private var volume: Number = 1;

    private var var_3824: String;

    private var _interval: Number;

    private var var_4814: int = 0;

    private var var_1868: Boolean = false;

    public function class_286(param1: int, param2: String = null) {
        super(param1, null);
        this.var_3824 = param2;
    }

    public function method_2096(): Boolean {
        return this.loop;
    }

    public function method_1104(param1: Boolean): void {
        this.loop = param1;
    }

    public function isVoice(): Boolean {
        return this.var_1868;
    }

    public function method_1753(param1: Boolean): void {
        this.var_1868 = param1;
    }

    public function method_1088(): Number {
        return this.volume;
    }

    public function method_1533(param1: Number): void {
        this.volume = param1;
    }

    public function get soundbank(): String {
        return this.var_3824;
    }

    public function get interval(): Number {
        return this._interval;
    }

    public function set interval(param1: Number): void {
        this._interval = param1 * 1000;
    }

    public function get intervalFluctuation(): int {
        return this.var_4814;
    }

    public function set intervalFluctuation(param1: int): void {
        this.var_4814 = param1 * 1000;
    }
}
}
