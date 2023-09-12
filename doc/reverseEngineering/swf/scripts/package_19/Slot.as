package package_19 {

public class Slot implements class_263 {


    protected var var_4058: class_67;

    protected var _enabled: Boolean = true;

    protected var var_4919: Function;

    protected var var_309: Boolean = false;

    protected var var_1035: int = 0;

    protected var var_2793: Array;

    public function Slot(param1: Function, param2: class_67, param3: Boolean = false, param4: int = 0) {
        super();
        this.var_4919 = param1;
        this.var_309 = param3;
        this.var_4058 = param2;
        this.var_1035 = param4;
        this.method_1197(param1);
    }

    public function method_107(): void {
        if (!this._enabled) {
            return;
        }
        if (this.var_309) {
            this.remove();
        }
        if (Boolean(this.var_2793) && Boolean(this.var_2793.length)) {
            this.var_4919.apply(null, this.var_2793);
            return;
        }
        this.var_4919();
    }

    public function method_1201(param1: Object): void {
        if (!this._enabled) {
            return;
        }
        if (this.var_309) {
            this.remove();
        }
        if (Boolean(this.var_2793) && Boolean(this.var_2793.length)) {
            this.var_4919.apply(null, [param1].concat(this.var_2793));
            return;
        }
        this.var_4919(param1);
    }

    public function execute(param1: Array): void {
        if (!this._enabled) {
            return;
        }
        if (this.var_309) {
            this.remove();
        }
        if (Boolean(this.var_2793) && Boolean(this.var_2793.length)) {
            param1 = param1.concat(this.var_2793);
        }
        var _loc2_: int = param1.length;
        if (_loc2_ == 0) {
            this.var_4919();
        } else if (_loc2_ == 1) {
            this.var_4919(param1[0]);
        } else if (_loc2_ == 2) {
            this.var_4919(param1[0], param1[1]);
        } else if (_loc2_ == 3) {
            this.var_4919(param1[0], param1[1], param1[2]);
        } else {
            this.var_4919.apply(null, param1);
        }
    }

    public function get listener(): Function {
        return this.var_4919;
    }

    public function set listener(param1: Function): void {
        if (null == param1) {
            throw new ArgumentError("Given listener is null.\nDid you want to set enabled to false instead?");
        }
        this.method_1197(param1);
        this.var_4919 = param1;
    }

    public function get method_4132(): Boolean {
        return this.var_309;
    }

    public function get priority(): int {
        return this.var_1035;
    }

    public function toString(): String {
        return "[Slot listener: " + this.var_4919 + ", once: " + this.var_309 + ", priority: " + this.var_1035 + ", enabled: " + this._enabled + "]";
    }

    public function get enabled(): Boolean {
        return this._enabled;
    }

    public function set enabled(param1: Boolean): void {
        this._enabled = param1;
    }

    public function get params(): Array {
        return this.var_2793;
    }

    public function set params(param1: Array): void {
        this.var_2793 = param1;
    }

    public function remove(): void {
        this.var_4058.remove(this.var_4919);
    }

    protected function method_1197(param1: Function): void {
        if (null == param1) {
            throw new ArgumentError("Given listener is null.");
        }
        if (null == this.var_4058) {
            throw new Error("Internal signal reference has not been set yet.");
        }
    }
}
}
