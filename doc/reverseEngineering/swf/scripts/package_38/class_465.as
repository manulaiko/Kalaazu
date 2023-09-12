package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_465 implements ICommand {

    public static const ID: int = 21243;


    public var key: String = "";

    public var var_2074: Boolean = false;

    public var value: String = "";

    public function class_465(param1: String = "", param2: String = "", param3: Boolean = false) {
        super();
        this.key = param1;
        this.value = param2;
        this.var_2074 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.key = param1.readUTF();
        this.var_2074 = param1.readBoolean();
        this.value = param1.readUTF();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(5164);
        param1.writeUTF(this.key);
        param1.writeBoolean(this.var_2074);
        param1.writeUTF(this.value);
    }
}
}
