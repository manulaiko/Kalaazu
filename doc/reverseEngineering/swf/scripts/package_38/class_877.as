package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_877 extends class_650 implements ICommand {

    public static const ID: int = 28690;


    public var var_4809: class_163;

    public function class_877(param1: String = "", param2: class_163 = null, param3: int = 0, param4: int = 0) {
        super(param1, param4, param3);
        if (param2 == null) {
            this.var_4809 = new class_163();
        } else {
            this.var_4809 = param2;
        }
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 20;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.var_4809 = class_127.getInstance().createInstance(param1.readShort()) as class_163;
        this.var_4809.read(param1);
        param1.readShort();
        param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        this.var_4809.write(param1);
        param1.writeShort(24318);
        param1.writeShort(12343);
    }
}
}
