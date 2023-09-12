package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_897 implements ICommand {

    public static const ID: int = 31092;


    public var var_1453: class_359;

    public var name_29: class_359;

    public var toolTipKey: class_359;

    public var price: class_346;

    public var var_413: class_345;

    public var var_3954: Boolean = false;

    public var var_1181: int = 0;

    public var var_2669: class_359;

    public function class_897(param1: class_345 = null, param2: class_346 = null, param3: Boolean = false, param4: int = 0, param5: class_359 = null, param6: class_359 = null, param7: class_359 = null, param8: class_359 = null) {
        super();
        if (param1 == null) {
            this.var_413 = new class_345();
        } else {
            this.var_413 = param1;
        }
        if (param2 == null) {
            this.price = new class_346();
        } else {
            this.price = param2;
        }
        this.var_3954 = param3;
        this.var_1181 = param4;
        if (param5 == null) {
            this.var_2669 = new class_359();
        } else {
            this.var_2669 = param5;
        }
        if (param6 == null) {
            this.var_1453 = new class_359();
        } else {
            this.var_1453 = param6;
        }
        if (param7 == null) {
            this.toolTipKey = new class_359();
        } else {
            this.toolTipKey = param7;
        }
        if (param8 == null) {
            this.name_29 = new class_359();
        } else {
            this.name_29 = param8;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        this.var_1453 = class_127.getInstance().createInstance(param1.readShort()) as class_359;
        this.var_1453.read(param1);
        this.name_29 = class_127.getInstance().createInstance(param1.readShort()) as class_359;
        this.name_29.read(param1);
        this.toolTipKey = class_127.getInstance().createInstance(param1.readShort()) as class_359;
        this.toolTipKey.read(param1);
        this.price = class_127.getInstance().createInstance(param1.readShort()) as class_346;
        this.price.read(param1);
        this.var_413 = class_127.getInstance().createInstance(param1.readShort()) as class_345;
        this.var_413.read(param1);
        this.var_3954 = param1.readBoolean();
        param1.readShort();
        this.var_1181 = param1.readInt();
        this.var_1181 = Number(this.var_1181) << 14 | Number(this.var_1181) >>> 18;
        this.var_2669 = class_127.getInstance().createInstance(param1.readShort()) as class_359;
        this.var_2669.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_1453.write(param1);
        this.name_29.write(param1);
        this.toolTipKey.write(param1);
        this.price.write(param1);
        this.var_413.write(param1);
        param1.writeBoolean(this.var_3954);
        param1.writeShort(-16569);
        param1.writeInt(Number(this.var_1181) >>> 14 | Number(this.var_1181) << 18);
        this.var_2669.write(param1);
    }
}
}
