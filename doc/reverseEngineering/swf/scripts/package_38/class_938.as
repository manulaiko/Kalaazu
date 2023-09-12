package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_938 implements ICommand {

    public static const ID: int = 25842;


    public var name_93: int = 0;

    public function class_938(param1: int = 0) {
        super();
        this.name_93 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.name_93 = param1.readInt();
        this.name_93 = Number(this.name_93) >>> 5 | Number(this.name_93) << 27;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.name_93) << 5 | Number(this.name_93) >>> 27);
        param1.writeShort(-26229);
    }
}
}
