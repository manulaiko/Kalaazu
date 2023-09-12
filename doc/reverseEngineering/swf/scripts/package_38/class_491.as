package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_491 implements ICommand {

    public static const ID: int = 4246;


    public var name_27: Number = 0;

    public var name_139: Number = 0;

    public var name_107: Number = 0;

    public function class_491(param1: Number = 0, param2: Number = 0, param3: Number = 0) {
        super();
        this.name_107 = param1;
        this.name_139 = param2;
        this.name_27 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 24;
    }

    public function read(param1: IDataInput): void {
        this.name_27 = param1.readDouble();
        this.name_139 = param1.readDouble();
        this.name_107 = param1.readDouble();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeDouble(this.name_27);
        param1.writeDouble(this.name_139);
        param1.writeDouble(this.name_107);
    }
}
}
