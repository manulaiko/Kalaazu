package net.bigpoint.darkorbit.mvc.common.utils {

import com.bigpoint.utils.class_73;

import flash.geom.Point;
import flash.geom.Rectangle;

import net.bigpoint.darkorbit.settings.Settings;

public class ScreenScaleUtils {

    private static const JOIN_DISTANCE: int = 150;

    private static const BOUNDS_GAP: int = 2;


    public function ScreenScaleUtils() {
        super();
    }

    public static function getStickedBarOffset(param1: class_73, param2: class_73, param3: class_73, param4: class_73): class_73 {
        var _loc5_: Number;
        if ((_loc5_ = getSmallestDistanceBetweenRectangle(new Rectangle(param3.x, param3.y, param4.x, param4.y), new Rectangle(param1.x, param1.y, param2.x, param2.y))) <= JOIN_DISTANCE) {
            return param1.subtract(param3);
        }
        return null;
    }

    public static function getScalePosition(param1: class_73, param2: class_73, param3: class_73, param4: class_73): class_73 {
        var _loc5_: Number = getScaledValue(param1.x, param2.x, param3.x, param4.x);
        var _loc6_: Number = getScaledValue(param1.y, param2.y, param3.y, param4.y);
        return new class_73(_loc5_, _loc6_);
    }

    public static function getRealPosFromPercentagePos(param1: class_73, param2: class_73, param3: class_73): class_73 {
        var _loc4_: Number = Number(param1.x) - Number(param2.x);
        var _loc5_: Number = Number(param1.y) - Number(param2.y);
        var _loc6_: int = _loc4_ * (Number(param3.x) * 0.01);
        var _loc7_: int = _loc5_ * (Number(param3.y) * 0.01);
        return new class_73(_loc6_, _loc7_);
    }

    public static function getPercentagePosFromRealPos(param1: class_73, param2: class_73, param3: class_73): class_73 {
        var _loc4_: Number = param2.x / (Number(param1.x) - Number(param3.x)) * 100;
        var _loc5_: Number = param2.y / (Number(param1.y) - Number(param3.y)) * 100;
        return new class_73(_loc4_, _loc5_);
    }

    public static function getClosestElementCornerToScreenCorner(param1: class_73, param2: Rectangle): class_73 {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: Number = NaN;
        var _loc3_: Vector.<Point> = new <Point>[new Point(0, 0), new Point(param1.x, 0), new Point(param1.x, param1.y), new Point(0, param1.y)];
        var _loc4_: Vector.<Point> = new <Point>[param2.topLeft, new Point(param2.right, param2.top), param2.bottomRight, new Point(param2.left, param2.bottom)];
        var _loc5_: Number = -1;
        for each(_loc7_ in _loc3_) {
            for each(_loc8_ in _loc4_) {
                _loc9_ = getDinstanceBetweenPoints(_loc7_.x, _loc7_.y, _loc8_.x, _loc8_.y);
                if (_loc5_ == -1 || _loc9_ < _loc5_) {
                    _loc5_ = _loc9_;
                    _loc6_ = _loc8_;
                }
            }
        }
        if (!_loc6_) {
            throw new Error("no closestCorner in ScreenScaleUtils");
        }
        return new class_73(_loc6_.x, _loc6_.y);
    }

    public static function getScaledValue(param1: Number, param2: Number, param3: Number, param4: Number): Number {
        var _loc9_: Number = NaN;
        var _loc5_: * = param1 < param2;
        var _loc6_: Number = param3 / (param1 - param4);
        var _loc7_: Number = _loc5_ ? param2 / param1 : 1 / (param2 / param1);
        var _loc8_: Number = param4 * _loc7_ - param4;
        if (_loc5_) {
            _loc9_ = param3 * _loc7_ + _loc8_ * _loc6_;
        } else {
            _loc9_ = (_loc9_ = param3 - _loc8_ * _loc6_) / _loc7_;
        }
        return int(_loc9_);
    }

    public static function correctOutsideViewportPosition(param1: Rectangle, param2: class_73, param3: Boolean = false): class_73 {
        var _loc4_: Rectangle = new Rectangle(BOUNDS_GAP, BOUNDS_GAP, Number(param2.x) - BOUNDS_GAP, Number(param2.y) - BOUNDS_GAP);
        var _loc5_: int = param1.x;
        var _loc6_: int = param1.y;
        if (!_loc4_.containsRect(param1)) {
            _loc5_ = Math.max(BOUNDS_GAP, Math.min(param1.x, Number(param2.x) - param1.width - BOUNDS_GAP));
            _loc6_ = Math.max(BOUNDS_GAP, Math.min(param1.y, Number(param2.y) - param1.height - BOUNDS_GAP));
        }
        if (param3) {
            _loc5_ = Math.max(BOUNDS_GAP, Math.floor(_loc5_ / 0) * 0);
            _loc6_ = Math.max(BOUNDS_GAP, Math.floor(_loc6_ / 0) * 0);
        }
        return new class_73(_loc5_, _loc6_);
    }

    public static function getSmallestDistanceBetweenRectangle(param1: Rectangle, param2: Rectangle): Number {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        var _loc3_: Number = -1;
        if (param1.intersects(param2)) {
            return 0;
        }
        for each(_loc4_ in [param1.topLeft, new Point(param1.right, param1.top), param1.bottomRight, new Point(param1.left, param1.bottom)]) {
            for each(_loc5_ in [param2.topLeft, new Point(param2.right, param2.top), param2.bottomRight, new Point(param2.left, param2.bottom)]) {
                _loc6_ = getDinstanceBetweenPoints(_loc4_.x, _loc4_.y, _loc5_.x, _loc5_.y);
                if (_loc3_ == -1 || _loc6_ < _loc3_) {
                    _loc3_ = _loc6_;
                }
            }
        }
        return _loc3_;
    }

    public static function getDinstanceBetweenPoints(param1: Number, param2: Number, param3: Number, param4: Number): Number {
        var _loc5_: Number = param1 - param3;
        var _loc6_: Number = param2 - param4;
        return Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
    }
}
}
