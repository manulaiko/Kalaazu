package mx.core {

import flash.geom.Matrix;
import flash.geom.Point;

import mx.utils.MatrixUtil;

public class LayoutElementUIComponentUtils {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const DEFAULT_MAX_WIDTH: Number = 10000;

    private static const DEFAULT_MAX_HEIGHT: Number = 10000;


    public function LayoutElementUIComponentUtils() {
        super();
    }

    private static function getPreferredUBoundsWidth(param1: IUIComponent): Number {
        var _loc2_: Number = Number(param1.getExplicitOrMeasuredWidth());
        if (false) {
            _loc2_ = param1.scaleX == 0 ? 0 : _loc2_ / Number(param1.scaleX);
        }
        return _loc2_;
    }

    private static function getPreferredUBoundsHeight(param1: IUIComponent): Number {
        var _loc2_: Number = Number(param1.getExplicitOrMeasuredHeight());
        if (false) {
            _loc2_ = param1.scaleY == 0 ? 0 : _loc2_ / Number(param1.scaleY);
        }
        return _loc2_;
    }

    private static function getMinUBoundsWidth(param1: IUIComponent): Number {
        var _loc2_: Number = NaN;
        if (!isNaN(param1.explicitMinWidth)) {
            _loc2_ = Number(param1.explicitMinWidth);
        } else {
            _loc2_ = isNaN(param1.measuredMinWidth) ? 0 : Number(param1.measuredMinWidth);
            if (!isNaN(param1.explicitMaxWidth)) {
                _loc2_ = Math.min(_loc2_, param1.explicitMaxWidth);
            }
        }
        if (false) {
            _loc2_ = param1.scaleX == 0 ? 0 : _loc2_ / Number(param1.scaleX);
        }
        return _loc2_;
    }

    private static function getMinUBoundsHeight(param1: IUIComponent): Number {
        var _loc2_: Number = NaN;
        if (!isNaN(param1.explicitMinHeight)) {
            _loc2_ = Number(param1.explicitMinHeight);
        } else {
            _loc2_ = isNaN(param1.measuredMinHeight) ? 0 : Number(param1.measuredMinHeight);
            if (!isNaN(param1.explicitMaxHeight)) {
                _loc2_ = Math.min(_loc2_, param1.explicitMaxHeight);
            }
        }
        if (false) {
            _loc2_ = param1.scaleY == 0 ? 0 : _loc2_ / Number(param1.scaleY);
        }
        return _loc2_;
    }

    private static function getMaxUBoundsWidth(param1: IUIComponent): Number {
        var _loc2_: Number = NaN;
        if (!isNaN(param1.explicitMaxWidth)) {
            _loc2_ = Number(param1.explicitMaxWidth);
        } else {
            _loc2_ = DEFAULT_MAX_WIDTH;
        }
        if (false) {
            _loc2_ = param1.scaleX == 0 ? 0 : _loc2_ / Number(param1.scaleX);
        }
        return _loc2_;
    }

    private static function getMaxUBoundsHeight(param1: IUIComponent): Number {
        var _loc2_: Number = NaN;
        if (!isNaN(param1.explicitMaxHeight)) {
            _loc2_ = Number(param1.explicitMaxHeight);
        } else {
            _loc2_ = DEFAULT_MAX_HEIGHT;
        }
        if (false) {
            _loc2_ = param1.scaleY == 0 ? 0 : _loc2_ / Number(param1.scaleY);
        }
        return _loc2_;
    }

    public static function getPreferredBoundsWidth(param1: IUIComponent, param2: Matrix): Number {
        var _loc3_: Number = getPreferredUBoundsWidth(param1);
        if (param2) {
            _loc3_ = MatrixUtil.transformSize(_loc3_, getPreferredUBoundsHeight(param1), param2).x;
        }
        return _loc3_;
    }

    public static function getPreferredBoundsHeight(param1: IUIComponent, param2: Matrix): Number {
        var _loc3_: Number = getPreferredUBoundsHeight(param1);
        if (param2) {
            _loc3_ = MatrixUtil.transformSize(getPreferredUBoundsWidth(param1), _loc3_, param2).y;
        }
        return _loc3_;
    }

    public static function getMinBoundsWidth(param1: IUIComponent, param2: Matrix): Number {
        var _loc3_: Number = getMinUBoundsWidth(param1);
        if (param2) {
            _loc3_ = MatrixUtil.transformSize(_loc3_, getMinUBoundsHeight(param1), param2).x;
        }
        return _loc3_;
    }

    public static function getMinBoundsHeight(param1: IUIComponent, param2: Matrix): Number {
        var _loc3_: Number = getMinUBoundsHeight(param1);
        if (param2) {
            _loc3_ = MatrixUtil.transformSize(getMinUBoundsWidth(param1), _loc3_, param2).y;
        }
        return _loc3_;
    }

    public static function getMaxBoundsWidth(param1: IUIComponent, param2: Matrix): Number {
        var _loc3_: Number = getMaxUBoundsWidth(param1);
        if (param2) {
            _loc3_ = MatrixUtil.transformSize(_loc3_, getMaxUBoundsHeight(param1), param2).x;
        }
        return _loc3_;
    }

    public static function getMaxBoundsHeight(param1: IUIComponent, param2: Matrix): Number {
        var _loc3_: Number = getMaxUBoundsHeight(param1);
        if (param2) {
            _loc3_ = MatrixUtil.transformSize(getMaxUBoundsWidth(param1), _loc3_, param2).y;
        }
        return _loc3_;
    }

    public static function getBoundsXAtSize(param1: IUIComponent, param2: Number, param3: Number, param4: Matrix): Number {
        if (!param4) {
            return param1.x;
        }
        var _loc5_: Point;
        if (!(_loc5_ = MatrixUtil.fitBounds(param2, param3, param4, param1.explicitWidth, param1.explicitHeight, getPreferredUBoundsWidth(param1), getPreferredUBoundsHeight(param1), getMinUBoundsWidth(param1), getMinUBoundsHeight(param1), getMaxUBoundsWidth(param1), getMaxUBoundsHeight(param1)))) {
            _loc5_ = new Point(getMinUBoundsWidth(param1), getMinUBoundsHeight(param1));
        }
        var _loc6_: Point = new Point();
        MatrixUtil.transformBounds(_loc5_.x, _loc5_.y, param4, _loc6_);
        return _loc6_.x;
    }

    public static function getBoundsYAtSize(param1: IUIComponent, param2: Number, param3: Number, param4: Matrix): Number {
        if (!param4) {
            return param1.y;
        }
        var _loc5_: Point;
        if (!(_loc5_ = MatrixUtil.fitBounds(param2, param3, param4, param1.explicitWidth, param1.explicitHeight, getPreferredUBoundsWidth(param1), getPreferredUBoundsHeight(param1), getMinUBoundsWidth(param1), getMinUBoundsHeight(param1), getMaxUBoundsWidth(param1), getMaxUBoundsHeight(param1)))) {
            _loc5_ = new Point(getMinUBoundsWidth(param1), getMinUBoundsHeight(param1));
        }
        var _loc6_: Point = new Point();
        MatrixUtil.transformBounds(_loc5_.x, _loc5_.y, param4, _loc6_);
        return _loc6_.y;
    }

    public static function getLayoutBoundsWidth(param1: IUIComponent, param2: Matrix): Number {
        var _loc4_: Number = NaN;
        var _loc3_: Number = Number(param1.width);
        if (false) {
            _loc3_ = param1.scaleX == 0 ? 0 : _loc3_ / Number(param1.scaleX);
        }
        if (param2) {
            _loc4_ = Number(param1.height);
            if (false) {
                _loc4_ = param1.scaleY == 0 ? 0 : _loc4_ / Number(param1.scaleY);
            }
            _loc3_ = MatrixUtil.transformBounds(_loc3_, _loc4_, param2, new Point()).x;
        }
        return _loc3_;
    }

    public static function getLayoutBoundsHeight(param1: IUIComponent, param2: Matrix): Number {
        var _loc4_: Number = NaN;
        var _loc3_: Number = Number(param1.height);
        if (false) {
            _loc3_ = param1.scaleY == 0 ? 0 : _loc3_ / Number(param1.scaleY);
        }
        if (param2) {
            _loc4_ = Number(param1.width);
            if (false) {
                _loc4_ = param1.scaleX == 0 ? 0 : _loc4_ / Number(param1.scaleX);
            }
            _loc3_ = MatrixUtil.transformBounds(_loc4_, _loc3_, param2, new Point()).y;
        }
        return _loc3_;
    }

    public static function getLayoutBoundsX(param1: IUIComponent, param2: Matrix): Number {
        if (param2 == null) {
            return param1.x;
        }
        var _loc3_: Number = Number(param1.width);
        var _loc4_: Number = Number(param1.height);
        if (false) {
            _loc3_ = param1.scaleX == 0 ? 0 : _loc3_ / Number(param1.scaleX);
            _loc4_ = param1.scaleY == 0 ? 0 : _loc4_ / Number(param1.scaleY);
        }
        var _loc5_: Point = new Point();
        MatrixUtil.transformBounds(_loc3_, _loc4_, param2, _loc5_);
        return _loc5_.x;
    }

    public static function getLayoutBoundsY(param1: IUIComponent, param2: Matrix): Number {
        if (param2 == null) {
            return param1.y;
        }
        var _loc3_: Number = Number(param1.width);
        var _loc4_: Number = Number(param1.height);
        if (false) {
            _loc3_ = param1.scaleX == 0 ? 0 : _loc3_ / Number(param1.scaleX);
            _loc4_ = param1.scaleY == 0 ? 0 : _loc4_ / Number(param1.scaleY);
        }
        var _loc5_: Point = new Point();
        MatrixUtil.transformBounds(_loc3_, _loc4_, param2, _loc5_);
        return _loc5_.y;
    }

    public static function setLayoutBoundsPosition(param1: IUIComponent, param2: Number, param3: Number, param4: Matrix): void {
        if (param4) {
            param2 = param2 - getLayoutBoundsX(param1, param4) + param1.x;
            param3 = param3 - getLayoutBoundsY(param1, param4) + param1.y;
        }
        param1.move(param2, param3);
    }

    public static function setLayoutBoundsSize(param1: IUIComponent, param2: Number, param3: Number, param4: Matrix): void {
        if (!param4) {
            if (isNaN(param2)) {
                param2 = getPreferredUBoundsWidth(param1);
            }
            if (isNaN(param3)) {
                param3 = getPreferredUBoundsHeight(param1);
            }
            if (false) {
                param2 *= param1.scaleX;
                param3 *= param1.scaleY;
            }
            param1.setActualSize(param2, param3);
            return;
        }
        var _loc5_: Point;
        if (!(_loc5_ = MatrixUtil.fitBounds(param2, param3, param4, param1.explicitWidth, param1.explicitHeight, getPreferredUBoundsWidth(param1), getPreferredUBoundsHeight(param1), getMinUBoundsWidth(param1), getMinUBoundsHeight(param1), getMaxUBoundsWidth(param1), getMaxUBoundsHeight(param1)))) {
            _loc5_ = new Point(getMinUBoundsWidth(param1), getMinUBoundsHeight(param1));
        }
        if (false) {
            param1.setActualSize(_loc5_.x * Number(param1.scaleX), _loc5_.y * Number(param1.scaleY));
        } else {
            param1.setActualSize(_loc5_.x, _loc5_.y);
        }
    }
}
}
