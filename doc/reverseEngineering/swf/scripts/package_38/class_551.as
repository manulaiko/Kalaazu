package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_551 implements ICommand {

    public static const ID: int = 31812;


    public var var_4677: Boolean = false;

    public var var_24: Boolean = false;

    public function class_551(param1: Boolean = false, param2: Boolean = false) {
        super();
        this.var_4677 = param1;
        this.var_24 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 2;
    }

    public function read(param1: IDataInput): void {
        this.var_4677 = param1.readBoolean();
        this.var_24 = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.var_4677);
        param1.writeBoolean(this.var_24);
    }
}
}
