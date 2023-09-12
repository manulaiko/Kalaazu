package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_559 implements ICommand {

    public static const ID: int = 4159;


    public var uid: int = 0;

    public var var_3597: int = 0;

    public function class_559(param1: int = 0, param2: int = 0) {
        super();
        this.uid = param1;
        this.var_3597 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        param1.readShort();
        this.uid = param1.readInt();
        this.uid = Number(this.uid) >>> 2 | Number(this.uid) << 30;
        this.var_3597 = param1.readInt();
        this.var_3597 = Number(this.var_3597) << 10 | Number(this.var_3597) >>> 22;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-29097);
        param1.writeShort(28868);
        param1.writeInt(Number(this.uid) << 2 | Number(this.uid) >>> 30);
        param1.writeInt(Number(this.var_3597) >>> 10 | Number(this.var_3597) << 22);
    }
}
}
