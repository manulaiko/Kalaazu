package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_752 implements ICommand {

    public static const ID: int = 2646;


    public var var_4803: Boolean = false;

    public var var_2245: int = 0;

    public function class_752(param1: int = 0, param2: Boolean = false) {
        super();
        this.var_2245 = param1;
        this.var_4803 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        this.var_4803 = param1.readBoolean();
        this.var_2245 = param1.readInt();
        this.var_2245 = Number(this.var_2245) >>> 14 | Number(this.var_2245) << 18;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.var_4803);
        param1.writeInt(Number(this.var_2245) << 14 | Number(this.var_2245) >>> 18);
    }
}
}
