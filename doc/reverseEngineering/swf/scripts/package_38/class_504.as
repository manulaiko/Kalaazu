package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_504 implements ICommand {

    public static const ID: int = 26054;


    public var var_2050: Boolean = false;

    public function class_504(param1: Boolean = false) {
        super();
        this.var_2050 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 1;
    }

    public function read(param1: IDataInput): void {
        this.var_2050 = param1.readBoolean();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.var_2050);
        param1.writeShort(-28279);
    }
}
}
