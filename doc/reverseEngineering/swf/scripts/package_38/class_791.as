package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_791 extends class_432 implements ICommand {

    public static const ID: int = 2150;


    public var name_45: int = 0;

    public var name_145: String = "";

    public function class_791(param1: String = "", param2: int = 0) {
        super();
        this.name_45 = param2;
        this.name_145 = param1;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 6;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        param1.readShort();
        param1.readShort();
        this.name_45 = param1.readInt();
        this.name_45 = Number(this.name_45) >>> 6 | Number(this.name_45) << 26;
        this.name_145 = param1.readUTF();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeShort(9897);
        param1.writeShort(24769);
        param1.writeInt(Number(this.name_45) << 6 | Number(this.name_45) >>> 26);
        param1.writeUTF(this.name_145);
    }
}
}
