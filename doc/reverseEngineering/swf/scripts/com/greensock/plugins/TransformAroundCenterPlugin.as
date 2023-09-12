package com.greensock.plugins {

import com.greensock.TweenLite;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.geom.Point;
import flash.geom.Rectangle;

public class TransformAroundCenterPlugin extends TransformAroundPointPlugin {

    public static const API: Number = 1;


    public function TransformAroundCenterPlugin() {
        super();
        this.propName = "transformAroundCenter";
    }

    override public function onInitTween(param1: Object, param2: *, param3: TweenLite): Boolean {
        var _loc8_: * = null;
        var _loc4_: Boolean = false;
        var _loc5_: DisplayObject;
        if ((_loc5_ = param1 as DisplayObject).parent == null) {
            _loc4_ = true;
            (_loc8_ = new Sprite()).addChild(_loc5_);
        }
        var _loc6_: Rectangle = _loc5_.getBounds(_loc5_.parent);
        param2.point = new Point(_loc6_.x + _loc6_.width * 0.5, _loc6_.y + _loc6_.height * 0.5);
        if (_loc4_) {
            _loc5_.parent.removeChild(_loc5_);
        }
        var _loc7_: Boolean = super.onInitTween(_loc5_, param2, param3);
        if (_loc6_.width < 1 || _loc6_.height < 1) {
            _loc6_ = _loc5_.getBounds(_loc5_);
            _local = new Point(_loc6_.x + _loc6_.width * 0.5, _loc6_.y + _loc6_.height * 0.5);
        }
        return _loc7_;
    }
}
}
