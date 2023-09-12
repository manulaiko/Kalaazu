package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_851 implements ICommand {

    public static const ID: int = 19797;


    public var name_128: int = 0;

    public function class_851(param1: int = 0) {
        super();
        this.name_128 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.name_128 = param1.readInt();
        this.name_128 = Number(this.name_128) >>> 2 | Number(this.name_128) << 30;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.name_128) << 2 | Number(this.name_128) >>> 30);
        param1.writeShort(-9955);
    }
}
}
