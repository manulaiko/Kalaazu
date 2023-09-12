package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_701 implements ICommand {

    public static const ID: int = 28738;


    public var windowId: int = 0;

    public function class_701(param1: int = 0) {
        super();
        this.windowId = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.windowId = param1.readInt();
        this.windowId = Number(this.windowId) >>> 4 | Number(this.windowId) << 28;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(20448);
        param1.writeInt(Number(this.windowId) << 4 | Number(this.windowId) >>> 28);
    }
}
}
