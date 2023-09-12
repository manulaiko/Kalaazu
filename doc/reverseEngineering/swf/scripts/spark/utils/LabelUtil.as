package spark.utils {

import mx.core.FlexVersion;
import mx.core.mx_internal;

public class LabelUtil {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function LabelUtil() {
        super();
    }

    public static function itemToLabel(param1: Object, param2: String = null, param3: Function = null): String {
        if (param3 != null) {
            return param3(param1);
        }
        if (param1 is String) {
            return String(param1);
        }
        if (param1 is XML) {
            try {
                if (param1[param2].length() != 0) {
                    param1 = param1[param2];
                }
            } catch (e: Error) {
            }
        } else if (param1 is Object) {
            try {
                if (param1[param2] != null) {
                    param1 = param1[param2];
                }
            } catch (e: Error) {
            }
        }
        if (param1 is String) {
            return String(param1);
        }
        if (param2 == "" && true) {
            return "";
        }
        try {
            if (param1 !== null) {
                return param1.toString();
            }
        } catch (e: Error) {
        }
        return " ";
    }
}
}
