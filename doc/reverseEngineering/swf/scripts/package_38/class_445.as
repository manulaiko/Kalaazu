package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_445 implements ICommand {

    public static const const_443: uint = 56;

    public static const const_2838: uint = 35;

    public static const const_883: uint = 6;

    public static const WRECK: uint = 32;

    public static const const_1022: uint = 19;

    public static const const_784: uint = 49;

    public static const const_2062: uint = 11;

    public static const const_2246: uint = 44;

    public static const const_942: uint = 36;

    public static const const_2695: uint = 40;

    public static const const_2477: uint = 46;

    public static const const_2484: uint = 29;

    public static const const_1093: uint = 7;

    public static const const_771: uint = 59;

    public static const const_3105: uint = 38;

    public static const const_229: uint = 51;

    public static const const_63: uint = 55;

    public static const const_2880: uint = 26;

    public static const const_603: uint = 48;

    public static const const_1965: uint = 47;

    public static const const_2522: uint = 39;

    public static const const_2904: uint = 8;

    public static const const_287: uint = 58;

    public static const const_1417: uint = 41;

    public static const const_192: uint = 22;

    public static const const_1127: uint = 17;

    public static const const_3031: uint = 50;

    public static const const_1119: uint = 9;

    public static const const_2485: uint = 12;

    public static const const_821: uint = 27;

    public static const const_2034: uint = 33;

    public static const const_1357: uint = 23;

    public static const const_2059: uint = 24;

    public static const const_391: uint = 18;

    public static const const_1363: uint = 25;

    public static const const_1795: uint = 37;

    public static const const_871: uint = 5;

    public static const const_2100: uint = 45;

    public static const const_1457: uint = 21;

    public static const const_451: uint = 28;

    public static const const_2308: uint = 4;

    public static const const_1208: uint = 54;

    public static const const_429: uint = 16;

    public static const const_857: uint = 3;

    public static const const_3251: uint = 30;

    public static const const_2741: uint = 15;

    public static const const_2605: uint = 2;

    public static const const_1759: uint = 31;

    public static const const_3199: uint = 43;

    public static const const_2947: uint = 52;

    public static const const_2422: uint = 13;

    public static const const_715: uint = 42;

    public static const const_2250: uint = 20;

    public static const const_1835: uint = 1;

    public static const const_477: uint = 14;

    public static const const_2141: uint = 0;

    public static const const_2209: uint = 57;

    public static const const_2448: uint = 53;

    public static const const_1178: uint = 34;

    public static const const_259: uint = 10;

    public static const ID: int = 15758;


    public var var_2008: uint = 0;

    public function class_445(param1: uint = 0) {
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
        param1.writeShort(-2023);
        param1.writeShort(-17738);
        param1.writeShort(this.var_2008);
    }
}
}
