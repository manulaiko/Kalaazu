package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_739 implements ICommand {

    public static const ID: int = 10084;


    public var var_3066: Boolean = false;

    public var var_4340: int = 0;

    public var var_3903: String = "";

    public var var_4063: Boolean = false;

    public var var_523: Boolean = false;

    public var var_15: int = 0;

    public var var_1089: Boolean = false;

    public var var_3556: int = 0;

    public var var_3280: int = 0;

    public function class_739(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: Boolean = false, param6: Boolean = false, param7: Boolean = false, param8: String = "", param9: Boolean = false) {
        super();
        this.var_3280 = param1;
        this.var_15 = param2;
        this.var_3556 = param3;
        this.var_4340 = param4;
        this.var_4063 = param5;
        this.var_1089 = param6;
        this.var_3066 = param7;
        this.var_3903 = param8;
        this.var_523 = param9;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 22;
    }

    public function read(param1: IDataInput): void {
        this.var_3066 = param1.readBoolean();
        this.var_4340 = param1.readInt();
        this.var_4340 = Number(this.var_4340) << 4 | Number(this.var_4340) >>> 28;
        this.var_3903 = param1.readUTF();
        this.var_4063 = param1.readBoolean();
        this.var_523 = param1.readBoolean();
        this.var_15 = param1.readInt();
        this.var_15 = Number(this.var_15) << 6 | Number(this.var_15) >>> 26;
        this.var_1089 = param1.readBoolean();
        this.var_3556 = param1.readInt();
        this.var_3556 = Number(this.var_3556) << 7 | Number(this.var_3556) >>> 25;
        param1.readShort();
        this.var_3280 = param1.readInt();
        this.var_3280 = Number(this.var_3280) >>> 9 | Number(this.var_3280) << 23;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.var_3066);
        param1.writeInt(Number(this.var_4340) >>> 4 | Number(this.var_4340) << 28);
        param1.writeUTF(this.var_3903);
        param1.writeBoolean(this.var_4063);
        param1.writeBoolean(this.var_523);
        param1.writeInt(Number(this.var_15) >>> 6 | Number(this.var_15) << 26);
        param1.writeBoolean(this.var_1089);
        param1.writeInt(Number(this.var_3556) >>> 7 | Number(this.var_3556) << 25);
        param1.writeShort(16384);
        param1.writeInt(Number(this.var_3280) << 9 | Number(this.var_3280) >>> 23);
    }
}
}
