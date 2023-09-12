package org.osmf.media {

public class MediaTypeUtil {

    public static const METADATA_MATCH_FOUND: int = 0;

    public static const METADATA_CONFLICTS_FOUND: int = 1;

    public static const METADATA_MATCH_UNKNOWN: int = 2;


    public function MediaTypeUtil() {
        super();
    }

    public static function checkMetadataMatchWithResource(param1: MediaResourceBase, param2: Vector.<String>, param3: Vector.<String>): int {
        var _loc4_: String = !!param1 ? param1.mediaType : null;
        var _loc5_: String = !!param1 ? param1.mimeType : null;
        return checkMetadataMatch(_loc4_, _loc5_, param2, param3);
    }

    public static function checkMetadataMatch(param1: String, param2: String, param3: Vector.<String>, param4: Vector.<String>): int {
        if (param1 != null) {
            if (param2 != null) {
                return matchType(param1, param3) && matchType(param2, param4) ? METADATA_MATCH_FOUND : METADATA_CONFLICTS_FOUND;
            }
            return matchType(param1, param3) ? METADATA_MATCH_FOUND : METADATA_CONFLICTS_FOUND;
        }
        if (param2 != null) {
            return matchType(param2, param4) ? METADATA_MATCH_FOUND : METADATA_CONFLICTS_FOUND;
        }
        return METADATA_MATCH_UNKNOWN;
    }

    private static function matchType(param1: String, param2: Vector.<String>): Boolean {
        var _loc3_: int = 0;
        while (_loc3_ < param2.length) {
            if (param1 == param2[_loc3_]) {
                return true;
            }
            _loc3_++;
        }
        return false;
    }
}
}
