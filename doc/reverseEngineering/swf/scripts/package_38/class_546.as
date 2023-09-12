package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_546 implements ICommand {

    public static const ID: int = 4013;


    public var active: Boolean = false;

    public var maxValue: int = 0;

    public var currentValue: int = 0;

    public function class_546(param1: int = 0, param2: int = 0, param3: Boolean = false) {
        super();
        this.maxValue = param1;
        this.currentValue = param2;
        this.active = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 9;
    }

    public function read(param1: IDataInput): void {
        this.active = param1.readBoolean();
        param1.readShort();
        this.maxValue = param1.readInt();
        this.maxValue = Number(this.maxValue) << 4 | Number(this.maxValue) >>> 28;
        this.currentValue = param1.readInt();
        this.currentValue = Number(this.currentValue) << 3 | Number(this.currentValue) >>> 29;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.active);
        param1.writeShort(-29079);
        param1.writeInt(Number(this.maxValue) >>> 4 | Number(this.maxValue) << 28);
        param1.writeInt(Number(this.currentValue) >>> 3 | Number(this.currentValue) << 29);
    }
}
}
