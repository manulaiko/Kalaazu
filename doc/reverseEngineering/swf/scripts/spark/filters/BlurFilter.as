package spark.filters {

import flash.filters.BitmapFilter;
import flash.filters.BlurFilter;

import mx.filters.BaseFilter;
import mx.filters.IBitmapFilter;

public class BlurFilter extends BaseFilter implements IBitmapFilter {


    private var _blurX: Number = 4;

    private var _blurY: Number = 4;

    private var _quality: int = 1;

    public function BlurFilter(param1: Number = 4, param2: Number = 4, param3: int = 1) {
        super();
        this.blurX = param1;
        this.blurY = param2;
        this.quality = param3;
    }

    public function get blurX(): Number {
        return this._blurX;
    }

    public function set blurX(param1: Number): void {
        if (param1 != this._blurX) {
            this._blurX = param1;
            notifyFilterChanged();
        }
    }

    public function get blurY(): Number {
        return this._blurY;
    }

    public function set blurY(param1: Number): void {
        if (param1 != this._blurY) {
            this._blurY = param1;
            notifyFilterChanged();
        }
    }

    public function get quality(): int {
        return this._quality;
    }

    public function set quality(param1: int): void {
        if (param1 != this._quality) {
            this._quality = param1;
            notifyFilterChanged();
        }
    }

    public function clone(): BitmapFilter {
        return new flash.filters.BlurFilter(this.blurX, this.blurY, this.quality);
    }
}
}
