package package_421 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.filters.BitmapFilter;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

import package_420.class_2345;

import package_460.class_2552;

public class class_2346 extends class_2345 {

    protected static var ZERO_POINT: Point = new Point(0, 0);


    protected var var_444: Bitmap;

    protected var _bitmapData: BitmapData;

    protected var var_4924: Array;

    protected var var_4299: Array;

    protected var var_773: Array;

    protected var _smoothing: Boolean;

    protected var var_1128: Rectangle;

    protected var var_4987: Boolean;

    public function class_2346(param1: Rectangle, param2: Boolean = false) {
        super();
        mouseEnabled = false;
        mouseChildren = false;
        this._smoothing = param2;
        this.var_4924 = new Array();
        this.var_4299 = new Array();
        this.var_1128 = param1;
        this.createBitmap();
        this.var_4987 = true;
    }

    public function addFilter(param1: BitmapFilter, param2: Boolean = false): void {
        if (param2) {
            this.var_4299.push(param1);
        } else {
            this.var_4924.push(param1);
        }
    }

    public function removeFilter(param1: BitmapFilter): void {
        var _loc2_: int = 0;
        while (_loc2_ < this.var_4924.length) {
            if (this.var_4924[_loc2_] == param1) {
                this.var_4924.splice(_loc2_, 1);
                return;
            }
            _loc2_++;
        }
        _loc2_ = 0;
        while (_loc2_ < this.var_4299.length) {
            if (this.var_4299[_loc2_] == param1) {
                this.var_4299.splice(_loc2_, 1);
                return;
            }
            _loc2_++;
        }
    }

    public function get method_5493(): Array {
        return this.var_4924.slice();
    }

    public function set method_5493(param1: Array): void {
        var _loc2_: * = null;
        for each(_loc2_ in this.var_4924) {
            this.removeFilter(_loc2_);
        }
        for each(_loc2_ in param1) {
            this.addFilter(_loc2_, false);
        }
    }

    public function get method_3392(): Array {
        return this.var_4299.slice();
    }

    public function set method_3392(param1: Array): void {
        var _loc2_: * = null;
        for each(_loc2_ in this.var_4299) {
            this.removeFilter(_loc2_);
        }
        for each(_loc2_ in param1) {
            this.addFilter(_loc2_, true);
        }
    }

    public function method_3362(param1: Array = null, param2: Array = null, param3: Array = null, param4: Array = null): void {
        this.var_773 = new Array(4);
        this.var_773[0] = param4;
        this.var_773[1] = param1;
        this.var_773[2] = param2;
        this.var_773[3] = param3;
    }

    public function method_6072(): void {
        this.var_773 = null;
    }

    protected function createBitmap(): void {
        if (!this.var_1128) {
            return;
        }
        if (Boolean(this.var_444) && Boolean(this._bitmapData)) {
            this._bitmapData.dispose();
            this._bitmapData = null;
        }
        if (this.var_444) {
            removeChild(this.var_444);
            this.var_444 = null;
        }
        this.var_444 = new Bitmap(null, "auto", this._smoothing);
        this._bitmapData = new BitmapData(Math.ceil(this.var_1128.width), Math.ceil(this.var_1128.height), true, 0);
        this.var_444.bitmapData = this._bitmapData;
        addChild(this.var_444);
        this.var_444.x = this.var_1128.x;
        this.var_444.y = this.var_1128.y;
    }

    public function get method_5305(): Rectangle {
        return this.var_1128;
    }

    public function set method_5305(param1: Rectangle): void {
        this.var_1128 = param1;
        this.createBitmap();
    }

    public function get method_5285(): Boolean {
        return this.var_4987;
    }

    public function set method_5285(param1: Boolean): void {
        this.var_4987 = param1;
    }

    public function get smoothing(): Boolean {
        return this._smoothing;
    }

    public function set smoothing(param1: Boolean): void {
        this._smoothing = param1;
        if (this.var_444) {
            this.var_444.smoothing = param1;
        }
    }

    override protected function method_1701(param1: Array): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        if (!this.var_444) {
            return;
        }
        this._bitmapData.lock();
        _loc3_ = int(this.var_4924.length);
        _loc2_ = 0;
        while (_loc2_ < _loc3_) {
            this._bitmapData.applyFilter(this._bitmapData, this._bitmapData.rect, class_2346.ZERO_POINT, this.var_4924[_loc2_]);
            _loc2_++;
        }
        if (Boolean(this.var_4987) && _loc3_ == 0) {
            this._bitmapData.fillRect(this.var_444.bitmapData.rect, 0);
        }
        _loc3_ = param1.length;
        if (_loc3_) {
            _loc2_ = _loc3_;
            while (_loc2_--) {
                this.method_235(class_2552(param1[_loc2_]));
            }
        }
        _loc3_ = int(this.var_4299.length);
        _loc2_ = 0;
        while (_loc2_ < _loc3_) {
            this._bitmapData.applyFilter(this._bitmapData, this._bitmapData.rect, class_2346.ZERO_POINT, this.var_4299[_loc2_]);
            _loc2_++;
        }
        if (this.var_773) {
            this._bitmapData.paletteMap(this._bitmapData, this._bitmapData.rect, ZERO_POINT, this.var_773[1], this.var_773[2], this.var_773[3], this.var_773[0]);
        }
        this._bitmapData.unlock();
    }

    protected function method_235(param1: class_2552): void {
        var _loc2_: * = null;
        _loc2_ = param1.method_6186;
        _loc2_.translate(-Number(this.var_1128.x), -Number(this.var_1128.y));
        this._bitmapData.draw(param1.image, _loc2_, param1.colorTransform, DisplayObject(param1.image).blendMode, null, this._smoothing);
    }

    public function get bitmapData(): BitmapData {
        return this._bitmapData;
    }
}
}
