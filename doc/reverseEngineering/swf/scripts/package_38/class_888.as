package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_888 implements ICommand {

    public static const ID: int = 17707;


    public var x: int = 0;

    public var y: int = 0;

    public function class_888(param1: int = 0, param2: int = 0) {
        super();
        this.x = param1;
        this.y = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        param1.readShort();
        this.x = param1.readInt();
        this.x = Number(this.x) >>> 9 | Number(this.x) << 23;
        this.y = param1.readInt();
        this.y = Number(this.y) << 8 | Number(this.y) >>> 24;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(20381);
        param1.writeShort(-7620);
        param1.writeInt(Number(this.x) << 9 | Number(this.x) >>> 23);
        param1.writeInt(Number(this.y) >>> 8 | Number(this.y) << 24);
    }
}
}
