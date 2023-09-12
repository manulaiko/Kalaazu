package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_511 implements ICommand {

    public static const ID: int = 25145;


    public var var_1007: class_681;

    public var amount: int = 0;

    public var seconds: int = 0;

    public function class_511(param1: class_681 = null, param2: int = 0, param3: int = 0) {
        super();
        if (param1 == null) {
            this.var_1007 = new class_681();
        } else {
            this.var_1007 = param1;
        }
        this.amount = param2;
        this.seconds = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_1007 = class_127.getInstance().createInstance(param1.readShort()) as class_681;
        this.var_1007.read(param1);
        this.amount = param1.readInt();
        this.amount = Number(this.amount) << 11 | Number(this.amount) >>> 21;
        this.seconds = param1.readInt();
        this.seconds = Number(this.seconds) >>> 11 | Number(this.seconds) << 21;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(5189);
        this.var_1007.write(param1);
        param1.writeInt(Number(this.amount) >>> 11 | Number(this.amount) << 21);
        param1.writeInt(Number(this.seconds) << 11 | Number(this.seconds) >>> 21);
    }
}
}
