package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_934 implements ICommand {

    public static const ID: int = 25570;


    public var var_1537: int = 0;

    public var var_3107: String = "";

    public function class_934(param1: int = 0, param2: String = "") {
        super();
        this.var_1537 = param1;
        this.var_3107 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 6;
    }

    public function read(param1: IDataInput): void {
        this.var_1537 = param1.readInt();
        this.var_1537 = Number(this.var_1537) << 4 | Number(this.var_1537) >>> 28;
        this.var_3107 = param1.readUTF();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_1537) >>> 4 | Number(this.var_1537) << 28);
        param1.writeUTF(this.var_3107);
    }
}
}
