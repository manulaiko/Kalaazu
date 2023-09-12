package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_353 implements ICommand {

    public static const ID: int = 20293;


    public var count: Number = 0;

    public var var_4809: class_163;

    public function class_353(param1: class_163 = null, param2: Number = 0) {
        super();
        if (param1 == null) {
            this.var_4809 = new class_163();
        } else {
            this.var_4809 = param1;
        }
        this.count = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.count = param1.readDouble();
        param1.readShort();
        this.var_4809 = class_127.getInstance().createInstance(param1.readShort()) as class_163;
        this.var_4809.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeDouble(this.count);
        param1.writeShort(-10749);
        this.var_4809.write(param1);
    }
}
}
