package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_427 implements ICommand {

    public static const const_1834: uint = 45;

    public static const const_1023: uint = 35;

    public static const const_642: uint = 34;

    public static const RSB: uint = 20;

    public static const const_574: uint = 26;

    public static const const_1727: uint = 43;

    public static const const_118: uint = 18;

    public static const SAR02: uint = 25;

    public static const EMP: uint = 17;

    public static const const_768: uint = 29;

    public static const const_1675: uint = 15;

    public static const const_2195: uint = 7;

    public static const const_2507: uint = 1;

    public static const PLASMA: uint = 16;

    public static const const_351: uint = 11;

    public static const const_1773: uint = 33;

    public static const const_2517: uint = 37;

    public static const const_687: uint = 8;

    public static const const_1239: uint = 27;

    public static const const_898: uint = 14;

    public static const const_2653: uint = 31;

    public static const ROCKET: uint = 0;

    public static const CBR: uint = 39;

    public static const const_387: uint = 4;

    public static const const_3284: uint = 28;

    public static const const_329: uint = 42;

    public static const const_536: uint = 23;

    public static const const_439: uint = 19;

    public static const const_220: uint = 10;

    public static const const_1987: uint = 3;

    public static const const_3078: uint = 41;

    public static const SAR01: uint = 24;

    public static const const_1150: uint = 44;

    public static const const_3055: uint = 13;

    public static const const_1456: uint = 5;

    public static const const_2901: uint = 6;

    public static const const_2345: uint = 36;

    public static const const_2352: uint = 32;

    public static const const_1327: uint = 12;

    public static const const_1859: uint = 2;

    public static const DECELERATION: uint = 38;

    public static const const_2799: uint = 40;

    public static const SAB: uint = 30;

    public static const const_345: uint = 21;

    public static const const_542: uint = 22;

    public static const MINE: uint = 9;

    public static const ID: int = 27509;


    public var var_2008: uint = 0;

    public function class_427(param1: uint = 0) {
        super();
        this.var_2008 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        param1.readShort();
        this.var_2008 = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(20008);
        param1.writeShort(31019);
        param1.writeShort(this.var_2008);
    }
}
}
