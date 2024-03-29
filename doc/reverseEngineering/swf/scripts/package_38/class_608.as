package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_608 implements ICommand {

    public static const ID: int = 5107;


    public var premium: Boolean = false;

    public function class_608(param1: Boolean = false) {
        super();
        this.premium = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 1;
    }

    public function read(param1: IDataInput): void {
        this.premium = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.premium);
    }
}
}
