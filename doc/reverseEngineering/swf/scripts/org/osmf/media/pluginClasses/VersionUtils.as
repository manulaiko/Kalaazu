package org.osmf.media.pluginClasses {

public class VersionUtils {


    public function VersionUtils() {
        super();
    }

    public static function parseVersionString(param1: String): Object {
        var _loc2_: Array = param1.split(".");
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        if (_loc2_.length >= 1) {
            _loc3_ = parseInt(_loc2_[0]);
        }
        if (_loc2_.length >= 2) {
            if ((_loc4_ = parseInt(_loc2_[1])) < 10) {
                _loc4_ *= 10;
            }
        }
        return {
            "major": _loc3_,
            "minor": _loc4_
        };
    }
}
}
