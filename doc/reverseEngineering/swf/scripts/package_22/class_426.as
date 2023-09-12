package package_22 {

import package_38.class_427;

public class class_426 extends class_221 {

    public static const const_1543: int = -1;

    public static const const_1619: int = 0;

    public static const const_2574: int = 100;

    public static const const_2352: int = 1;

    public static const const_2768: int = 2;

    public static const const_3242: int = 3;

    public static const const_1251: int = 4;

    public static const const_2987: int = 5;

    public static const WIZ: int = 6;

    public static const const_2290: int = 7;

    public static const const_1908: int = 8;

    public static const const_3215: int = 9;

    public static const const_2142: int = 52;

    public static const const_2854: int = 10;

    public static const const_1911: int = 11;

    public static const const_349: int = 12;

    public static const const_1758: int = 13;

    public static const CBR: int = 14;

    public static const const_1360: int = 16;

    public static const const_959: int = 18;


    private var var_3487: int;

    public function class_426(param1: int, param2: int, param3: String) {
        super(param2, param3);
        this.var_3487 = param1;
    }

    public static function method_4552(param1: int): Boolean {
        switch (param1) {
            case const_2290:
            case const_1908:
            case const_3215:
            case const_349:
            case const_1758:
            case CBR:
            case const_1360:
                return true;
            default:
                return false;
        }
    }

    public static function method_4616(param1: int): int {
        switch (param1) {
            case class_427.const_2352:
                return const_2352;
            case class_427.const_642:
                return const_3242;
            case class_427.const_1773:
                return const_2768;
            case class_427.const_1023:
                return const_1251;
            case class_427.const_2345:
                return const_1911;
            case class_427.PLASMA:
                return const_2987;
            case class_427.const_1859:
                return WIZ;
            case class_427.DECELERATION:
                return const_2854;
            case class_427.const_345:
                return const_2290;
            case class_427.const_542:
                return const_1908;
            case class_427.const_536:
                return const_3215;
            case class_427.SAR01:
                return const_349;
            case class_427.SAR02:
                return const_1758;
            case class_427.CBR:
                return CBR;
            case class_427.const_329:
                return const_1360;
            case class_427.const_1834:
                return const_959;
            default:
                return const_1543;
        }
    }

    public function method_3799(): int {
        return this.var_3487;
    }

    public function toString(): String {
        return "RocketPattern id:" + var_4413 + " resKey:" + resKey + " class:" + this.var_3487;
    }
}
}
