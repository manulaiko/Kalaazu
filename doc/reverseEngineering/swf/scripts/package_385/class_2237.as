package package_385 {

public class class_2237 {


    private var var_3238: class_2493;

    private var var_4040: class_2493;

    private var var_2312: class_2493;

    private var var_4035: class_2493;

    private var var_1777: class_2493;

    private var var_3807: class_2493;

    private var var_1943: class_2493;

    protected var var_4830: uint;

    private var var_1429: uint;

    private var var_4395: uint;

    protected var var_2550: uint;

    private var var_4973: class_2251;

    private var var_4753: class_2251;

    protected var var_237: uint;

    protected var var_47: uint;

    private var var_1671: uint;

    private var var_1971: uint;

    private var var_3673: uint;

    private var _profile: String;

    public function class_2237(param1: String) {
        super();
        this._profile = param1;
    }

    public function reset(): void {
        var _loc1_: int = 0;
        this.var_3238 = new class_2493("ft", 8, false);
        this.var_4040 = new class_2493("vt", 8, false);
        this.var_2312 = new class_2493("v", 8);
        this.var_3807 = new class_2493("fs", 8);
        this.var_1943 = new class_2493("va", 8);
        this.var_4035 = new class_2493("fc", 28);
        this.var_1777 = new class_2493("vc", 128);
        this.var_4973 = new class_2251("oc", -1);
        this.var_4753 = new class_2251("op", -1);
        this.var_237 = 0;
        this.var_1671 = 0;
        this.var_1971 = 0;
        this.var_3673 = 0;
        this.var_47 = 0;
        _loc1_ = 0;
        while (_loc1_ < this.var_1429) {
            this.method_723();
            _loc1_++;
        }
        _loc1_ = 0;
        while (_loc1_ < this.var_4830) {
            this.method_5384();
            _loc1_++;
        }
        _loc1_ = 0;
        while (_loc1_ < this.var_4395) {
            this.method_5601();
            _loc1_++;
        }
        _loc1_ = 0;
        while (_loc1_ < this.var_2550) {
            this.method_1853();
            _loc1_++;
        }
    }

    public function dispose(): void {
        this.var_3238.dispose();
        this.var_4040.dispose();
        this.var_2312.dispose();
        this.var_4035.dispose();
        this.var_1943.dispose();
        this.var_3238 = null;
        this.var_4040 = null;
        this.var_2312 = null;
        this.var_4035 = null;
        this.var_1943 = null;
        this.var_4973 = null;
        this.var_4753 = null;
    }

    public function method_4539(param1: class_2251, param2: uint): void {
        this.var_3238.method_56(param1, param2);
    }

    public function method_771(param1: class_2251): void {
        this.var_3238.method_3188(param1);
    }

    public function method_588(param1: class_2251, param2: uint): void {
        this.var_4040.method_56(param1, param2);
    }

    public function method_5694(param1: class_2251): void {
        this.var_4040.method_3188(param1);
    }

    public function method_4834(): class_2251 {
        return this.var_3238.method_2312();
    }

    public function method_4883(): class_2251 {
        return this.var_3238.method_2117();
    }

    public function method_5601(): class_2251 {
        var _loc1_: class_2251 = this.var_2312.method_2312();
        ++this.var_3673;
        return _loc1_;
    }

    public function method_1853(): class_2251 {
        var _loc1_: class_2251 = this.var_4035.method_2312();
        ++this.var_47;
        return _loc1_;
    }

    public function method_5384(): class_2251 {
        var _loc1_: class_2251 = this.var_1777.method_2312();
        ++this.var_237;
        return _loc1_;
    }

    public function method_3118(): class_2251 {
        return this.var_4040.method_2312();
    }

    public function method_2395(): class_2251 {
        return this.var_4040.method_2117();
    }

    public function method_723(): class_2251 {
        var _loc1_: class_2251 = this.var_1943.method_2312();
        ++this.var_1671;
        return _loc1_;
    }

    public function method_3238(): class_2251 {
        var _loc1_: class_2251 = this.var_3807.method_2312();
        ++this.var_1971;
        return _loc1_;
    }

    public function get method_3046(): uint {
        return this.var_4830;
    }

    public function set method_3046(param1: uint): void {
        this.var_4830 = param1;
    }

    public function get method_4542(): uint {
        return this.var_1429;
    }

    public function set method_4542(param1: uint): void {
        this.var_1429 = param1;
    }

    public function get method_6239(): uint {
        return this.var_4395;
    }

    public function set method_6239(param1: uint): void {
        this.var_4395 = param1;
    }

    public function get method_2599(): uint {
        return this.var_2550;
    }

    public function set method_2599(param1: uint): void {
        this.var_2550 = param1;
    }

    public function get method_5810(): class_2251 {
        return this.var_4973;
    }

    public function get method_1025(): uint {
        return this.var_237;
    }

    public function get method_6441(): uint {
        return this.var_47;
    }

    public function get method_1035(): uint {
        return this.var_1671;
    }

    public function get method_5678(): uint {
        return this.var_1971;
    }

    public function get method_5243(): uint {
        return this.var_3673;
    }
}
}
