package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_966 implements ICommand {

    public static const ID: int = 32380;


    public var var_2158: int = 0;

    public function class_966(param1: int = 0) {
        super();
        this.var_2158 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.var_2158 = param1.readInt();
        this.var_2158 = Number(this.var_2158) << 12 | Number(this.var_2158) >>> 20;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_2158) >>> 12 | Number(this.var_2158) << 20);
    }
}
}
