package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_619 implements ICommand {

    public static const ID: int = 9461;


    public var key: String = "";

    public var var_2074: Boolean = false;

    public function class_619(param1: String = "", param2: Boolean = false) {
        super();
        this.key = param1;
        this.var_2074 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 3;
    }

    public function read(param1: IDataInput): void {
        this.key = param1.readUTF();
        this.var_2074 = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.key);
        param1.writeBoolean(this.var_2074);
    }
}
}
