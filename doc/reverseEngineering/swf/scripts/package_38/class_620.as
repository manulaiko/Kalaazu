package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_620 extends class_434 implements ICommand {

    public static const ID: int = 16157;


    public var timer: int = 0;

    public var var_4445: class_892;

    public function class_620(param1: class_892 = null, param2: int = 0) {
        super();
        this.timer = param2;
        if (param1 == null) {
            this.var_4445 = new class_892();
        } else {
            this.var_4445 = param1;
        }
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 4;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.timer = param1.readInt();
        this.timer = Number(this.timer) >>> 6 | Number(this.timer) << 26;
        this.var_4445 = class_127.getInstance().createInstance(param1.readShort()) as class_892;
        this.var_4445.read(param1);
        param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeInt(Number(this.timer) << 6 | Number(this.timer) >>> 26);
        this.var_4445.write(param1);
        param1.writeShort(26792);
    }
}
}
