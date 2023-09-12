package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_683 implements ICommand {

    public static const const_826: uint = 8;

    public static const const_82: uint = 13;

    public static const const_1812: uint = 17;

    public static const const_495: uint = 6;

    public static const const_341: uint = 15;

    public static const const_2075: uint = 3;

    public static const const_1983: uint = 16;

    public static const const_251: uint = 12;

    public static const const_524: uint = 7;

    public static const const_838: uint = 0;

    public static const const_912: uint = 14;

    public static const const_2559: uint = 11;

    public static const const_2541: uint = 10;

    public static const const_593: uint = 9;

    public static const const_1509: uint = 1;

    public static const const_2362: uint = 4;

    public static const const_2444: uint = 18;

    public static const const_2249: uint = 2;

    public static const const_2906: uint = 5;

    public static const ID: int = 20259;


    public var type: uint = 0;

    public function class_683(param1: uint = 0) {
        super();
        this.type = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.type = param1.readShort();
        param1.readShort();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.type);
        param1.writeShort(-1134);
        param1.writeShort(-7171);
    }
}
}
