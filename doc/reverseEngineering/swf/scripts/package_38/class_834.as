package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_834 implements ICommand {

    public static const ID: int = 3372;


    public var name_92: Boolean = false;

    public var name_137: int = 0;

    public function class_834(param1: Boolean = false, param2: int = 0) {
        super();
        this.name_92 = param1;
        this.name_137 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        this.name_92 = param1.readBoolean();
        param1.readShort();
        param1.readShort();
        this.name_137 = param1.readInt();
        this.name_137 = Number(this.name_137) >>> 1 | Number(this.name_137) << 31;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.name_92);
        param1.writeShort(20749);
        param1.writeShort(3016);
        param1.writeInt(Number(this.name_137) << 1 | Number(this.name_137) >>> 31);
    }
}
}
