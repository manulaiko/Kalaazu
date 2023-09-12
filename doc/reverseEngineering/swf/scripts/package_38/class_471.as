package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_471 implements ICommand {

    public static const const_1327: uint = 7;

    public static const const_2901: uint = 1;

    public static const const_898: uint = 8;

    public static const const_2195: uint = 2;

    public static const const_687: uint = 3;

    public static const const_351: uint = 6;

    public static const const_1456: uint = 0;

    public static const const_220: uint = 5;

    public static const MINE: uint = 4;

    public static const ID: int = 22230;


    public var var_1612: uint = 0;

    public function class_471(param1: uint = 0) {
        super();
        this.var_1612 = param1;
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
        this.var_1612 = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(18316);
        param1.writeShort(-1820);
        param1.writeShort(this.var_1612);
    }
}
}
