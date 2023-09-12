package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_846 implements ICommand {

    public static const TIMER: uint = 3;

    public static const const_653: uint = 1;

    public static const SELECTION: uint = 2;

    public static const const_2927: uint = 0;

    public static const const_1945: uint = 3;

    public static const NUMBER: uint = 1;

    public static const BAR: uint = 2;

    public static const NONE: uint = 0;

    public static const ID: int = 23269;


    public var status: class_758;

    public var timer: class_555;

    public var var_1245: class_745;

    public var var_852: int = 0;

    public var actionStyle: uint = 0;

    public var counterType: uint = 0;

    public function class_846(param1: int = 0, param2: class_758 = null, param3: class_555 = null, param4: class_745 = null, param5: uint = 0, param6: uint = 0) {
        super();
        this.var_852 = param1;
        if (param2 == null) {
            this.status = new class_758();
        } else {
            this.status = param2;
        }
        if (param3 == null) {
            this.timer = new class_555();
        } else {
            this.timer = param3;
        }
        if (param4 == null) {
            this.var_1245 = new class_745();
        } else {
            this.var_1245 = param4;
        }
        this.counterType = param5;
        this.actionStyle = param6;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.status = class_127.getInstance().createInstance(param1.readShort()) as class_758;
        this.status.read(param1);
        this.timer = class_127.getInstance().createInstance(param1.readShort()) as class_555;
        this.timer.read(param1);
        param1.readShort();
        this.var_1245 = class_127.getInstance().createInstance(param1.readShort()) as class_745;
        this.var_1245.read(param1);
        this.var_852 = param1.readInt();
        this.var_852 = Number(this.var_852) << 3 | Number(this.var_852) >>> 29;
        this.actionStyle = param1.readShort();
        this.counterType = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.status.write(param1);
        this.timer.write(param1);
        param1.writeShort(13478);
        this.var_1245.write(param1);
        param1.writeInt(Number(this.var_852) >>> 3 | Number(this.var_852) << 29);
        param1.writeShort(this.actionStyle);
        param1.writeShort(this.counterType);
    }
}
}
