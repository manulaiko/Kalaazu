package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_859 implements ICommand {

    public static const ID: int = 7758;


    public var id: int = 0;

    public function class_859(param1: int = 0) {
        super();
        this.id = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.id = param1.readInt();
        this.id = Number(this.id) >>> 1 | Number(this.id) << 31;
        param1.readShort();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.id) << 1 | Number(this.id) >>> 31);
        param1.writeShort(-25506);
        param1.writeShort(-7466);
    }
}
}
