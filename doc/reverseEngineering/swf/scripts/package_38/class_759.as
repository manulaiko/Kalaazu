package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_759 implements ICommand {

    public static const ID: int = 15473;


    public var blocked: Boolean = false;

    public function class_759(param1: Boolean = false) {
        super();
        this.blocked = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 1;
    }

    public function read(param1: IDataInput): void {
        this.blocked = param1.readBoolean();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.blocked);
        param1.writeShort(7156);
    }
}
}
