package package_285 {

import flash.filters.DropShadowFilter;

import package_283.class_1715;
import package_283.class_1725;

public class class_1726 implements class_1725, class_1715 {


    private var var_855: DropShadowFilter;

    public function class_1726(param1: Number = 4, param2: Number = 45, param3: uint = 0, param4: Number = 1, param5: Number = 4, param6: Number = 4, param7: Number = 1) {
        super();
        this.var_855 = new DropShadowFilter(param1, param2, param3, param4, param5, param6, param7);
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

    public function get distance(): Number {
        return this.var_855.distance;
    }

    public function set distance(param1: Number): void {
        this.var_855.distance = param1;
    }

    public function get angle(): Number {
        return this.var_855.angle;
    }

    public function set angle(param1: Number): void {
        this.var_855.angle = param1;
    }

    public function get filter(): Object {
        return this.var_855;
    }
}
}
