package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_550 implements ICommand {

    public static const ID: int = 4550;


    public var var_719: int = 0;

    public var name_105: int = 0;

    public function class_550(param1: int = 0, param2: int = 0) {
        super();
        this.var_719 = param1;
        this.name_105 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_719 = param1.readInt();
        this.var_719 = Number(this.var_719) << 12 | Number(this.var_719) >>> 20;
        this.name_105 = param1.readInt();
        this.name_105 = Number(this.name_105) << 7 | Number(this.name_105) >>> 25;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_719) >>> 12 | Number(this.var_719) << 20);
        param1.writeInt(Number(this.name_105) >>> 7 | Number(this.name_105) << 25);
    }
}
}
