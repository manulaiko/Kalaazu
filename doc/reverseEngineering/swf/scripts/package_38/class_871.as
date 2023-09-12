package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_871 implements ICommand {

    public static const ID: int = 23281;


    public var active: Boolean = false;

    public var completed: Boolean = false;

    public var currentValue: Number = 0;

    public function class_871(param1: Number = 0, param2: Boolean = false, param3: Boolean = false) {
        super();
        this.currentValue = param1;
        this.active = param2;
        this.completed = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 10;
    }

    public function read(param1: IDataInput): void {
        this.active = param1.readBoolean();
        param1.readShort();
        this.completed = param1.readBoolean();
        this.currentValue = param1.readDouble();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.active);
        param1.writeShort(-2605);
        param1.writeBoolean(this.completed);
        param1.writeDouble(this.currentValue);
    }
}
}
