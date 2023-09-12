package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_689 implements ICommand {

    public static const ID: int = 5614;


    public var running: Boolean = false;

    public function class_689(param1: Boolean = false) {
        super();
        this.running = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 1;
    }

    public function read(param1: IDataInput): void {
        this.running = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.running);
    }
}
}
