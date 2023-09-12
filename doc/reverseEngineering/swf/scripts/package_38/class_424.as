package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_424 implements ICommand {

    public static const const_759: uint = 3;

    public static const KAMIKAZE: uint = 10;

    public static const const_3314: uint = 12;

    public static const const_1202: uint = 8;

    public static const const_1535: uint = 13;

    public static const const_1176: uint = 4;

    public static const const_1631: uint = 7;

    public static const const_1359: uint = 1;

    public static const const_1591: uint = 5;

    public static const const_1019: uint = 11;

    public static const const_1735: uint = 0;

    public static const const_278: uint = 2;

    public static const const_265: uint = 9;

    public static const const_1740: uint = 6;

    public static const ID: int = 18943;


    public var var_2008: uint = 0;

    public function class_424(param1: uint = 0) {
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
        param1.writeShort(-13816);
        param1.writeShort(-7374);
        param1.writeShort(this.var_2008);
    }
}
}
