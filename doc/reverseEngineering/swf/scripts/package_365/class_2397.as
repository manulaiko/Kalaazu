package package_365 {

import flash.utils.clearTimeout;
import flash.utils.setTimeout;

import package_19.class_68;
import package_19.class_70;

public class class_2397 {


    public const used: class_68 = new class_70();

    public const const_2704: class_68 = new class_70();

    private var _target: Object;

    private var var_1310: int = 0;

    private var var_356: Boolean = false;

    private var var_378: Number = 0;

    private var var_2845: uint;

    public function class_2397(param1: Object, param2: Number = 0) {
        super();
        this._target = param1;
        this.var_378 = param2;
    }

    public function method_5231(): void {
        ++this.var_1310;
        clearTimeout(this.var_2845);
        if (!this.var_356) {
            this.var_356 = true;
            this.used.dispatch(this._target);
        }
    }

    public function method_5124(): void {
        --this.var_1310;
        if (this.var_1310 <= 0) {
            this.var_1310 = 0;
            if (this.var_356) {
                this.var_356 = false;
                clearTimeout(this.var_2845);
                if (this.var_378 > 0) {
                    this.var_2845 = setTimeout(this.const_2704.dispatch, Number(this.var_378) * 1000, this._target);
                } else {
                    this.const_2704.dispatch(this._target);
                }
            }
        }
    }

    public function dispose(): void {
        clearTimeout(this.var_2845);
        this.var_1310 = 0;
        this.var_356 = false;
    }

    public function get counter(): int {
        return this.var_1310;
    }
}
}
