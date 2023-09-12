package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_953 implements ICommand {

    public static const REJECT: uint = 3;

    public static const REVOKE: uint = 2;

    public static const NONE: uint = 0;

    public static const const_2087: uint = 4;

    public static const TIMEOUT: uint = 1;

    public static const ID: int = 2978;


    public var reason: uint = 0;

    public var var_5058: int = 0;

    public var var_3814: int = 0;

    public function class_953(param1: int = 0, param2: int = 0, param3: uint = 0) {
        super();
        this.var_3814 = param1;
        this.var_5058 = param2;
        this.reason = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.reason = param1.readShort();
        this.var_5058 = param1.readInt();
        this.var_5058 = Number(this.var_5058) >>> 1 | Number(this.var_5058) << 31;
        param1.readShort();
        this.var_3814 = param1.readInt();
        this.var_3814 = Number(this.var_3814) << 14 | Number(this.var_3814) >>> 18;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.reason);
        param1.writeInt(Number(this.var_5058) << 1 | Number(this.var_5058) >>> 31);
        param1.writeShort(-24382);
        param1.writeInt(Number(this.var_3814) >>> 14 | Number(this.var_3814) << 18);
    }
}
}
