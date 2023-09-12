package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_563 extends class_532 implements ICommand {

    public static const ID: int = 18631;


    public var lootId: String = "";

    public var amount: int = 0;

    public function class_563(param1: int = 0, param2: String = "") {
        super();
        this.lootId = param2;
        this.amount = param1;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 6;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.lootId = param1.readUTF();
        param1.readShort();
        this.amount = param1.readInt();
        this.amount = Number(this.amount) << 2 | Number(this.amount) >>> 30;
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeUTF(this.lootId);
        param1.writeShort(31663);
        param1.writeInt(Number(this.amount) >>> 2 | Number(this.amount) << 30);
    }
}
}
