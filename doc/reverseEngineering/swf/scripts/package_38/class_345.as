package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_345 implements ICommand {

    public static const const_1505: uint = 2;

    public static const const_3192: uint = 9;

    public static const const_347: uint = 6;

    public static const const_667: uint = 8;

    public static const const_1445: uint = 0;

    public static const const_1510: uint = 1;

    public static const const_2655: uint = 4;

    public static const const_263: uint = 5;

    public static const const_2251: uint = 7;

    public static const const_598: uint = 3;

    public static const ID: int = 11653;


    public var var_1785: uint = 0;

    public function class_345(param1: uint = 0) {
        super();
        this.var_1785 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.var_1785 = param1.readShort();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.var_1785);
        param1.writeShort(20436);
    }
}
}
