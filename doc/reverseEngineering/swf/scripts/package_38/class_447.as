package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_447 implements ICommand {

    public static const const_274: uint = 4;

    public static const ACTIVE: uint = 6;

    public static const const_2265: uint = 3;

    public static const const_980: uint = 0;

    public static const RED_BLINK: uint = 5;

    public static const const_1799: uint = 1;

    public static const const_1290: uint = 2;

    public static const ID: int = 702;


    public var type: uint = 0;

    public function class_447(param1: uint = 0) {
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
        param1.readShort();
        this.type = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-31359);
        param1.writeShort(this.type);
    }
}
}
