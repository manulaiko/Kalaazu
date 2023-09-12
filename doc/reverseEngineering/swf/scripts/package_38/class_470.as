package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_470 implements ICommand {

    public static const ID: int = 9174;


    public var var_4568: Boolean = false;

    public var var_3121: Boolean = false;

    public var var_2692: Boolean = false;

    public function class_470(param1: Boolean = false, param2: Boolean = false, param3: Boolean = false) {
        super();
        this.var_4568 = param1;
        this.var_3121 = param2;
        this.var_2692 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 3;
    }

    public function read(param1: IDataInput): void {
        this.var_4568 = param1.readBoolean();
        this.var_3121 = param1.readBoolean();
        this.var_2692 = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.var_4568);
        param1.writeBoolean(this.var_3121);
        param1.writeBoolean(this.var_2692);
    }
}
}
