package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_232 implements ICommand {

    public static const ID: int = 13538;


    public var var_1537: int = 0;

    public function class_232(param1: int = 0) {
        super();
        this.var_1537 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.var_1537 = param1.readInt();
        this.var_1537 = Number(this.var_1537) << 7 | Number(this.var_1537) >>> 25;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_1537) >>> 7 | Number(this.var_1537) << 25);
    }
}
}
