package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_945 implements ICommand {

    public static const ID: int = 24674;


    public var var_1469: int = 0;

    public var var_333: int = 0;

    public function class_945(param1: int = 0, param2: int = 0) {
        super();
        this.var_1469 = param1;
        this.var_333 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_1469 = param1.readInt();
        this.var_1469 = Number(this.var_1469) >>> 2 | Number(this.var_1469) << 30;
        this.var_333 = param1.readInt();
        this.var_333 = Number(this.var_333) << 1 | Number(this.var_333) >>> 31;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-13093);
        param1.writeInt(Number(this.var_1469) << 2 | Number(this.var_1469) >>> 30);
        param1.writeInt(Number(this.var_333) >>> 1 | Number(this.var_333) << 31);
    }
}
}
