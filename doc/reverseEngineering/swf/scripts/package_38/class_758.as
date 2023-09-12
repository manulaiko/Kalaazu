package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_758 implements ICommand {

    public static const RED: uint = 1;

    public static const DEFAULT: uint = 0;

    public static const BLUE: uint = 4;

    public static const const_943: uint = 6;

    public static const YELLOW: uint = 3;

    public static const const_1375: uint = 5;

    public static const GREEN: uint = 2;

    public static const ID: int = 12754;


    public var buyable: Boolean = false;

    public var counterValue: Number = 0;

    public var blocked: Boolean = false;

    public var var_2092: String = "";

    public var available: Boolean = false;

    public var activatable: Boolean = false;

    public var counterStyle: uint = 0;

    public var toolTipItemBar: class_358;

    public var toolTipSlotBar: class_358;

    public var maxCounterValue: Number = 0;

    public var selected: Boolean = false;

    public var iconLootId: String = "";

    public var visible: Boolean = false;

    public function class_758(param1: Boolean = false, param2: Boolean = false, param3: String = "", param4: class_358 = null, param5: class_358 = null, param6: Boolean = false, param7: Number = 0, param8: Number = 0, param9: uint = 0, param10: String = "", param11: Boolean = false, param12: Boolean = false, param13: Boolean = false) {
        super();
        this.available = param1;
        this.visible = param2;
        this.var_2092 = param3;
        if (param4 == null) {
            this.toolTipItemBar = new class_358();
        } else {
            this.toolTipItemBar = param4;
        }
        if (param5 == null) {
            this.toolTipSlotBar = new class_358();
        } else {
            this.toolTipSlotBar = param5;
        }
        this.buyable = param6;
        this.maxCounterValue = param7;
        this.counterValue = param8;
        this.counterStyle = param9;
        this.iconLootId = param10;
        this.activatable = param11;
        this.selected = param12;
        this.blocked = param13;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 26;
    }

    public function read(param1: IDataInput): void {
        this.buyable = param1.readBoolean();
        this.counterValue = param1.readDouble();
        param1.readShort();
        this.blocked = param1.readBoolean();
        this.var_2092 = param1.readUTF();
        this.available = param1.readBoolean();
        this.activatable = param1.readBoolean();
        this.counterStyle = param1.readShort();
        this.toolTipItemBar = class_127.getInstance().createInstance(param1.readShort()) as class_358;
        this.toolTipItemBar.read(param1);
        param1.readShort();
        this.toolTipSlotBar = class_127.getInstance().createInstance(param1.readShort()) as class_358;
        this.toolTipSlotBar.read(param1);
        this.maxCounterValue = param1.readDouble();
        this.selected = param1.readBoolean();
        this.iconLootId = param1.readUTF();
        this.visible = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.buyable);
        param1.writeDouble(this.counterValue);
        param1.writeShort(5539);
        param1.writeBoolean(this.blocked);
        param1.writeUTF(this.var_2092);
        param1.writeBoolean(this.available);
        param1.writeBoolean(this.activatable);
        param1.writeShort(this.counterStyle);
        this.toolTipItemBar.write(param1);
        param1.writeShort(12379);
        this.toolTipSlotBar.write(param1);
        param1.writeDouble(this.maxCounterValue);
        param1.writeBoolean(this.selected);
        param1.writeUTF(this.iconLootId);
        param1.writeBoolean(this.visible);
    }
}
}
