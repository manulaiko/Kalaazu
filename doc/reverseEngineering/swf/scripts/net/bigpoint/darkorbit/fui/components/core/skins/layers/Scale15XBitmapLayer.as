package net.bigpoint.darkorbit.fui.components.core.skins.layers {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Sprite;

public class Scale15XBitmapLayer extends Sprite implements ISkinLayer {


    protected var _width: Number;

    protected var _height: Number;

    protected var _unscaledBitmapData: BitmapData;

    protected var _y1: Number = 0;

    protected var _y2: Number = 0;

    protected var _x1: Number = 0;

    protected var _x2: Number = 0;

    protected var _x3: Number = 0;

    protected var _x4: Number = 0;

    protected var tl: Bitmap;

    protected var tlc: Bitmap;

    protected var tc: Bitmap;

    protected var tcr: Bitmap;

    protected var tr: Bitmap;

    protected var cl: Bitmap;

    protected var clc: Bitmap;

    protected var cc: Bitmap;

    protected var ccr: Bitmap;

    protected var cr: Bitmap;

    protected var bl: Bitmap;

    protected var blc: Bitmap;

    protected var bc: Bitmap;

    protected var bcr: Bitmap;

    protected var br: Bitmap;

    public function Scale15XBitmapLayer(param1: BitmapData, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number = 10, param9: Number = 10) {
        super();
        if (param6 >= param7 || param2 >= param3 || param3 >= param4 || param4 >= param5) {
            throw new Error("Wrong scale15X grid definitions.");
        }
        this._unscaledBitmapData = param1;
        this._x1 = param2;
        this._x2 = param3;
        this._x3 = param4;
        this._x4 = param5;
        this._y1 = param6;
        this._y2 = param7;
        this._width = param8;
        this._height = param9;
        this.createSegments();
        this.redraw();
    }

    protected function createSegments(): void {
    }

    protected function redraw(): void {
    }

    public function clone(): DisplayObject {
        return new Scale15XBitmapLayer(this._unscaledBitmapData, this._x1, this._x2, this._x3, this._x4, this._y1, this._y2, this._width, this._height);
    }

    public function dispose(): void {
        this.tl.bitmapData.dispose();
        this.tlc.bitmapData.dispose();
        this.tc.bitmapData.dispose();
        this.tcr.bitmapData.dispose();
        this.tr.bitmapData.dispose();
        this.tl = null;
        this.tlc = null;
        this.tc = null;
        this.tcr = null;
        this.tr = null;
        this.cl.bitmapData.dispose();
        this.clc.bitmapData.dispose();
        this.cc.bitmapData.dispose();
        this.ccr.bitmapData.dispose();
        this.cr.bitmapData.dispose();
        this.cl = null;
        this.clc = null;
        this.cc = null;
        this.ccr = null;
        this.cr = null;
        this.bl.bitmapData.dispose();
        this.blc.bitmapData.dispose();
        this.bc.bitmapData.dispose();
        this.bcr.bitmapData.dispose();
        this.br.bitmapData.dispose();
        this.bl = null;
        this.blc = null;
        this.bc = null;
        this.bcr = null;
        this.br = null;
    }
}
}
