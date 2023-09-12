package package_38 {

import flash.utils.ByteArray;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_735 implements ICommand {

    public static const ID: int = 2376;


    public var size: int = 0;

    public var code: ByteArray;

    public function class_735(param1: int = 0, param2: ByteArray = null) {
        this.code = new ByteArray();
        super();
        this.size = param1;
        if (param2 != null) {
            this.code = param2;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.size = param1.readInt();
        this.size = Number(this.size) >>> 1 | Number(this.size) << 31;
        this.code.clear();
        param1.readBytes(this.code, 0, param1.readInt());
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.size) << 1 | Number(this.size) >>> 31);
        param1.writeInt(this.code.length);
        param1.writeBytes(this.code, 0, this.code.length);
        param1.writeShort(8153);
    }
}
}
