package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_661 implements ICommand {

    public static const ID: int = 32484;


    public var seconds: int = 0;

    public function class_661(param1: int = 0) {
        super();
        this.seconds = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.seconds = param1.readInt();
        this.seconds = Number(this.seconds) >>> 1 | Number(this.seconds) << 31;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.seconds) << 1 | Number(this.seconds) >>> 31);
        param1.writeShort(12246);
    }
}
}
