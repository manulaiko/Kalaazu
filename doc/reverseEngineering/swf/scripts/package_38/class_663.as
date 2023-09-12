package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_663 implements ICommand {

    public static const ID: int = 23957;


    public var var_4688: int = 0;

    public var level: int = 0;

    public function class_663(param1: int = 0, param2: int = 0) {
        super();
        this.level = param1;
        this.var_4688 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_4688 = param1.readInt();
        this.var_4688 = Number(this.var_4688) >>> 12 | Number(this.var_4688) << 20;
        this.level = param1.readInt();
        this.level = Number(this.level) << 12 | Number(this.level) >>> 20;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-18607);
        param1.writeInt(Number(this.var_4688) << 12 | Number(this.var_4688) >>> 20);
        param1.writeInt(Number(this.level) >>> 12 | Number(this.level) << 20);
    }
}
}
