package package_321 {

public class class_2270 {


    private var _faction: String;

    private var var_135: Number = 0;

    private var var_2840: Number = 0;

    private var var_220: Boolean;

    public function class_2270(param1: String, param2: Number, param3: Number, param4: Boolean) {
        super();
        this.var_2840 = param3;
        this.var_135 = param2;
        this._faction = param1;
        this.var_220 = param4;
    }

    public function get faction(): String {
        return this._faction;
    }

    public function get score(): Number {
        return this.var_135;
    }

    public function get name_48(): Number {
        return this.var_2840;
    }

    public function get method_261(): Boolean {
        return this.var_220;
    }

    public function set faction(param1: String): void {
        this._faction = param1;
    }

    public function set score(param1: Number): void {
        this.var_135 = param1;
    }

    public function set name_48(param1: Number): void {
        this.var_2840 = param1;
    }

    public function set method_261(param1: Boolean): void {
        this.var_220 = param1;
    }
}
}
