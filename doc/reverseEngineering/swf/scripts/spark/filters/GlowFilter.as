package spark.filters {

import flash.filters.BitmapFilter;
import flash.filters.GlowFilter;

import mx.filters.BaseDimensionFilter;
import mx.filters.IBitmapFilter;

public class GlowFilter extends BaseDimensionFilter implements IBitmapFilter {


    private var _alpha: Number = 1;

    private var _color: uint = 16711680;

    private var _inner: Boolean = false;

    public function GlowFilter(param1: uint = 16711680, param2: Number = 1, param3: Number = 4, param4: Number = 4, param5: Number = 1, param6: int = 1, param7: Boolean = false, param8: Boolean = false) {
        super();
        this.color = param1;
        this.alpha = param2;
        this.blurX = param3;
        this.blurY = param4;
        this.strength = param5;
        this.quality = param6;
        this.inner = param7;
        this.knockout = param8;
    }

    public function get alpha(): Number {
        return this._alpha;
    }

    public function set alpha(param1: Number): void {
        if (param1 != this._alpha) {
            this._alpha = param1;
            notifyFilterChanged();
        }
    }

    public function get color(): uint {
        return this._color;
    }

    public function set color(param1: uint): void {
        if (param1 != this._color) {
            this._color = param1;
            notifyFilterChanged();
        }
    }

    public function get inner(): Boolean {
        return this._inner;
    }

    public function set inner(param1: Boolean): void {
        if (param1 != this._inner) {
            this._inner = param1;
            notifyFilterChanged();
        }
    }

    public function clone(): BitmapFilter {
        return new flash.filters.GlowFilter(this.color, this.alpha, blurX, blurY, strength, quality, this.inner, knockout);
    }
}
}
