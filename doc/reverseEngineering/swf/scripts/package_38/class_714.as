package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_714 implements ICommand {

    public static const ID: int = 19801;


    public var name_105: int = 0;

    public var emergencyRepairSecondsTotal: int = 0;

    public var name_159: int = 0;

    public var emergencyRepairSecondsLeft: int = 0;

    public var name_37: int = 0;

    public var shield: int = 0;

    public var name_90: int = 0;

    public var slotId: int = 0;

    public function class_714(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0, param6: int = 0, param7: int = 0, param8: int = 0) {
        super();
        this.name_159 = param1;
        this.slotId = param2;
        this.name_90 = param3;
        this.name_37 = param4;
        this.shield = param5;
        this.name_105 = param6;
        this.emergencyRepairSecondsLeft = param7;
        this.emergencyRepairSecondsTotal = param8;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 32;
    }

    public function read(param1: IDataInput): void {
        this.name_105 = param1.readInt();
        this.name_105 = Number(this.name_105) >>> 13 | Number(this.name_105) << 19;
        this.emergencyRepairSecondsTotal = param1.readInt();
        this.emergencyRepairSecondsTotal = Number(this.emergencyRepairSecondsTotal) >>> 12 | Number(this.emergencyRepairSecondsTotal) << 20;
        this.name_159 = param1.readInt();
        this.name_159 = Number(this.name_159) << 6 | Number(this.name_159) >>> 26;
        this.emergencyRepairSecondsLeft = param1.readInt();
        this.emergencyRepairSecondsLeft = Number(this.emergencyRepairSecondsLeft) << 8 | Number(this.emergencyRepairSecondsLeft) >>> 24;
        this.name_37 = param1.readInt();
        this.name_37 = Number(this.name_37) << 10 | Number(this.name_37) >>> 22;
        this.shield = param1.readInt();
        this.shield = Number(this.shield) >>> 12 | Number(this.shield) << 20;
        this.name_90 = param1.readInt();
        this.name_90 = Number(this.name_90) << 1 | Number(this.name_90) >>> 31;
        this.slotId = param1.readInt();
        this.slotId = Number(this.slotId) << 9 | Number(this.slotId) >>> 23;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.name_105) << 13 | Number(this.name_105) >>> 19);
        param1.writeInt(Number(this.emergencyRepairSecondsTotal) << 12 | Number(this.emergencyRepairSecondsTotal) >>> 20);
        param1.writeInt(Number(this.name_159) >>> 6 | Number(this.name_159) << 26);
        param1.writeInt(Number(this.emergencyRepairSecondsLeft) >>> 8 | Number(this.emergencyRepairSecondsLeft) << 24);
        param1.writeInt(Number(this.name_37) >>> 10 | Number(this.name_37) << 22);
        param1.writeInt(Number(this.shield) << 12 | Number(this.shield) >>> 20);
        param1.writeInt(Number(this.name_90) >>> 1 | Number(this.name_90) << 31);
        param1.writeInt(Number(this.slotId) >>> 9 | Number(this.slotId) << 23);
    }
}
}
