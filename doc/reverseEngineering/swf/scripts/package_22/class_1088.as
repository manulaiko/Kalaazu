package package_22 {

import package_38.class_427;

public class class_1088 extends class_221 {

    public static const const_3145: int = -1;

    public static const const_574: int = 0;

    public static const const_1239: int = 1;

    public static const const_3284: int = 2;

    public static const const_768: int = 3;

    public static const const_2952: int = 4;

    public static const const_1880: int = 5;

    public static const const_1905: int = 6;

    public static const const_3078: int = 8;


    private var var_1995: int;

    private var fireRate: int;

    public var laserLength: int;

    private var absorber: Boolean;

    private var speed: Number = 0.15;

    public var playLoop: Boolean;

    private var playLoopRotated: Boolean;

    private var attackLength: int = 1350;

    public var skillResKey: String;

    public var ignoreLaserPoints: Boolean;

    public var xml: XML;

    public var muzzleFlashResKey: String;

    public var lightColor: uint;

    public var laserType: String;

    public function class_1088(param1: int, param2: String, param3: int) {
        super(param1, param2);
        this.fireRate = param3;
    }

    public static function method_5597(param1: int): int {
        switch (param1) {
            case const_574:
                return class_427.const_574;
            case const_1239:
                return class_427.const_1239;
            case const_3284:
                return class_427.const_3284;
            case const_768:
                return class_427.const_768;
            case const_2952:
                return class_427.SAB;
            case const_1880:
                return class_427.RSB;
            case const_1905:
                return class_427.const_2653;
            case const_3078:
                return class_427.const_3078;
            default:
                return const_3145;
        }
    }

    public static function method_4616(param1: int): int {
        switch (param1) {
            case class_427.const_574:
                return const_574;
            case class_427.const_1239:
                return const_1239;
            case class_427.const_3284:
                return const_3284;
            case class_427.const_768:
                return const_768;
            case class_427.SAB:
                return const_2952;
            case class_427.RSB:
                return const_1880;
            case class_427.const_2653:
                return const_1905;
            case class_427.const_3078:
                return const_3078;
            default:
                return const_3145;
        }
    }

    public function method_5011(): int {
        return this.fireRate;
    }

    public function method_4519(): int {
        return this.var_1995;
    }

    public function method_2556(): Boolean {
        return this.absorber;
    }

    public function method_3084(param1: Boolean): void {
        this.absorber = param1;
    }

    public function method_4447(): Number {
        return this.speed;
    }

    public function setSpeed(param1: Number): void {
        this.speed = param1;
    }

    public function method_5218(param1: Boolean): void {
        this.playLoop = param1;
    }

    public function method_6106(): Boolean {
        return this.playLoopRotated;
    }

    public function method_3919(param1: Boolean): void {
        this.playLoopRotated = param1;
    }

    public function method_5234(): int {
        return this.attackLength;
    }

    public function method_3469(param1: int): void {
        this.attackLength = param1;
    }
}
}
