package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_500 implements ICommand {

    public static const ID: int = 24015;


    public var rank: int = 0;

    public var name_49: String = "";

    public var clanName: String = "";

    public var name_45: int = 0;

    public var leaderName: String = "";

    public var var_4986: int = 0;

    public function class_500(param1: int = 0, param2: int = 0, param3: String = "", param4: String = "", param5: String = "", param6: int = 0) {
        super();
        this.name_45 = param1;
        this.rank = param2;
        this.clanName = param3;
        this.leaderName = param4;
        this.name_49 = param5;
        this.var_4986 = param6;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 18;
    }

    public function read(param1: IDataInput): void {
        this.rank = param1.readInt();
        this.rank = Number(this.rank) << 4 | Number(this.rank) >>> 28;
        this.name_49 = param1.readUTF();
        this.clanName = param1.readUTF();
        this.name_45 = param1.readInt();
        this.name_45 = Number(this.name_45) << 8 | Number(this.name_45) >>> 24;
        this.leaderName = param1.readUTF();
        this.var_4986 = param1.readInt();
        this.var_4986 = Number(this.var_4986) << 9 | Number(this.var_4986) >>> 23;
        param1.readShort();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.rank) >>> 4 | Number(this.rank) << 28);
        param1.writeUTF(this.name_49);
        param1.writeUTF(this.clanName);
        param1.writeInt(Number(this.name_45) >>> 8 | Number(this.name_45) << 24);
        param1.writeUTF(this.leaderName);
        param1.writeInt(Number(this.var_4986) >>> 9 | Number(this.var_4986) << 23);
        param1.writeShort(-1112);
        param1.writeShort(-4131);
    }
}
}
