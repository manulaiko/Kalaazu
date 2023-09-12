package package_285 {

import flash.filters.GlowFilter;

import package_283.class_1711;
import package_283.class_1715;

public class class_1723 implements class_1711, class_1715 {


    private var var_855: GlowFilter;

    public function class_1723(param1: uint = 16711680, param2: Number = 1, param3: Number = 6, param4: Number = 6, param5: Number = 2, param6: int = 1, param7: Boolean = false, param8: Boolean = false) {
        super();
        this.var_855 = new GlowFilter(param1, param2, param3, param4, param5, param6, param7, param8);
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

    public function set color(param1: uint): void {
        this.var_855.color = param1;
    }

    public function get color(): uint {
        return this.var_855.color;
    }

    public function set alpha(param1: Number): void {
        this.var_855.alpha = param1;
    }

    public function get alpha(): Number {
        return this.var_855.alpha;
    }

    public function set strength(param1: Number): void {
        this.var_855.strength = param1;
    }

    public function get strength(): Number {
        return this.var_855.strength;
    }

    public function get filter(): Object {
        return this.var_855;
    }
}
}
