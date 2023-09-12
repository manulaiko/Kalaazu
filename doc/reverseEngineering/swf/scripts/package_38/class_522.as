package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_522 implements ICommand {

    public static const ID: int = 19125;


    public var uid: int = 0;

    public var var_52: int = 0;

    public function class_522(param1: int = 0, param2: int = 0) {
        super();
        this.uid = param1;
        this.var_52 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.uid = param1.readInt();
        this.uid = Number(this.uid) << 12 | Number(this.uid) >>> 20;
        this.var_52 = param1.readInt();
        this.var_52 = Number(this.var_52) >>> 5 | Number(this.var_52) << 27;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(22039);
        param1.writeInt(Number(this.uid) >>> 12 | Number(this.uid) << 20);
        param1.writeInt(Number(this.var_52) << 5 | Number(this.var_52) >>> 27);
        param1.writeShort(3929);
    }
}
}
