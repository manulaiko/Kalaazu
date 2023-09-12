package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_388 implements ICommand {

    public static const ID: int = 7511;


    public var factionId: int = 0;

    public var name_126: String = "";

    public var var_4810: Boolean = false;

    public var var_2981: int = 0;

    public var level: int = 0;

    public var var_1574: int = 0;

    public var cloaked: Boolean = false;

    public var speed: int = 0;

    public var uridium: Number = 0;

    public var mapId: int = 0;

    public var shield: int = 0;

    public var name_127: int = 0;

    public var credits: Number = 0;

    public var var_2217: int = 0;

    public var var_3438: String = "";

    public var x: int = 0;

    public var var_4514: Number = 0;

    public var premium: Boolean = false;

    public var name_145: String = "";

    public var var_4260: int = 0;

    public var name_105: int = 0;

    public var var_1819: int = 0;

    public var name_128: int = 0;

    public var var_3895: int = 0;

    public var var_4025: Number = 0;

    public var name_45: int = 0;

    public var name_140: int = 0;

    public var jackpot: Number = 0;

    public var var_1029: int = 0;

    public var var_2708: Vector.<class_315>;

    public var y: int = 0;

    public var var_3649: Boolean = false;

    public function class_388(param1: int = 0, param2: String = "", param3: String = "", param4: int = 0, param5: int = 0, param6: int = 0, param7: int = 0, param8: int = 0, param9: int = 0, param10: int = 0, param11: int = 0, param12: int = 0, param13: int = 0, param14: int = 0, param15: int = 0, param16: int = 0, param17: int = 0, param18: int = 0, param19: Boolean = false, param20: Number = 0, param21: Number = 0, param22: int = 0, param23: Number = 0, param24: Number = 0, param25: Number = 0, param26: int = 0, param27: String = "", param28: int = 0, param29: Boolean = false, param30: Boolean = false, param31: Boolean = false, param32: Vector.<class_315> = null) {
        super();
        this.name_128 = param1;
        this.var_3438 = param2;
        this.name_126 = param3;
        this.speed = param4;
        this.shield = param5;
        this.name_105 = param6;
        this.var_1029 = param7;
        this.var_1819 = param8;
        this.var_4260 = param9;
        this.var_2981 = param10;
        this.var_2217 = param11;
        this.var_1574 = param12;
        this.x = param13;
        this.y = param14;
        this.mapId = param15;
        this.factionId = param16;
        this.name_45 = param17;
        this.name_127 = param18;
        this.premium = param19;
        this.var_4514 = param20;
        this.var_4025 = param21;
        this.level = param22;
        this.credits = param23;
        this.uridium = param24;
        this.jackpot = param25;
        this.name_140 = param26;
        this.name_145 = param27;
        this.var_3895 = param28;
        this.var_3649 = param29;
        this.cloaked = param30;
        this.var_4810 = param31;
        if (param32 == null) {
            this.var_2708 = new Vector.<class_315>();
        } else {
            this.var_2708 = param32;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 126;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        this.factionId = param1.readInt();
        this.factionId = Number(this.factionId) >>> 12 | Number(this.factionId) << 20;
        this.name_126 = param1.readUTF();
        this.var_4810 = param1.readBoolean();
        param1.readShort();
        this.var_2981 = param1.readInt();
        this.var_2981 = Number(this.var_2981) << 16 | Number(this.var_2981) >>> 16;
        this.level = param1.readInt();
        this.level = Number(this.level) >>> 9 | Number(this.level) << 23;
        this.var_1574 = param1.readInt();
        this.var_1574 = Number(this.var_1574) << 14 | Number(this.var_1574) >>> 18;
        this.cloaked = param1.readBoolean();
        this.speed = param1.readInt();
        this.speed = Number(this.speed) << 10 | Number(this.speed) >>> 22;
        this.uridium = param1.readDouble();
        this.mapId = param1.readInt();
        this.mapId = Number(this.mapId) << 9 | Number(this.mapId) >>> 23;
        this.shield = param1.readInt();
        this.shield = Number(this.shield) << 10 | Number(this.shield) >>> 22;
        this.name_127 = param1.readInt();
        this.name_127 = Number(this.name_127) >>> 8 | Number(this.name_127) << 24;
        this.credits = param1.readDouble();
        this.var_2217 = param1.readInt();
        this.var_2217 = Number(this.var_2217) << 13 | Number(this.var_2217) >>> 19;
        this.var_3438 = param1.readUTF();
        this.x = param1.readInt();
        this.x = Number(this.x) << 5 | Number(this.x) >>> 27;
        this.var_4514 = param1.readDouble();
        this.premium = param1.readBoolean();
        this.name_145 = param1.readUTF();
        this.var_4260 = param1.readInt();
        this.var_4260 = Number(this.var_4260) << 10 | Number(this.var_4260) >>> 22;
        this.name_105 = param1.readInt();
        this.name_105 = Number(this.name_105) >>> 6 | Number(this.name_105) << 26;
        this.var_1819 = param1.readInt();
        this.var_1819 = Number(this.var_1819) << 5 | Number(this.var_1819) >>> 27;
        this.name_128 = param1.readInt();
        this.name_128 = Number(this.name_128) >>> 1 | Number(this.name_128) << 31;
        this.var_3895 = param1.readInt();
        this.var_3895 = Number(this.var_3895) << 1 | Number(this.var_3895) >>> 31;
        this.var_4025 = param1.readDouble();
        this.name_45 = param1.readInt();
        this.name_45 = Number(this.name_45) << 8 | Number(this.name_45) >>> 24;
        this.name_140 = param1.readInt();
        this.name_140 = Number(this.name_140) >>> 3 | Number(this.name_140) << 29;
        this.jackpot = param1.readFloat();
        this.var_1029 = param1.readInt();
        this.var_1029 = Number(this.var_1029) >>> 3 | Number(this.var_1029) << 29;
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
        this.y = param1.readInt();
        this.y = Number(this.y) >>> 1 | Number(this.y) << 31;
        this.var_3649 = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(Number(this.factionId) << 12 | Number(this.factionId) >>> 20);
        param1.writeUTF(this.name_126);
        param1.writeBoolean(this.var_4810);
        param1.writeShort(-22408);
        param1.writeInt(Number(this.var_2981) >>> 16 | Number(this.var_2981) << 16);
        param1.writeInt(Number(this.level) << 9 | Number(this.level) >>> 23);
        param1.writeInt(Number(this.var_1574) >>> 14 | Number(this.var_1574) << 18);
        param1.writeBoolean(this.cloaked);
        param1.writeInt(Number(this.speed) >>> 10 | Number(this.speed) << 22);
        param1.writeDouble(this.uridium);
        param1.writeInt(Number(this.mapId) >>> 9 | Number(this.mapId) << 23);
        param1.writeInt(Number(this.shield) >>> 10 | Number(this.shield) << 22);
        param1.writeInt(Number(this.name_127) << 8 | Number(this.name_127) >>> 24);
        param1.writeDouble(this.credits);
        param1.writeInt(Number(this.var_2217) >>> 13 | Number(this.var_2217) << 19);
        param1.writeUTF(this.var_3438);
        param1.writeInt(Number(this.x) >>> 5 | Number(this.x) << 27);
        param1.writeDouble(this.var_4514);
        param1.writeBoolean(this.premium);
        param1.writeUTF(this.name_145);
        param1.writeInt(Number(this.var_4260) >>> 10 | Number(this.var_4260) << 22);
        param1.writeInt(Number(this.name_105) << 6 | Number(this.name_105) >>> 26);
        param1.writeInt(Number(this.var_1819) >>> 5 | Number(this.var_1819) << 27);
        param1.writeInt(Number(this.name_128) << 1 | Number(this.name_128) >>> 31);
        param1.writeInt(Number(this.var_3895) >>> 1 | Number(this.var_3895) << 31);
        param1.writeDouble(this.var_4025);
        param1.writeInt(Number(this.name_45) >>> 8 | Number(this.name_45) << 24);
        param1.writeInt(Number(this.name_140) << 3 | Number(this.name_140) >>> 29);
        param1.writeFloat(this.jackpot);
        param1.writeInt(Number(this.var_1029) << 3 | Number(this.var_1029) >>> 29);
        param1.writeInt(this.var_2708.length);
        for each(_loc2_ in this.var_2708) {
            _loc2_.write(param1);
        }
        param1.writeInt(Number(this.y) << 1 | Number(this.y) >>> 31);
        param1.writeBoolean(this.var_3649);
    }
}
}
