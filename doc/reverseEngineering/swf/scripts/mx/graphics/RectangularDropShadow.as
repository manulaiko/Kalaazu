package mx.graphics {

import flash.display.BitmapData;
import flash.display.Graphics;
import flash.display.Shape;
import flash.filters.DropShadowFilter;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.FlexShape;
import mx.core.mx_internal;
import mx.utils.GraphicsUtil;

public class RectangularDropShadow {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var shadow: BitmapData;

    private var leftShadow: BitmapData;

    private var rightShadow: BitmapData;

    private var topShadow: BitmapData;

    private var bottomShadow: BitmapData;

    private var changed: Boolean = true;

    private var _alpha: Number = 0.4;

    private var _angle: Number = 45;

    private var _color: int = 0;

    private var _distance: Number = 4;

    private var _tlRadius: Number = 0;

    private var _trRadius: Number = 0;

    private var _blRadius: Number = 0;

    private var _brRadius: Number = 0;

    private var _blurX: Number = 4;

    private var _blurY: Number = 4;

    public function RectangularDropShadow() {
        super();
    }

    public function get alpha(): Number {
        return this._alpha;
    }

    public function set alpha(param1: Number): void {
        if (this._alpha != param1) {
            this._alpha = param1;
            this.changed = true;
        }
    }

    public function get angle(): Number {
        return this._angle;
    }

    public function set angle(param1: Number): void {
        if (this._angle != param1) {
            this._angle = param1;
            this.changed = true;
        }
    }

    public function get color(): int {
        return this._color;
    }

    public function set color(param1: int): void {
        if (this._color != param1) {
            this._color = param1;
            this.changed = true;
        }
    }

    public function get distance(): Number {
        return this._distance;
    }

    public function set distance(param1: Number): void {
        if (this._distance != param1) {
            this._distance = param1;
            this.changed = true;
        }
    }

    public function get tlRadius(): Number {
        return this._tlRadius;
    }

    public function set tlRadius(param1: Number): void {
        if (this._tlRadius != param1) {
            this._tlRadius = param1;
            this.changed = true;
        }
    }

    public function get trRadius(): Number {
        return this._trRadius;
    }

    public function set trRadius(param1: Number): void {
        if (this._trRadius != param1) {
            this._trRadius = param1;
            this.changed = true;
        }
    }

    public function get blRadius(): Number {
        return this._blRadius;
    }

    public function set blRadius(param1: Number): void {
        if (this._blRadius != param1) {
            this._blRadius = param1;
            this.changed = true;
        }
    }

    public function get brRadius(): Number {
        return this._brRadius;
    }

    public function set brRadius(param1: Number): void {
        if (this._brRadius != param1) {
            this._brRadius = param1;
            this.changed = true;
        }
    }

    public function get blurX(): Number {
        return this._blurX;
    }

    public function set blurX(param1: Number): void {
        if (this._blurX != param1) {
            this._blurX = param1;
            this.changed = true;
        }
    }

    public function get blurY(): Number {
        return this._blurY;
    }

    public function set blurY(param1: Number): void {
        if (this._blurY != param1) {
            this._blurY = param1;
            this.changed = true;
        }
    }

    public function drawShadow(param1: Graphics, param2: Number, param3: Number, param4: Number, param5: Number): void {
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc18_: Number = NaN;
        var _loc19_: Number = NaN;
        var _loc20_: Number = NaN;
        var _loc21_: Number = NaN;
        var _loc22_: Number = NaN;
        if (this.changed) {
            this.createShadowBitmaps();
            this.changed = false;
        }
        param4 = Math.ceil(param4);
        param5 = Math.ceil(param5);
        var _loc6_: int = !!this.leftShadow ? this.leftShadow.width : 0;
        var _loc7_: int = !!this.rightShadow ? this.rightShadow.width : 0;
        var _loc8_: int = !!this.topShadow ? this.topShadow.height : 0;
        var _loc9_: int = !!this.bottomShadow ? this.bottomShadow.height : 0;
        var _loc10_: int = _loc6_ + _loc7_;
        var _loc11_: int = _loc8_ + _loc9_;
        var _loc12_: Number = (param5 + _loc11_) / 2;
        var _loc13_: Number = (param4 + _loc10_) / 2;
        var _loc14_: Matrix = new Matrix();
        if (Boolean(this.leftShadow) || Boolean(this.topShadow)) {
            _loc15_ = Math.min(this.tlRadius + _loc10_, _loc13_);
            _loc16_ = Math.min(this.tlRadius + _loc11_, _loc12_);
            _loc14_.tx = param2 - _loc6_;
            _loc14_.ty = param3 - _loc8_;
            param1.beginBitmapFill(this.shadow, _loc14_, false);
            param1.drawRect(param2 - _loc6_, param3 - _loc8_, _loc15_, _loc16_);
            param1.endFill();
        }
        if (Boolean(this.rightShadow) || Boolean(this.topShadow)) {
            _loc17_ = Math.min(this.trRadius + _loc10_, _loc13_);
            _loc18_ = Math.min(this.trRadius + _loc11_, _loc12_);
            _loc14_.tx = param2 + param4 + _loc7_ - this.shadow.width;
            _loc14_.ty = param3 - _loc8_;
            param1.beginBitmapFill(this.shadow, _loc14_, false);
            param1.drawRect(param2 + param4 + _loc7_ - _loc17_, param3 - _loc8_, _loc17_, _loc18_);
            param1.endFill();
        }
        if (Boolean(this.leftShadow) || Boolean(this.bottomShadow)) {
            _loc19_ = Math.min(this.blRadius + _loc10_, _loc13_);
            _loc20_ = Math.min(this.blRadius + _loc11_, _loc12_);
            _loc14_.tx = param2 - _loc6_;
            _loc14_.ty = param3 + param5 + _loc9_ - this.shadow.height;
            param1.beginBitmapFill(this.shadow, _loc14_, false);
            param1.drawRect(param2 - _loc6_, param3 + param5 + _loc9_ - _loc20_, _loc19_, _loc20_);
            param1.endFill();
        }
        if (Boolean(this.rightShadow) || Boolean(this.bottomShadow)) {
            _loc21_ = Math.min(this.brRadius + _loc10_, _loc13_);
            _loc22_ = Math.min(this.brRadius + _loc11_, _loc12_);
            _loc14_.tx = param2 + param4 + _loc7_ - this.shadow.width;
            _loc14_.ty = param3 + param5 + _loc9_ - this.shadow.height;
            param1.beginBitmapFill(this.shadow, _loc14_, false);
            param1.drawRect(param2 + param4 + _loc7_ - _loc21_, param3 + param5 + _loc9_ - _loc22_, _loc21_, _loc22_);
            param1.endFill();
        }
        if (this.leftShadow) {
            _loc14_.tx = param2 - _loc6_;
            _loc14_.ty = 0;
            param1.beginBitmapFill(this.leftShadow, _loc14_, false);
            param1.drawRect(param2 - _loc6_, param3 - _loc8_ + _loc16_, _loc6_, param5 + _loc8_ + _loc9_ - _loc16_ - _loc20_);
            param1.endFill();
        }
        if (this.rightShadow) {
            _loc14_.tx = param2 + param4;
            _loc14_.ty = 0;
            param1.beginBitmapFill(this.rightShadow, _loc14_, false);
            param1.drawRect(param2 + param4, param3 - _loc8_ + _loc18_, _loc7_, param5 + _loc8_ + _loc9_ - _loc18_ - _loc22_);
            param1.endFill();
        }
        if (this.topShadow) {
            _loc14_.tx = 0;
            _loc14_.ty = param3 - _loc8_;
            param1.beginBitmapFill(this.topShadow, _loc14_, false);
            param1.drawRect(param2 - _loc6_ + _loc15_, param3 - _loc8_, param4 + _loc6_ + _loc7_ - _loc15_ - _loc17_, _loc8_);
            param1.endFill();
        }
        if (this.bottomShadow) {
            _loc14_.tx = 0;
            _loc14_.ty = param3 + param5;
            param1.beginBitmapFill(this.bottomShadow, _loc14_, false);
            param1.drawRect(param2 - _loc6_ + _loc19_, param3 + param5, param4 + _loc6_ + _loc7_ - _loc19_ - _loc21_, _loc9_);
            param1.endFill();
        }
    }

    private function createShadowBitmaps(): void {
        var _loc1_: Number = Math.max(this.tlRadius, this.blRadius) + 3 * Math.max(Math.abs(this.distance), 2) + Math.max(this.trRadius, this.brRadius);
        var _loc2_: Number = Math.max(this.tlRadius, this.trRadius) + 3 * Math.max(Math.abs(this.distance), 2) + Math.max(this.blRadius, this.brRadius);
        if (_loc1_ < 0 || _loc2_ < 0) {
            return;
        }
        var _loc3_: Shape = new FlexShape();
        var _loc4_: Graphics;
        (_loc4_ = _loc3_.graphics).beginFill(16777215);
        GraphicsUtil.drawRoundRectComplex(_loc4_, 0, 0, _loc1_, _loc2_, this.tlRadius, this.trRadius, this.blRadius, this.brRadius);
        _loc4_.endFill();
        var _loc5_: BitmapData;
        (_loc5_ = new BitmapData(_loc1_, _loc2_, true, 0)).draw(_loc3_, new Matrix());
        var _loc6_: DropShadowFilter;
        (_loc6_ = new DropShadowFilter(this.distance, this.angle, this.color, this.alpha, this.blurX, this.blurY)).knockout = true;
        var _loc7_: Rectangle = new Rectangle(0, 0, _loc1_, _loc2_);
        var _loc8_: Rectangle = _loc5_.generateFilterRect(_loc7_, _loc6_);
        var _loc9_: Number = _loc7_.left - _loc8_.left;
        var _loc10_: Number = _loc8_.right - _loc7_.right;
        var _loc11_: Number = _loc7_.top - _loc8_.top;
        var _loc12_: Number = _loc8_.bottom - _loc7_.bottom;
        this.shadow = new BitmapData(_loc8_.width, _loc8_.height);
        this.shadow.applyFilter(_loc5_, _loc7_, new Point(_loc9_, _loc11_), _loc6_);
        var _loc13_: Point = new Point(0, 0);
        var _loc14_: Rectangle = new Rectangle();
        if (_loc9_ > 0) {
            _loc14_.x = 0;
            _loc14_.y = this.tlRadius + _loc11_ + _loc12_;
            _loc14_.width = _loc9_;
            _loc14_.height = 1;
            this.leftShadow = new BitmapData(_loc9_, 1);
            this.leftShadow.copyPixels(this.shadow, _loc14_, _loc13_);
        } else {
            this.leftShadow = null;
        }
        if (_loc10_ > 0) {
            _loc14_.x = this.shadow.width - _loc10_;
            _loc14_.y = this.trRadius + _loc11_ + _loc12_;
            _loc14_.width = _loc10_;
            _loc14_.height = 1;
            this.rightShadow = new BitmapData(_loc10_, 1);
            this.rightShadow.copyPixels(this.shadow, _loc14_, _loc13_);
        } else {
            this.rightShadow = null;
        }
        if (_loc11_ > 0) {
            _loc14_.x = this.tlRadius + _loc9_ + _loc10_;
            _loc14_.y = 0;
            _loc14_.width = 1;
            _loc14_.height = _loc11_;
            this.topShadow = new BitmapData(1, _loc11_);
            this.topShadow.copyPixels(this.shadow, _loc14_, _loc13_);
        } else {
            this.topShadow = null;
        }
        if (_loc12_ > 0) {
            _loc14_.x = this.blRadius + _loc9_ + _loc10_;
            _loc14_.y = this.shadow.height - _loc12_;
            _loc14_.width = 1;
            _loc14_.height = _loc12_;
            this.bottomShadow = new BitmapData(1, _loc12_);
            this.bottomShadow.copyPixels(this.shadow, _loc14_, _loc13_);
        } else {
            this.bottomShadow = null;
        }
    }
}
}
