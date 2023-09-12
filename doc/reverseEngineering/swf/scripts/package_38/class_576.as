package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_576 implements ICommand {

    public static const ID: int = 22080;


    public var duration: int = 0;

    public function class_576(param1: int = 0) {
        super();
        this.duration = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.duration = param1.readInt();
        this.duration = Number(this.duration) << 12 | Number(this.duration) >>> 20;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.duration) >>> 12 | Number(this.duration) << 20);
    }
}
}
