package spark.effects.easing {

public class Linear implements IEaser {


    private var _easeInFraction: Number = 0;

    private var _easeOutFraction: Number = 0;

    public function Linear(param1: Number = 0, param2: Number = 0) {
        super();
        this.easeInFraction = param1;
        this.easeOutFraction = param2;
    }

    public function get easeInFraction(): Number {
        return this._easeInFraction;
    }

    public function set easeInFraction(param1: Number): void {
        this._easeInFraction = param1;
    }

    public function get easeOutFraction(): Number {
        return this._easeOutFraction;
    }

    public function set easeOutFraction(param1: Number): void {
        this._easeOutFraction = param1;
    }

    public function ease(param1: Number): Number {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        if (this.easeInFraction == 0 && this.easeOutFraction == 0) {
            return param1;
        }
        var _loc2_: Number = 1 / (1 - this.easeInFraction / 2 - this.easeOutFraction / 2);
        if (param1 < this.easeInFraction) {
            return param1 * _loc2_ * (param1 / this.easeInFraction) / 2;
        }
        if (param1 > 1 - this.easeOutFraction) {
            _loc3_ = param1 - (1 - this.easeOutFraction);
            _loc4_ = _loc3_ / this.easeOutFraction;
            return _loc2_ * (1 - this.easeInFraction / 2 - this.easeOutFraction + _loc3_ * (2 - _loc4_) / 2);
        }
        return _loc2_ * (param1 - this.easeInFraction / 2);
    }
}
}
