package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_768 implements ICommand {

    public static const ID: int = 26197;


    public var name_145: String = "";

    public var name_128: int = 0;

    public var name_45: int = 0;

    public function class_768(param1: String = "", param2: int = 0, param3: int = 0) {
        super();
        this.name_145 = param1;
        this.name_45 = param2;
        this.name_128 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 10;
    }

    public function read(param1: IDataInput): void {
        this.name_145 = param1.readUTF();
        this.name_128 = param1.readInt();
        this.name_128 = Number(this.name_128) >>> 14 | Number(this.name_128) << 18;
        this.name_45 = param1.readInt();
        this.name_45 = Number(this.name_45) << 14 | Number(this.name_45) >>> 18;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.name_145);
        param1.writeInt(Number(this.name_128) << 14 | Number(this.name_128) >>> 18);
        param1.writeInt(Number(this.name_45) >>> 14 | Number(this.name_45) << 18);
    }
}
}
