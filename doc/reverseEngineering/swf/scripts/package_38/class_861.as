package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_861 implements ICommand {

    public static const const_1515: uint = 4;

    public static const const_2167: uint = 1;

    public static const EVENT: uint = 5;

    public static const const_2090: uint = 3;

    public static const const_1906: uint = 2;

    public static const const_2965: uint = 0;

    public static const ID: int = 9520;


    public var type: uint = 0;

    public function class_861(param1: uint = 0) {
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
