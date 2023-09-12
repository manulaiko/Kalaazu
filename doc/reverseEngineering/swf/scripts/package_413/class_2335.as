package package_413 {

import org.flintparticles.common.utils.interpolateColors;

import package_416.class_2338;

import package_459.class_2551;

public class class_2335 extends class_2334 {


    private var _min: uint;

    private var _max: uint;

    public function class_2335(param1: uint = 16777215, param2: uint = 16777215) {
        super();
        this._min = param1;
        this._max = param2;
    }

    public function get method_5089(): uint {
        return this._min;
    }

    public function set method_5089(param1: uint): void {
        this._min = param1;
    }

    public function get method_3508(): uint {
        return this._max;
    }

    public function set method_3508(param1: uint): void {
        this._max = param1;
    }

    public function get color(): uint {
        return this._min == this._max ? uint(this._min) : interpolateColors(this._max, this._min, 0.5);
    }

    public function set color(param1: uint): void {
        this._max = this._min = param1;
    }

    override public function initialize(param1: class_2338, param2: class_2551): void {
        if (this._max == this._min) {
            param2.color = this._min;
        } else {
            param2.color = interpolateColors(this._min, this._max, Math.random());
        }
    }
}
}
