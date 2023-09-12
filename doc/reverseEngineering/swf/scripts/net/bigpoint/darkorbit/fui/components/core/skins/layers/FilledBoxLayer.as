package net.bigpoint.darkorbit.fui.components.core.skins.layers {

import flash.display.DisplayObject;
import flash.display.Graphics;

import net.bigpoint.darkorbit.fui.components.core.Coreponent;

public class FilledBoxLayer extends Coreponent implements ISkinLayer {


    protected var _lineColor: uint = 0;

    protected var _lineAlpha: Number = 0;

    protected var _fillColor: uint = 0;

    protected var _fillAlpha: Number = 1;

    protected var _fillColorStart: uint = 0;

    protected var _fillColorEnd: uint = 0;

    public function FilledBoxLayer() {
        super();
    }

    override public function set width(param1: Number): void {
        _width = param1;
        invalidate();
    }

    override public function set height(param1: Number): void {
        _height = param1;
        invalidate();
    }

    override protected function draw(): void {
        var _loc1_: Graphics = this.graphics;
        _loc1_.clear();
        _loc1_.lineStyle(1, this._lineColor, this._lineAlpha);
        _loc1_.beginFill(this._fillColor, this._fillAlpha);
        _loc1_.drawRect(0, 0, _width, _height);
        _loc1_.endFill();
    }

    public function clone(): DisplayObject {
        var _loc1_: FilledBoxLayer = new FilledBoxLayer();
        _loc1_.lineColor = this._lineColor;
        _loc1_.lineAlpha = this._lineAlpha;
        _loc1_.fillAlpha = this._fillAlpha;
        _loc1_.fillColor = this._fillColor;
        return _loc1_;
    }

    public function set fillAlpha(param1: Number): void {
        this._fillAlpha = param1;
        invalidate();
    }

    public function set fillColor(param1: Number): void {
        this._fillColor = param1;
        invalidate();
    }

    public function set lineColor(param1: Number): void {
        this._lineColor = param1;
        invalidate();
    }

    public function set lineAlpha(param1: Number): void {
        this._lineAlpha = param1;
        invalidate();
    }
}
}
