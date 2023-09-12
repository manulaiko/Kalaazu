package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_831 implements ICommand {

    public static const DEFLECTOR: uint = 3;

    public static const ROCKET_MID_ACCURACY: uint = 8;

    public static const HULL: uint = 2;

    public static const REPAIR: uint = 4;

    public static const DAMAGE_BOOSTER: uint = 11;

    public static const NONE: uint = 0;

    public static const const_632: uint = 1;

    public static const EXPERIENCE_BOOSTER: uint = 12;

    public static const LASER_HIGH_RANGE: uint = 5;

    public static const HONOR_BOOSTER: uint = 10;

    public static const ROCKET_LOW_ACCURACY: uint = 9;

    public static const LASER_LOW_RANGE: uint = 7;

    public static const LASER_MID_RANGE: uint = 6;

    public static const ID: int = 8468;


    public var emergencyRepairSecondsLeft: int = 0;

    public var currentShield: int = 0;

    public var emergencyRepairSecondsTotal: int = 0;

    public var upgradeLevel: int = 0;

    public var name_30: int = 0;

    public var ownerName: String = "";

    public var var_1219: int = 0;

    public var slotId: int = 0;

    public var type: uint = 0;

    public var currentHitpoints: int = 0;

    public var itemId: int = 0;

    public var maxHitpoints: int = 0;

    public var name_159: int = 0;

    public var maxShield: int = 0;

    public var installationSecondsLeft: int = 0;

    public function class_831(param1: int = 0, param2: int = 0, param3: int = 0, param4: uint = 0, param5: int = 0, param6: int = 0, param7: int = 0, param8: int = 0, param9: int = 0, param10: String = "", param11: int = 0, param12: int = 0, param13: int = 0, param14: int = 0, param15: int = 0) {
        super();
        this.name_159 = param1;
        this.itemId = param2;
        this.slotId = param3;
        this.type = param4;
        this.currentHitpoints = param5;
        this.maxHitpoints = param6;
        this.currentShield = param7;
        this.maxShield = param8;
        this.upgradeLevel = param9;
        this.ownerName = param10;
        this.var_1219 = param11;
        this.installationSecondsLeft = param12;
        this.emergencyRepairSecondsLeft = param13;
        this.emergencyRepairSecondsTotal = param14;
        this.name_30 = param15;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 54;
    }

    public function read(param1: IDataInput): void {
        this.emergencyRepairSecondsLeft = param1.readInt();
        this.emergencyRepairSecondsLeft = Number(this.emergencyRepairSecondsLeft) >>> 4 | Number(this.emergencyRepairSecondsLeft) << 28;
        this.currentShield = param1.readInt();
        this.currentShield = Number(this.currentShield) >>> 12 | Number(this.currentShield) << 20;
        this.emergencyRepairSecondsTotal = param1.readInt();
        this.emergencyRepairSecondsTotal = Number(this.emergencyRepairSecondsTotal) << 7 | Number(this.emergencyRepairSecondsTotal) >>> 25;
        this.upgradeLevel = param1.readInt();
        this.upgradeLevel = Number(this.upgradeLevel) >>> 14 | Number(this.upgradeLevel) << 18;
        this.name_30 = param1.readInt();
        this.name_30 = Number(this.name_30) << 15 | Number(this.name_30) >>> 17;
        this.ownerName = param1.readUTF();
        this.var_1219 = param1.readInt();
        this.var_1219 = Number(this.var_1219) >>> 2 | Number(this.var_1219) << 30;
        param1.readShort();
        this.slotId = param1.readInt();
        this.slotId = Number(this.slotId) >>> 2 | Number(this.slotId) << 30;
        this.type = param1.readShort();
        this.currentHitpoints = param1.readInt();
        this.currentHitpoints = Number(this.currentHitpoints) >>> 2 | Number(this.currentHitpoints) << 30;
        this.itemId = param1.readInt();
        this.itemId = Number(this.itemId) >>> 9 | Number(this.itemId) << 23;
        this.maxHitpoints = param1.readInt();
        this.maxHitpoints = Number(this.maxHitpoints) >>> 11 | Number(this.maxHitpoints) << 21;
        this.name_159 = param1.readInt();
        this.name_159 = Number(this.name_159) << 16 | Number(this.name_159) >>> 16;
        param1.readShort();
        this.maxShield = param1.readInt();
        this.maxShield = Number(this.maxShield) >>> 6 | Number(this.maxShield) << 26;
        this.installationSecondsLeft = param1.readInt();
        this.installationSecondsLeft = Number(this.installationSecondsLeft) >>> 16 | Number(this.installationSecondsLeft) << 16;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.emergencyRepairSecondsLeft) << 4 | Number(this.emergencyRepairSecondsLeft) >>> 28);
        param1.writeInt(Number(this.currentShield) << 12 | Number(this.currentShield) >>> 20);
        param1.writeInt(Number(this.emergencyRepairSecondsTotal) >>> 7 | Number(this.emergencyRepairSecondsTotal) << 25);
        param1.writeInt(Number(this.upgradeLevel) << 14 | Number(this.upgradeLevel) >>> 18);
        param1.writeInt(Number(this.name_30) >>> 15 | Number(this.name_30) << 17);
        param1.writeUTF(this.ownerName);
        param1.writeInt(Number(this.var_1219) << 2 | Number(this.var_1219) >>> 30);
        param1.writeShort(-29366);
        param1.writeInt(Number(this.slotId) << 2 | Number(this.slotId) >>> 30);
        param1.writeShort(this.type);
        param1.writeInt(Number(this.currentHitpoints) << 2 | Number(this.currentHitpoints) >>> 30);
        param1.writeInt(Number(this.itemId) << 9 | Number(this.itemId) >>> 23);
        param1.writeInt(Number(this.maxHitpoints) << 11 | Number(this.maxHitpoints) >>> 21);
        param1.writeInt(Number(this.name_159) >>> 16 | Number(this.name_159) << 16);
        param1.writeShort(19020);
        param1.writeInt(Number(this.maxShield) << 6 | Number(this.maxShield) >>> 26);
        param1.writeInt(Number(this.installationSecondsLeft) << 16 | Number(this.installationSecondsLeft) >>> 16);
    }
}
}
