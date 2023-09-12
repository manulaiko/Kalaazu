package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_630 implements ICommand {

    public static const const_1899: uint = 14;

    public static const const_272: uint = 12;

    public static const RADIATION: uint = 3;

    public static const const_455: uint = 13;

    public static const SL: uint = 6;

    public static const CID: uint = 7;

    public static const KAMIKAZE: uint = 9;

    public static const ECI: uint = 5;

    public static const LASER: uint = 1;

    public static const ROCKET: uint = 0;

    public static const REPAIR: uint = 10;

    public static const SINGULARITY: uint = 8;

    public static const const_1741: uint = 15;

    public static const PLASMA: uint = 4;

    public static const MINE: uint = 2;

    public static const DECELERATION: uint = 11;

    public static const ID: int = 32205;


    public var var_468: uint = 0;

    public function class_630(param1: uint = 0) {
        super();
        this.var_468 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.var_468 = param1.readShort();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.var_468);
        param1.writeShort(-6647);
    }
}
}
