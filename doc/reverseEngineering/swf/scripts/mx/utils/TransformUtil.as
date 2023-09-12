package mx.utils {

import flash.display.DisplayObject;
import flash.geom.Point;
import flash.geom.Vector3D;

import mx.core.AdvancedLayoutFeatures;
import mx.core.mx_internal;

public final class TransformUtil {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var xformPt: Point;


    public function TransformUtil() {
        super();
    }

    private static function needAdvancedLayout(param1: Vector3D, param2: Vector3D, param3: Vector3D, param4: Vector3D, param5: Vector3D, param6: Vector3D, param7: Vector3D): Boolean {
        return param2 != null && (!isNaN(param2.x) && param2.x != 1 || !isNaN(param2.y) && param2.y != 1 || !isNaN(param2.z) && param2.z != 1) || param3 != null && (!isNaN(param3.x) && param3.x != 0 || !isNaN(param3.y) && param3.y != 0 || !isNaN(param3.z) && param3.z != 0) || param4 != null && param4.z != 0 && !isNaN(param4.z) || param5 != null || param6 != null || param7 != null && (param4 == null || param7.x != param4.x || param7.y != param4.y || param7.z != param4.z);
    }

    public static function transformAround(param1: DisplayObject, param2: Vector3D, param3: Vector3D = null, param4: Vector3D = null, param5: Vector3D = null, param6: Vector3D = null, param7: Vector3D = null, param8: Vector3D = null, param9: AdvancedLayoutFeatures = null, param10: Function = null): void {
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc11_: Boolean;
        if (_loc11_ = Boolean(param9) || needAdvancedLayout(param2, param3, param4, param5, param6, param7, param8)) {
            if (!param9 && param10 != null) {
                param9 = param10();
            }
            if (param9) {
                param9.transformAround(param2, param3, param4, param5, param6, param7, param8);
            }
            return;
        }
        if (param5 == null && param2 != null) {
            if (xformPt == null) {
                xformPt = new Point();
            }
            xformPt.x = param2.x;
            xformPt.y = param2.y;
            _loc12_ = param1.transform.matrix.transformPoint(xformPt);
        }
        if (param4 != null && !isNaN(param4.z)) {
            param1.rotation = param4.z;
        }
        if (param3 != null) {
            param1.scaleX = param3.x;
            param1.scaleY = param3.y;
        }
        if (param2 == null) {
            if (param5 != null) {
                param1.x = param5.x;
                param1.y = param5.y;
            }
        } else {
            if (xformPt == null) {
                xformPt = new Point();
            }
            xformPt.x = param2.x;
            xformPt.y = param2.y;
            _loc13_ = param1.transform.matrix.transformPoint(xformPt);
            if (param5 != null) {
                param1.x += param5.x - _loc13_.x;
                param1.y += param5.y - _loc13_.y;
            } else {
                param1.x += _loc12_.x - _loc13_.x;
                param1.y += _loc12_.y - _loc13_.y;
            }
        }
    }

    public static function transformPointToParent(param1: DisplayObject, param2: Vector3D, param3: Vector3D, param4: Vector3D, param5: AdvancedLayoutFeatures): void {
        if (param5) {
            param5.transformPointToParent(true, param2, param3, param4);
            return;
        }
        if (xformPt == null) {
            xformPt = new Point();
        }
        if (param2) {
            xformPt.x = param2.x;
            xformPt.y = param2.y;
        } else {
            xformPt.x = 0;
            xformPt.y = 0;
        }
        var _loc6_: Point = param1.transform.matrix != null ? param1.transform.matrix.transformPoint(xformPt) : xformPt;
        if (param3 != null) {
            param3.x = _loc6_.x;
            param3.y = _loc6_.y;
            param3.z = 0;
        }
        if (param4 != null) {
            param4.x = _loc6_.x;
            param4.y = _loc6_.y;
            param4.z = 0;
        }
    }
}
}
