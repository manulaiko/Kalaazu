package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_771 implements ICommand {

    public static const ID: int = 19105;


    public var amount: int = 0;

    public var lootId: String = "";

    public function class_771(param1: String = "", param2: int = 0) {
        super();
        this.lootId = param1;
        this.amount = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 6;
    }

    public function read(param1: IDataInput): void {
        this.amount = param1.readInt();
        this.amount = Number(this.amount) << 7 | Number(this.amount) >>> 25;
        this.lootId = param1.readUTF();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.amount) >>> 7 | Number(this.amount) << 25);
        param1.writeUTF(this.lootId);
    }
}
}
