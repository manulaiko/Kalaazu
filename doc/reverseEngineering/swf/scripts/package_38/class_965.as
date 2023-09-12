package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_965 implements ICommand {

    public static const const_2938: uint = 1;

    public static const const_170: uint = 2;

    public static const CARGO: uint = 0;

    public static const ID: int = 22208;


    public var var_3224: int = 0;

    public var var_4028: uint = 0;

    public function class_965(param1: uint = 0, param2: int = 0) {
        super();
        this.var_4028 = param1;
        this.var_3224 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.var_3224 = param1.readInt();
        this.var_3224 = Number(this.var_3224) >>> 16 | Number(this.var_3224) << 16;
        this.var_4028 = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_3224) << 16 | Number(this.var_3224) >>> 16);
        param1.writeShort(this.var_4028);
    }
}
}
