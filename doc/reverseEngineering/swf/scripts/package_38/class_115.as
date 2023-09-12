package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_115 implements ICommand {

    public static const ID: int = 7031;


    public var close: Boolean = false;

    public function class_115(param1: Boolean = false) {
        super();
        this.close = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 1;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.close = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-16817);
        param1.writeBoolean(this.close);
    }
}
}
