package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_636 implements ICommand {

    public static const ROCKET: uint = 1;

    public static const const_1466: uint = 2;

    public static const LASER: uint = 0;

    public static const ID: int = 8012;


    public var var_1531: int = 0;

    public var var_3730: int = 0;

    public var var_861: uint = 0;

    public function class_636(param1: uint = 0, param2: int = 0, param3: int = 0) {
        super();
        this.var_861 = param1;
        this.var_1531 = param2;
        this.var_3730 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_1531 = param1.readInt();
        this.var_1531 = Number(this.var_1531) << 5 | Number(this.var_1531) >>> 27;
        param1.readShort();
        this.var_3730 = param1.readInt();
        this.var_3730 = Number(this.var_3730) << 6 | Number(this.var_3730) >>> 26;
        param1.readShort();
        this.var_861 = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_1531) >>> 5 | Number(this.var_1531) << 27);
        param1.writeShort(28732);
        param1.writeInt(Number(this.var_3730) >>> 6 | Number(this.var_3730) << 26);
        param1.writeShort(-9202);
        param1.writeShort(this.var_861);
    }
}
}
