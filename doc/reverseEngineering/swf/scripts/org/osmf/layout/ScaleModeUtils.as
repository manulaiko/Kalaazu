package org.osmf.layout {

import flash.geom.Point;

class ScaleModeUtils {


    function ScaleModeUtils() {
        super();
    }

    public static function getScaledSize(param1: String, param2: Number, param3: Number, param4: Number, param5: Number): Point {
        var _loc6_: * = null;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        switch (param1) {
            case ScaleMode.ZOOM:
            case ScaleMode.LETTERBOX:
                _loc7_ = param2 / param3;
                _loc8_ = (param4 || param2) / (param5 || param3);
                if (param1 == ScaleMode.ZOOM && _loc8_ < _loc7_ || param1 == ScaleMode.LETTERBOX && _loc8_ > _loc7_) {
                    _loc6_ = new Point(param2, param2 / _loc8_);
                    break;
                }
                _loc6_ = new Point(param3 * _loc8_, param3);
                break;
            case ScaleMode.STRETCH:
                _loc6_ = new Point(param2, param3);
                break;
            case ScaleMode.NONE:
                _loc6_ = new Point(param4 || param2, param5 || param3);
        }
        return _loc6_;
    }
}
}
