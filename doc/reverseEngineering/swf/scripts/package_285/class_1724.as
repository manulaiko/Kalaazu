package package_285 {

import flash.filters.BlurFilter;

import package_283.class_1710;
import package_283.class_1715;

public class class_1724 implements class_1710, class_1715 {


    protected var var_855: BlurFilter;

    public function class_1724(param1: Number = 4, param2: Number = 4, param3: int = 1) {
        super();
        this.var_855 = new BlurFilter(param1, param2, param3);
    }

    public function set blurX(param1: Number): void {
        this.var_855.blurX = param1;
    }

    public function set blurY(param1: Number): void {
        this.var_855.blurY = param1;
    }

    public function get blurX(): Number {
        return this.var_855.blurX;
    }

    public function get blurY(): Number {
        return this.var_855.blurY;
    }

    public function get filter(): Object {
        return this.var_855;
    }
}
}
