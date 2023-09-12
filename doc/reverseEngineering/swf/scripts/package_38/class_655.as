package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_655 implements ICommand {

    public static const ID: int = 24512;


    public var var_971: Boolean = false;

    public var var_3355: String = "";

    public function class_655(param1: String = "", param2: Boolean = false) {
        super();
        this.var_3355 = param1;
        this.var_971 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 3;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_971 = param1.readBoolean();
        this.var_3355 = param1.readUTF();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(22786);
        param1.writeBoolean(this.var_971);
        param1.writeUTF(this.var_3355);
        param1.writeShort(-8553);
    }
}
}
