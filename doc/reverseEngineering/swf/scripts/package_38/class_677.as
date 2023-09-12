package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_677 implements ICommand {

    public static const ID: int = 21495;


    public var name_142: int = 0;

    public var name_83: int = 0;

    public var attackRating: int = 0;

    public var repairRating: int = 0;

    public var defenceRating: int = 0;

    public var var_1529: int = 0;

    public var var_3184: int = 0;

    public var damageBoosterRating: int = 0;

    public var var_4201: int = 0;

    public var equipment: class_732;

    public var name_103: int = 0;

    public var var_2469: String = "";

    public var var_5034: int = 0;

    public var var_4281: Boolean = false;

    public var name_65: Boolean = false;

    public var var_1627: int = 0;

    public function class_677(param1: int = 0, param2: int = 0, param3: String = "", param4: Boolean = false, param5: int = 0, param6: int = 0, param7: int = 0, param8: int = 0, param9: int = 0, param10: int = 0, param11: int = 0, param12: int = 0, param13: int = 0, param14: int = 0, param15: class_732 = null, param16: Boolean = false) {
        super();
        this.var_3184 = param1;
        this.var_1529 = param2;
        this.var_2469 = param3;
        this.name_65 = param4;
        this.name_103 = param5;
        this.name_83 = param6;
        this.attackRating = param7;
        this.defenceRating = param8;
        this.repairRating = param9;
        this.var_5034 = param10;
        this.var_1627 = param11;
        this.damageBoosterRating = param12;
        this.name_142 = param13;
        this.var_4201 = param14;
        if (param15 == null) {
            this.equipment = new class_732();
        } else {
            this.equipment = param15;
        }
        this.var_4281 = param16;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 52;
    }

    public function read(param1: IDataInput): void {
        this.name_142 = param1.readInt();
        this.name_142 = Number(this.name_142) << 9 | Number(this.name_142) >>> 23;
        this.name_83 = param1.readInt();
        this.name_83 = Number(this.name_83) >>> 13 | Number(this.name_83) << 19;
        this.attackRating = param1.readInt();
        this.attackRating = Number(this.attackRating) >>> 14 | Number(this.attackRating) << 18;
        this.repairRating = param1.readInt();
        this.repairRating = Number(this.repairRating) << 6 | Number(this.repairRating) >>> 26;
        this.defenceRating = param1.readInt();
        this.defenceRating = Number(this.defenceRating) << 9 | Number(this.defenceRating) >>> 23;
        this.var_1529 = param1.readInt();
        this.var_1529 = Number(this.var_1529) << 13 | Number(this.var_1529) >>> 19;
        param1.readShort();
        this.var_3184 = param1.readInt();
        this.var_3184 = Number(this.var_3184) << 10 | Number(this.var_3184) >>> 22;
        this.damageBoosterRating = param1.readInt();
        this.damageBoosterRating = Number(this.damageBoosterRating) >>> 3 | Number(this.damageBoosterRating) << 29;
        this.var_4201 = param1.readInt();
        this.var_4201 = Number(this.var_4201) << 14 | Number(this.var_4201) >>> 18;
        this.equipment = class_127.getInstance().createInstance(param1.readShort()) as class_732;
        this.equipment.read(param1);
        this.name_103 = param1.readInt();
        this.name_103 = Number(this.name_103) >>> 8 | Number(this.name_103) << 24;
        this.var_2469 = param1.readUTF();
        this.var_5034 = param1.readInt();
        this.var_5034 = Number(this.var_5034) >>> 4 | Number(this.var_5034) << 28;
        this.var_4281 = param1.readBoolean();
        this.name_65 = param1.readBoolean();
        param1.readShort();
        this.var_1627 = param1.readInt();
        this.var_1627 = Number(this.var_1627) >>> 3 | Number(this.var_1627) << 29;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.name_142) >>> 9 | Number(this.name_142) << 23);
        param1.writeInt(Number(this.name_83) << 13 | Number(this.name_83) >>> 19);
        param1.writeInt(Number(this.attackRating) << 14 | Number(this.attackRating) >>> 18);
        param1.writeInt(Number(this.repairRating) >>> 6 | Number(this.repairRating) << 26);
        param1.writeInt(Number(this.defenceRating) >>> 9 | Number(this.defenceRating) << 23);
        param1.writeInt(Number(this.var_1529) >>> 13 | Number(this.var_1529) << 19);
        param1.writeShort(23737);
        param1.writeInt(Number(this.var_3184) >>> 10 | Number(this.var_3184) << 22);
        param1.writeInt(Number(this.damageBoosterRating) << 3 | Number(this.damageBoosterRating) >>> 29);
        param1.writeInt(Number(this.var_4201) >>> 14 | Number(this.var_4201) << 18);
        this.equipment.write(param1);
        param1.writeInt(Number(this.name_103) << 8 | Number(this.name_103) >>> 24);
        param1.writeUTF(this.var_2469);
        param1.writeInt(Number(this.var_5034) << 4 | Number(this.var_5034) >>> 28);
        param1.writeBoolean(this.var_4281);
        param1.writeBoolean(this.name_65);
        param1.writeShort(16248);
        param1.writeInt(Number(this.var_1627) << 3 | Number(this.var_1627) >>> 29);
    }
}
}
