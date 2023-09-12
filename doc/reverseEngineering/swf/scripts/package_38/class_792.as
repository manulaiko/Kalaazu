package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_792 implements ICommand {

    public static const ID: int = 11252;


    public var var_1898: int = 0;

    public var var_3657: int = 0;

    public var var_4723: int = 0;

    public function class_792(param1: int = 0, param2: int = 0, param3: int = 0) {
        super();
        this.var_4723 = param1;
        this.var_3657 = param2;
        this.var_1898 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 12;
    }

    public function read(param1: IDataInput): void {
        this.var_1898 = param1.readInt();
        this.var_1898 = Number(this.var_1898) >>> 8 | Number(this.var_1898) << 24;
        this.var_3657 = param1.readInt();
        this.var_3657 = Number(this.var_3657) >>> 11 | Number(this.var_3657) << 21;
        this.var_4723 = param1.readInt();
        this.var_4723 = Number(this.var_4723) >>> 16 | Number(this.var_4723) << 16;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_1898) << 8 | Number(this.var_1898) >>> 24);
        param1.writeInt(Number(this.var_3657) << 11 | Number(this.var_3657) >>> 21);
        param1.writeInt(Number(this.var_4723) << 16 | Number(this.var_4723) >>> 16);
    }
}
}
