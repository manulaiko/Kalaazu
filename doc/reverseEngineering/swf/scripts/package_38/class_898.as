package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_898 implements ICommand {

    public static const ID: int = 30907;


    public var var_3530: String = "";

    public var var_922: String = "";

    public var var_549: String = "";

    public var var_352: String = "";

    public var var_4513: String = "";

    public var var_72: String = "";

    public var var_696: int = 0;

    public var var_3883: String = "";

    public var var_1004: String = "";

    public var var_4309: String = "";

    public var var_2927: String = "";

    public var hideAllWindows: Boolean = false;

    public var var_3567: String = "";

    public var name_118: String = "";

    public var var_3261: String = "";

    public function class_898(param1: int = 0, param2: String = "", param3: String = "", param4: String = "", param5: String = "", param6: String = "", param7: String = "", param8: String = "", param9: String = "", param10: String = "", param11: String = "", param12: String = "", param13: String = "", param14: String = "", param15: Boolean = false) {
        super();
        this.var_696 = param1;
        this.var_922 = param2;
        this.var_3261 = param3;
        this.var_2927 = param4;
        this.var_352 = param5;
        this.var_1004 = param6;
        this.var_3883 = param7;
        this.var_549 = param8;
        this.var_3567 = param9;
        this.var_72 = param10;
        this.var_4513 = param11;
        this.var_3530 = param12;
        this.var_4309 = param13;
        this.name_118 = param14;
        this.hideAllWindows = param15;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 31;
    }

    public function read(param1: IDataInput): void {
        this.var_3530 = param1.readUTF();
        this.var_922 = param1.readUTF();
        this.var_549 = param1.readUTF();
        this.var_352 = param1.readUTF();
        param1.readShort();
        this.var_4513 = param1.readUTF();
        this.var_72 = param1.readUTF();
        param1.readShort();
        this.var_696 = param1.readInt();
        this.var_696 = Number(this.var_696) << 1 | Number(this.var_696) >>> 31;
        this.var_3883 = param1.readUTF();
        this.var_1004 = param1.readUTF();
        this.var_4309 = param1.readUTF();
        this.var_2927 = param1.readUTF();
        this.hideAllWindows = param1.readBoolean();
        this.var_3567 = param1.readUTF();
        this.name_118 = param1.readUTF();
        this.var_3261 = param1.readUTF();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.var_3530);
        param1.writeUTF(this.var_922);
        param1.writeUTF(this.var_549);
        param1.writeUTF(this.var_352);
        param1.writeShort(28138);
        param1.writeUTF(this.var_4513);
        param1.writeUTF(this.var_72);
        param1.writeShort(4642);
        param1.writeInt(Number(this.var_696) >>> 1 | Number(this.var_696) << 31);
        param1.writeUTF(this.var_3883);
        param1.writeUTF(this.var_1004);
        param1.writeUTF(this.var_4309);
        param1.writeUTF(this.var_2927);
        param1.writeBoolean(this.hideAllWindows);
        param1.writeUTF(this.var_3567);
        param1.writeUTF(this.name_118);
        param1.writeUTF(this.var_3261);
    }
}
}
