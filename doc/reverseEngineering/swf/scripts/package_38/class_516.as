package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_516 implements ICommand {

    public static const const_2879: uint = 7;

    public static const const_3137: uint = 6;

    public static const const_2309: uint = 3;

    public static const const_2793: uint = 1;

    public static const const_2803: uint = 2;

    public static const CENTER: uint = 8;

    public static const const_984: uint = 5;

    public static const const_3072: uint = 4;

    public static const const_766: uint = 0;

    public static const ID: int = 25052;


    public var var_4112: uint = 0;

    public function class_516(param1: uint = 0) {
        super();
        this.var_4112 = param1;
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
        this.var_4112 = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(26979);
        param1.writeShort(27784);
        param1.writeShort(this.var_4112);
    }
}
}
