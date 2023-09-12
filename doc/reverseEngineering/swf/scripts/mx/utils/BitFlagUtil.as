package mx.utils {

public class BitFlagUtil {


    public function BitFlagUtil() {
        super();
    }

    public static function isSet(param1: uint, param2: uint): Boolean {
        return param2 == (param1 & param2);
    }

    public static function update(param1: uint, param2: uint, param3: Boolean): uint {
        if (param3) {
            if ((param1 & param2) == param2) {
                return param1;
            }
            param1 |= param2;
        } else {
            if ((param1 & param2) == 0) {
                return param1;
            }
            param1 &= ~param2;
        }
        return param1;
    }
}
}
