package spark.effects.easing {

public class EaseInOutBase implements IEaser {


    private var _easeInFraction: Number = 0.5;

    public function EaseInOutBase(param1: Number = 0.5) {
        super();
        this.easeInFraction = param1;
    }

    public function get easeInFraction(): Number {
        return this._easeInFraction;
    }

    public function set easeInFraction(param1: Number): void {
        this._easeInFraction = param1;
    }

    public function ease(param1: Number): Number {
        var _loc2_: Number = 1 - this.easeInFraction;
        if (param1 <= this.easeInFraction && this.easeInFraction > 0) {
            return this.easeInFraction * this.easeIn(param1 / this.easeInFraction);
        }
        return this.easeInFraction + _loc2_ * this.easeOut((param1 - this.easeInFraction) / _loc2_);
    }

    protected function easeIn(param1: Number): Number {
        return param1;
    }

    protected function easeOut(param1: Number): Number {
        return param1;
    }
}
}
