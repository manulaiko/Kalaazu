package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_858 implements ICommand {

    public static const ID: int = 28243;


    public var var_2565: int = 0;

    public var var_4071: int = 0;

    public function class_858(param1: int = 0, param2: int = 0) {
        super();
        this.var_2565 = param1;
        this.var_4071 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_2565 = param1.readInt();
        this.var_2565 = Number(this.var_2565) << 8 | Number(this.var_2565) >>> 24;
        param1.readShort();
        this.var_4071 = param1.readInt();
        this.var_4071 = Number(this.var_4071) << 16 | Number(this.var_4071) >>> 16;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_2565) >>> 8 | Number(this.var_2565) << 24);
        param1.writeShort(-9661);
        param1.writeInt(Number(this.var_4071) >>> 16 | Number(this.var_4071) << 16);
    }
}
}
