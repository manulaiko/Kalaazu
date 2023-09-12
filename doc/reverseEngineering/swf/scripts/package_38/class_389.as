package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_389 implements ICommand {

    public static const ID: int = 7270;


    public var var_3438: String = "";

    public var var_3895: int = 0;

    public var var_3649: Boolean = false;

    public var factionId: int = 0;

    public var name_127: int = 0;

    public var name_126: String = "";

    public var name_140: int = 0;

    public var npc: Boolean = false;

    public var name_45: int = 0;

    public var name_155: class_930;

    public var var_4521: Boolean = false;

    public var var_2565: int = 0;

    public var name_145: String = "";

    public var var_2708: Vector.<class_315>;

    public var cloaked: Boolean = false;

    public var name_128: int = 0;

    public var var_3818: int = 0;

    public var x: int = 0;

    public var var_4196: class_387;

    public var y: int = 0;

    public function class_389(param1: int = 0, param2: String = "", param3: int = 0, param4: String = "", param5: String = "", param6: int = 0, param7: int = 0, param8: int = 0, param9: int = 0, param10: int = 0, param11: Boolean = false, param12: class_930 = null, param13: int = 0, param14: Boolean = false, param15: Boolean = false, param16: Boolean = false, param17: int = 0, param18: int = 0, param19: Vector.<class_315> = null, param20: class_387 = null) {
        super();
        this.name_128 = param1;
        this.name_126 = param2;
        this.name_127 = param3;
        this.name_145 = param4;
        this.var_3438 = param5;
        this.x = param6;
        this.y = param7;
        this.factionId = param8;
        this.name_45 = param9;
        this.name_140 = param10;
        this.var_4521 = param11;
        if (param12 == null) {
            this.name_155 = new class_930();
        } else {
            this.name_155 = param12;
        }
        this.var_3895 = param13;
        this.var_3649 = param14;
        this.npc = param15;
        this.cloaked = param16;
        this.var_2565 = param17;
        this.var_3818 = param18;
        if (param19 == null) {
            this.var_2708 = new Vector.<class_315>();
        } else {
            this.var_2708 = param19;
        }
        if (param20 == null) {
            this.var_4196 = new class_387();
        } else {
            this.var_4196 = param20;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 54;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        this.var_3438 = param1.readUTF();
        this.var_3895 = param1.readInt();
        this.var_3895 = Number(this.var_3895) << 13 | Number(this.var_3895) >>> 19;
        this.var_3649 = param1.readBoolean();
        this.factionId = param1.readInt();
        this.factionId = Number(this.factionId) << 7 | Number(this.factionId) >>> 25;
        this.name_127 = param1.readInt();
        this.name_127 = Number(this.name_127) >>> 6 | Number(this.name_127) << 26;
        this.name_126 = param1.readUTF();
        this.name_140 = param1.readInt();
        this.name_140 = Number(this.name_140) << 4 | Number(this.name_140) >>> 28;
        this.npc = param1.readBoolean();
        this.name_45 = param1.readInt();
        this.name_45 = Number(this.name_45) >>> 3 | Number(this.name_45) << 29;
        this.name_155 = class_127.getInstance().createInstance(param1.readShort()) as class_930;
        this.name_155.read(param1);
        this.var_4521 = param1.readBoolean();
        this.var_2565 = param1.readInt();
        this.var_2565 = Number(this.var_2565) << 16 | Number(this.var_2565) >>> 16;
        this.name_145 = param1.readUTF();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_2708.length > 0) {
            this.var_2708.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_315).read(param1);
            this.var_2708.push(_loc4_);
            _loc2_++;
        }
        this.cloaked = param1.readBoolean();
        this.name_128 = param1.readInt();
        this.name_128 = Number(this.name_128) << 14 | Number(this.name_128) >>> 18;
        this.var_3818 = param1.readInt();
        this.var_3818 = Number(this.var_3818) >>> 3 | Number(this.var_3818) << 29;
        this.x = param1.readInt();
        this.x = Number(this.x) >>> 4 | Number(this.x) << 28;
        this.var_4196 = class_127.getInstance().createInstance(param1.readShort()) as class_387;
        this.var_4196.read(param1);
        this.y = param1.readInt();
        this.y = Number(this.y) >>> 9 | Number(this.y) << 23;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeUTF(this.var_3438);
        param1.writeInt(Number(this.var_3895) >>> 13 | Number(this.var_3895) << 19);
        param1.writeBoolean(this.var_3649);
        param1.writeInt(Number(this.factionId) >>> 7 | Number(this.factionId) << 25);
        param1.writeInt(Number(this.name_127) << 6 | Number(this.name_127) >>> 26);
        param1.writeUTF(this.name_126);
        param1.writeInt(Number(this.name_140) >>> 4 | Number(this.name_140) << 28);
        param1.writeBoolean(this.npc);
        param1.writeInt(Number(this.name_45) << 3 | Number(this.name_45) >>> 29);
        this.name_155.write(param1);
        param1.writeBoolean(this.var_4521);
        param1.writeInt(Number(this.var_2565) >>> 16 | Number(this.var_2565) << 16);
        param1.writeUTF(this.name_145);
        param1.writeInt(this.var_2708.length);
        for each(_loc2_ in this.var_2708) {
            _loc2_.write(param1);
        }
        param1.writeBoolean(this.cloaked);
        param1.writeInt(Number(this.name_128) >>> 14 | Number(this.name_128) << 18);
        param1.writeInt(Number(this.var_3818) << 3 | Number(this.var_3818) >>> 29);
        param1.writeInt(Number(this.x) << 4 | Number(this.x) >>> 28);
        this.var_4196.write(param1);
        param1.writeInt(Number(this.y) << 9 | Number(this.y) >>> 23);
    }
}
}
