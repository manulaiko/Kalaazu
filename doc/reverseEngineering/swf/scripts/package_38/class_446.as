package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_446 implements ICommand {

    public static const ID: int = 31269;


    public var uid: String = "";

    public function class_446(param1: String = "") {
        super();
        this.uid = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 2;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.uid = param1.readUTF();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-27732);
        param1.writeUTF(this.uid);
    }
}
}
