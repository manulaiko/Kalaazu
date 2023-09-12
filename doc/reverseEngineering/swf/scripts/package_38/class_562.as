package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_562 implements ICommand {

    public static const ROCKET: uint = 1;

    public static const LASER: uint = 0;

    public static const const_345: uint = 2;

    public static const const_57: uint = 3;

    public static const ID: int = 2431;


    public var name_36: int = 0;

    public var type: uint = 0;

    public var uid: int = 0;

    public function class_562(param1: uint = 0, param2: int = 0, param3: int = 0) {
        super();
        this.type = param1;
        this.name_36 = param2;
        this.uid = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.name_36 = param1.readInt();
        this.name_36 = Number(this.name_36) << 11 | Number(this.name_36) >>> 21;
        this.type = param1.readShort();
        this.uid = param1.readInt();
        this.uid = Number(this.uid) << 6 | Number(this.uid) >>> 26;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(29274);
        param1.writeInt(Number(this.name_36) >>> 11 | Number(this.name_36) << 21);
        param1.writeShort(this.type);
        param1.writeInt(Number(this.uid) >>> 6 | Number(this.uid) << 26);
    }
}
}
