package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_598 implements ICommand {

    public static const ID: int = 18681;


    public var var_761: int = 0;

    public var var_181: String = "";

    public var var_222: int = 0;

    public var var_2092: String = "";

    public var var_4223: String = "";

    public function class_598(param1: String = "", param2: int = 0, param3: String = "", param4: int = 0, param5: String = "") {
        super();
        this.var_4223 = param1;
        this.var_761 = param2;
        this.var_181 = param3;
        this.var_222 = param4;
        this.var_2092 = param5;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 14;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_761 = param1.readInt();
        this.var_761 = Number(this.var_761) >>> 11 | Number(this.var_761) << 21;
        this.var_181 = param1.readUTF();
        this.var_222 = param1.readInt();
        this.var_222 = Number(this.var_222) >>> 2 | Number(this.var_222) << 30;
        this.var_2092 = param1.readUTF();
        this.var_4223 = param1.readUTF();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(11841);
        param1.writeInt(Number(this.var_761) << 11 | Number(this.var_761) >>> 21);
        param1.writeUTF(this.var_181);
        param1.writeInt(Number(this.var_222) << 2 | Number(this.var_222) >>> 30);
        param1.writeUTF(this.var_2092);
        param1.writeUTF(this.var_4223);
    }
}
}
