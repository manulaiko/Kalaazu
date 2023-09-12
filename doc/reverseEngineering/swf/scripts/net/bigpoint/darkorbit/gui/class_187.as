package net.bigpoint.darkorbit.gui {

public class class_187 {

    public static const const_1785: String = "HP";

    public static const const_1495: String = "ST";

    public static const const_413: String = "LO";

    public static const const_2223: int = 4;

    public static const const_2627: int = 10;


    public function class_187() {
        super();
    }

    public static function method_4915(param1: String): class_133 {
        var _loc2_: class_133 = new class_133(param1);
        _loc2_.displayTime = method_5520(param1);
        _loc2_.var_3148 = method_4723(param1);
        return _loc2_;
    }

    private static function method_4723(param1: String): Boolean {
        return param1 == const_1785;
    }

    private static function method_5520(param1: String): int {
        if (param1 == const_1495) {
            return const_2223;
        }
        return const_2627;
    }
}
}
