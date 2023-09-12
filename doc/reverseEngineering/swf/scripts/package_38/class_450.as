package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_450 implements ICommand {

    public static const ID: int = 7606;


    public var var_2295: int = 0;

    public var width: int = 0;

    public var itemId: String = "";

    public var height: int = 0;

    public var var_4787: int = 0;

    public var maximized: Boolean = false;

    public function class_450(param1: String = "", param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0, param6: Boolean = false) {
        super();
        this.itemId = param1;
        this.var_4787 = param2;
        this.var_2295 = param3;
        this.width = param4;
        this.height = param5;
        this.maximized = param6;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 19;
    }

    public function read(param1: IDataInput): void {
        this.var_2295 = param1.readInt();
        this.var_2295 = Number(this.var_2295) >>> 11 | Number(this.var_2295) << 21;
        this.width = param1.readInt();
        this.width = Number(this.width) >>> 8 | Number(this.width) << 24;
        this.itemId = param1.readUTF();
        this.height = param1.readInt();
        this.height = Number(this.height) << 8 | Number(this.height) >>> 24;
        this.var_4787 = param1.readInt();
        this.var_4787 = Number(this.var_4787) >>> 11 | Number(this.var_4787) << 21;
        this.maximized = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_2295) << 11 | Number(this.var_2295) >>> 21);
        param1.writeInt(Number(this.width) << 8 | Number(this.width) >>> 24);
        param1.writeUTF(this.itemId);
        param1.writeInt(Number(this.height) >>> 8 | Number(this.height) << 24);
        param1.writeInt(Number(this.var_4787) << 11 | Number(this.var_4787) >>> 21);
        param1.writeBoolean(this.maximized);
    }
}
}
