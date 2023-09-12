package net.bigpoint.darkorbit.fui.components.core.skins.layers {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.Shape;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

public class Scale9RepeatedXYFilledBitmapLayer extends Scale9BitmapLayer implements ISkinLayer {


    protected var c_fill: Shape;

    public function Scale9RepeatedXYFilledBitmapLayer(param1: BitmapData, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number = 10, param7: Number = 10) {
        super(param1, param2, param3, param4, param5, param6, param7);
    }

    override protected function createSegments(): void {
        var _loc7_: * = null;
        var _loc1_: Number = 0;
        var _loc2_: Number = _x2 - _x1;
        var _loc3_: Number = 0 - _x2;
        var _loc4_: Number = 0;
        var _loc5_: Number = _y2 - _y1;
        var _loc6_: Number = 0 - _y2;
        var _loc8_: Point = new Point(0, 0);
        (_loc7_ = new BitmapData(_x1, _y1, true, 0)).copyPixels(_unscaledBitmapData, new Rectangle(0, 0, _x1, _y1), _loc8_);
        tl = new Bitmap(_loc7_);
        this.addChild(tl);
        (_loc7_ = new BitmapData(_loc2_, _y1, true, 0)).copyPixels(_unscaledBitmapData, new Rectangle(_x1, 0, _x2, _y1), _loc8_);
        tc = new Bitmap(_loc7_);
        this.addChild(tc);
        (_loc7_ = new BitmapData(_loc3_, _y1, true, 0)).copyPixels(_unscaledBitmapData, new Rectangle(_x2, 0, _loc1_, _y1), _loc8_);
        tr = new Bitmap(_loc7_);
        this.addChild(tr);
        (_loc7_ = new BitmapData(_x1, _loc5_, true, 0)).copyPixels(_unscaledBitmapData, new Rectangle(0, _y1, _x1, _y2), _loc8_);
        cl = new Bitmap(_loc7_);
        (_loc7_ = new BitmapData(_loc2_, _loc5_, true, 0)).copyPixels(_unscaledBitmapData, new Rectangle(_x1, _y1, _x2, _y2), _loc8_);
        cc = new Bitmap(_loc7_);
        (_loc7_ = new BitmapData(_loc3_, _loc5_, true, 0)).copyPixels(_unscaledBitmapData, new Rectangle(_x2, _y1, _loc1_, _y2), _loc8_);
        cr = new Bitmap(_loc7_);
        this.c_fill = new Shape();
        addChild(this.c_fill);
        (_loc7_ = new BitmapData(_x1, _loc6_, true, 0)).copyPixels(_unscaledBitmapData, new Rectangle(0, _y2, _x1, _loc4_), _loc8_);
        bl = new Bitmap(_loc7_);
        this.addChild(bl);
        (_loc7_ = new BitmapData(_loc2_, _loc6_, true, 0)).copyPixels(_unscaledBitmapData, new Rectangle(_x1, _y2, _x2, _loc4_), _loc8_);
        bc = new Bitmap(_loc7_);
        this.addChild(bc);
        (_loc7_ = new BitmapData(_loc3_, _loc6_, true, 0)).copyPixels(_unscaledBitmapData, new Rectangle(_x2, _y2, _loc1_, _loc4_), _loc8_);
        br = new Bitmap(_loc7_);
        this.addChild(br);
    }

    override public function redraw(): void {
        var _loc7_: * = null;
        var _loc1_: Number = 0 - _x2;
        var _loc2_: Number = 0 - _y2;
        var _loc3_: Number = _width - (_x1 + _loc1_);
        var _loc4_: Number = _height - (_y1 + _loc2_);
        var _loc5_: Number = _x1 + _loc3_;
        var _loc6_: Number = _y1 + _loc4_;
        tl.x = 0;
        tl.y = 0;
        tc.x = _x1;
        tc.width = _loc3_;
        tr.x = _loc5_;
        this.c_fill.x = 0;
        this.c_fill.y = 0;
        var _loc8_: Graphics;
        (_loc8_ = this.c_fill.graphics).clear();
        _loc8_.beginBitmapFill(cl.bitmapData, null, true);
        _loc8_.drawRect(0, _y1, cl.width, _loc4_);
        _loc8_.endFill();
        _loc8_.beginBitmapFill(cc.bitmapData, null, true);
        _loc8_.drawRect(_x1, _y1, _loc3_, _loc4_);
        _loc8_.endFill();
        _loc7_ = new Matrix();
        var _loc9_: int = _loc5_ % 0;
        _loc7_.translate(_loc9_, 0);
        _loc8_.beginBitmapFill(cr.bitmapData, _loc7_, true);
        _loc8_.drawRect(_loc5_, _y1, cr.width, _loc4_);
        _loc8_.endFill();
        bl.x = 0;
        bl.y = _loc6_;
        bc.x = _x1;
        bc.y = _loc6_;
        bc.width = _loc3_;
        br.x = _loc5_;
        br.y = _loc6_;
    }

    override public function clone(): DisplayObject {
        return new Scale9RepeatedXYFilledBitmapLayer(this._unscaledBitmapData, _x1, _y1, _x2, _y2, _width, _height);
    }
}
}
