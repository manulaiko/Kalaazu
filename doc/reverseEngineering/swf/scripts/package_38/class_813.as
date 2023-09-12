package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_813 implements ICommand {

    public static const ID: int = 4082;


    public var var_2905: int = 0;

    public var var_2882: int = 0;

    public function class_813(param1: int = 0, param2: int = 0) {
        super();
        this.var_2882 = param1;
        this.var_2905 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_2905 = param1.readInt();
        this.var_2905 = Number(this.var_2905) >>> 2 | Number(this.var_2905) << 30;
        this.var_2882 = param1.readInt();
        this.var_2882 = Number(this.var_2882) >>> 8 | Number(this.var_2882) << 24;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_2905) << 2 | Number(this.var_2905) >>> 30);
        param1.writeInt(Number(this.var_2882) << 8 | Number(this.var_2882) >>> 24);
        param1.writeShort(-5122);
    }
}
}
