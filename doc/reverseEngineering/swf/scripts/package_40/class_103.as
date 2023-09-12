package package_40 {

public class class_103 {

    private static var _instance: class_103;


    private var var_3917: String;

    private var var_3698: Array;

    private var var_4765: int;

    private var _last: int;

    private var _targets: Array;

    public function class_103(param1: Function) {
        super();
        this.clear();
        this._targets = [];
        if (param1 !== method_336) {
            throw new Error("CommandLog is a Singleton and can only be accessed through CommandLog.instance");
        }
    }

    private static function method_336(): void {
    }

    public static function get instance(): class_103 {
        if (_instance == null) {
            _instance = new class_103(method_336);
        }
        return _instance;
    }

    public function addTarget(param1: class_210): void {
        var _loc2_: int = 0;
        while (_loc2_ < this._targets.length) {
            if (this._targets[_loc2_] == param1) {
                return;
            }
            _loc2_++;
        }
        param1.writeOutput(this.var_3917);
        this._targets.push(param1);
    }

    public function removeTarget(param1: class_210): void {
        var _loc2_: int = 0;
        while (_loc2_ < this._targets.length) {
            if (this._targets[_loc2_] == param1) {
                this._targets.splice(_loc2_, 1);
                return;
            }
            _loc2_++;
        }
    }

    public function write(param1: String): void {
        this.var_3917 += param1 + "\n";
        ++this._last;
        this.var_3698[this._last] = param1;
        var _loc2_: int = 0;
        while (_loc2_ < this._targets.length) {
            class_210(this._targets[_loc2_]).writeOutput(param1);
            _loc2_++;
        }
    }

    public function method_4328(): String {
        return this.var_3917;
    }

    public function method_4128(): String {
        if (this._last == -1 || this.var_3698[this._last] == null) {
            return "no Log Data";
        }
        return this.var_3698[this._last];
    }

    public function clear(): void {
        this.var_3917 = "";
        this.var_3698 = [];
        this.var_4765 = 500;
        this._last = -1;
    }

    public function passFullInCommand(param1: String): void {
        var _loc2_: int = 0;
        while (_loc2_ < this._targets.length) {
            class_210(this._targets[_loc2_]).passFullInCommand(param1);
            _loc2_++;
        }
    }
}
}
