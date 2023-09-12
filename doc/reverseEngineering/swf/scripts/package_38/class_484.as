package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_484 implements ICommand {

    public static const ID: int = 19450;


    public var var_4458: String = "";

    public var simple: Boolean = false;

    public function class_484(param1: Boolean = false, param2: String = "") {
        super();
        this.simple = param1;
        this.var_4458 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 3;
    }

    public function read(param1: IDataInput): void {
        this.var_4458 = param1.readUTF();
        this.simple = param1.readBoolean();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.var_4458);
        param1.writeBoolean(this.simple);
        param1.writeShort(-9196);
    }
}
}
