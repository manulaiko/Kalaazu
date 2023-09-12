package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_868 implements ICommand {

    public static const ID: int = 13718;


    public var var_4787: int = 0;

    public var var_2295: int = 0;

    public var var_3438: String = "";

    public var var_2708: Vector.<class_315>;

    public var var_4985: Boolean = false;

    public var name_127: int = 0;

    public var name_164: int = 0;

    public var var_3511: Boolean = false;

    public var factionId: int = 0;

    public var var_1498: Boolean = false;

    public var name_98: class_930;

    public var name_145: String = "";

    public var type: class_445;

    public var name_45: int = 0;

    public var var_942: Boolean = false;

    public var name_115: int = 0;

    public function class_868(param1: class_445 = null, param2: String = "", param3: int = 0, param4: String = "", param5: int = 0, param6: int = 0, param7: int = 0, param8: int = 0, param9: int = 0, param10: int = 0, param11: Boolean = false, param12: Boolean = false, param13: Boolean = false, param14: Boolean = false, param15: class_930 = null, param16: Vector.<class_315> = null) {
        super();
        if (param1 == null) {
            this.type = new class_445();
        } else {
            this.type = param1;
        }
        this.var_3438 = param2;
        this.factionId = param3;
        this.name_145 = param4;
        this.name_115 = param5;
        this.name_164 = param6;
        this.name_127 = param7;
        this.var_4787 = param8;
        this.var_2295 = param9;
        this.name_45 = param10;
        this.var_3511 = param11;
        this.var_1498 = param12;
        this.var_942 = param13;
        this.var_4985 = param14;
        if (param15 == null) {
            this.name_98 = new class_930();
        } else {
            this.name_98 = param15;
        }
        if (param16 == null) {
            this.var_2708 = new Vector.<class_315>();
        } else {
            this.var_2708 = param16;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 40;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        this.var_4787 = param1.readInt();
        this.var_4787 = Number(this.var_4787) << 10 | Number(this.var_4787) >>> 22;
        this.var_2295 = param1.readInt();
        this.var_2295 = Number(this.var_2295) << 1 | Number(this.var_2295) >>> 31;
        this.var_3438 = param1.readUTF();
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
        this.var_4985 = param1.readBoolean();
        this.name_127 = param1.readInt();
        this.name_127 = Number(this.name_127) >>> 15 | Number(this.name_127) << 17;
        this.name_164 = param1.readInt();
        this.name_164 = Number(this.name_164) >>> 16 | Number(this.name_164) << 16;
        this.var_3511 = param1.readBoolean();
        this.factionId = param1.readInt();
        this.factionId = Number(this.factionId) << 3 | Number(this.factionId) >>> 29;
        this.var_1498 = param1.readBoolean();
        param1.readShort();
        this.name_98 = class_127.getInstance().createInstance(param1.readShort()) as class_930;
        this.name_98.read(param1);
        this.name_145 = param1.readUTF();
        this.type = class_127.getInstance().createInstance(param1.readShort()) as class_445;
        this.type.read(param1);
        this.name_45 = param1.readInt();
        this.name_45 = Number(this.name_45) << 10 | Number(this.name_45) >>> 22;
        this.var_942 = param1.readBoolean();
        this.name_115 = param1.readInt();
        this.name_115 = Number(this.name_115) << 5 | Number(this.name_115) >>> 27;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(Number(this.var_4787) >>> 10 | Number(this.var_4787) << 22);
        param1.writeInt(Number(this.var_2295) >>> 1 | Number(this.var_2295) << 31);
        param1.writeUTF(this.var_3438);
        param1.writeInt(this.var_2708.length);
        for each(_loc2_ in this.var_2708) {
            _loc2_.write(param1);
        }
        param1.writeBoolean(this.var_4985);
        param1.writeInt(Number(this.name_127) << 15 | Number(this.name_127) >>> 17);
        param1.writeInt(Number(this.name_164) << 16 | Number(this.name_164) >>> 16);
        param1.writeBoolean(this.var_3511);
        param1.writeInt(Number(this.factionId) >>> 3 | Number(this.factionId) << 29);
        param1.writeBoolean(this.var_1498);
        param1.writeShort(24441);
        this.name_98.write(param1);
        param1.writeUTF(this.name_145);
        this.type.write(param1);
        param1.writeInt(Number(this.name_45) >>> 10 | Number(this.name_45) << 22);
        param1.writeBoolean(this.var_942);
        param1.writeInt(Number(this.name_115) >>> 5 | Number(this.name_115) << 27);
    }
}
}
