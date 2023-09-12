package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_930 implements ICommand {

    public static const const_754: uint = 2;

    public static const const_425: uint = 3;

    public static const const_1930: uint = 1;

    public static const NONE: uint = 0;

    public static const ID: int = 27378;


    public var type: uint = 0;

    public function class_930(param1: uint = 0) {
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
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.type);
    }
}
}
