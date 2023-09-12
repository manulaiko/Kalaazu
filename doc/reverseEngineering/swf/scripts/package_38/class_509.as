package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_509 implements ICommand {

    public static const ID: int = 30647;


    public var key: String = "";

    public var value: String = "";

    public function class_509(param1: String = "", param2: String = "") {
        super();
        this.key = param1;
        this.value = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.key = param1.readUTF();
        param1.readShort();
        param1.readShort();
        this.value = param1.readUTF();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.key);
        param1.writeShort(-13163);
        param1.writeShort(-3387);
        param1.writeUTF(this.value);
    }
}
}
