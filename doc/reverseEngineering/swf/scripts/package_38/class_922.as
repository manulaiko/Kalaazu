package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_922 implements ICommand {

    public static const const_3237: uint = 1;

    public static const const_1303: uint = 2;

    public static const const_802: uint = 3;

    public static const const_1028: uint = 0;

    public static const ID: int = 1116;


    public var var_2209: uint = 0;

    public function class_922(param1: uint = 0) {
        super();
        this.var_2209 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.var_2209 = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.var_2209);
    }
}
}
