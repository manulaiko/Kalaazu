package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_778 implements ICommand {

    public static const ID: int = 12207;


    public var condition: class_486;

    public var var_2987: class_870;

    public function class_778(param1: class_870 = null, param2: class_486 = null) {
        super();
        if (param1 == null) {
            this.var_2987 = new class_870();
        } else {
            this.var_2987 = param1;
        }
        if (param2 == null) {
            this.condition = new class_486();
        } else {
            this.condition = param2;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.condition = class_127.getInstance().createInstance(param1.readShort()) as class_486;
        this.condition.read(param1);
        this.var_2987 = class_127.getInstance().createInstance(param1.readShort()) as class_870;
        this.var_2987.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.condition.write(param1);
        this.var_2987.write(param1);
    }
}
}
