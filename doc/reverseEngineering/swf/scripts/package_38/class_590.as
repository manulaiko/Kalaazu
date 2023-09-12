package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_590 implements ICommand {

    public static const ID: int = 2068;


    public var lootId: String = "";

    public var var_158: class_647;

    public function class_590(param1: class_647 = null, param2: String = "") {
        super();
        if (param1 == null) {
            this.var_158 = new class_647();
        } else {
            this.var_158 = param1;
        }
        this.lootId = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 2;
    }

    public function read(param1: IDataInput): void {
        this.lootId = param1.readUTF();
        this.var_158 = class_127.getInstance().createInstance(param1.readShort()) as class_647;
        this.var_158.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.lootId);
        this.var_158.write(param1);
    }
}
}
