package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_495 implements ICommand {

    public static const ID: int = 11175;


    public var var_3814: int = 0;

    public function class_495(param1: int = 0) {
        super();
        this.var_3814 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.var_3814 = param1.readInt();
        this.var_3814 = Number(this.var_3814) >>> 14 | Number(this.var_3814) << 18;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_3814) << 14 | Number(this.var_3814) >>> 18);
        param1.writeShort(30637);
    }
}
}
