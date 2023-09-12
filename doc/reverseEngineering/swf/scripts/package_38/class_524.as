package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_524 implements ICommand {

    public static const OFF: uint = 1;

    public static const ON: uint = 0;

    public static const ID: int = 30787;


    public var var_4377: class_599;

    public var state: uint = 0;

    public var var_3184: int = 0;

    public var activatable: Boolean = false;

    public var toolTip: class_358;

    public function class_524(param1: int = 0, param2: uint = 0, param3: Boolean = false, param4: class_358 = null, param5: class_599 = null) {
        super();
        this.var_3184 = param1;
        this.state = param2;
        this.activatable = param3;
        if (param4 == null) {
            this.toolTip = new class_358();
        } else {
            this.toolTip = param4;
        }
        if (param5 == null) {
            this.var_4377 = new class_599();
        } else {
            this.var_4377 = param5;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        this.var_4377 = class_127.getInstance().createInstance(param1.readShort()) as class_599;
        this.var_4377.read(param1);
        this.state = param1.readShort();
        this.var_3184 = param1.readInt();
        this.var_3184 = Number(this.var_3184) >>> 6 | Number(this.var_3184) << 26;
        this.activatable = param1.readBoolean();
        this.toolTip = class_127.getInstance().createInstance(param1.readShort()) as class_358;
        this.toolTip.read(param1);
        param1.readShort();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_4377.write(param1);
        param1.writeShort(this.state);
        param1.writeInt(Number(this.var_3184) << 6 | Number(this.var_3184) >>> 26);
        param1.writeBoolean(this.activatable);
        this.toolTip.write(param1);
        param1.writeShort(-10810);
        param1.writeShort(19301);
    }
}
}
