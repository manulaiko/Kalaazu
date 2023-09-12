package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_921 implements ICommand {

    public static const ID: int = 3164;


    public var var_2489: int = 0;

    public var name_37: int = 0;

    public function class_921(param1: int = 0, param2: int = 0) {
        super();
        this.var_2489 = param1;
        this.name_37 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_2489 = param1.readInt();
        this.var_2489 = Number(this.var_2489) >>> 5 | Number(this.var_2489) << 27;
        this.name_37 = param1.readInt();
        this.name_37 = Number(this.name_37) << 13 | Number(this.name_37) >>> 19;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-6392);
        param1.writeInt(Number(this.var_2489) << 5 | Number(this.var_2489) >>> 27);
        param1.writeInt(Number(this.name_37) >>> 13 | Number(this.name_37) << 19);
    }
}
}
