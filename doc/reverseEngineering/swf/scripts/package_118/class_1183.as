package package_118 {

class class_1183 extends class_325 {

    private static const const_1739: Array = ["quantity", "year", "month", "day", "hour", "minute", "second", "millisecond", "currencyBig", "currencySmall", "currencyTotal"];


    function class_1183() {
        super();
    }

    public static function get method_5758(): String {
        return const_1739[0];
    }

    public static function get method_4279(): String {
        return const_1739[1];
    }

    public static function get method_5537(): String {
        return const_1739[2];
    }

    public static function get method_5171(): String {
        return const_1739[3];
    }

    public static function get method_2952(): String {
        return const_1739[4];
    }

    public static function get method_1933(): String {
        return const_1739[5];
    }

    public static function get method_2102(): String {
        return const_1739[6];
    }

    public static function get method_152(): String {
        return const_1739[7];
    }

    public static function get method_3038(): String {
        return const_1739[8];
    }

    public static function get method_764(): String {
        return const_1739[9];
    }

    public static function get method_6184(): String {
        return const_1739[10];
    }

    public static function method_3504(param1: String): Boolean {
        var _loc2_: Number = 0;
        var _loc3_: Number = 0;
        while (_loc3_ < _loc2_) {
            if (param1 == const_1739[_loc3_]) {
                return true;
            }
            _loc3_++;
        }
        return false;
    }

    override public function set name(param1: String): void {
        var _loc2_: Number = 0;
        var _loc3_: Number = 0;
        while (_loc3_ < _loc2_) {
            if (param1 == const_1739[_loc3_]) {
                super.name = const_1739[_loc3_];
                return;
            }
            _loc3_++;
        }
        throw new Error(param1 + " is not a valid SystemPlaceholder name.");
    }
}
}
