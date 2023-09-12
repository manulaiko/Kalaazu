package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_801 implements ICommand {

    public static const ID: int = 10530;


    public var var_367: class_557;

    public var name_122: class_900;

    public var var_1556: class_557;

    public var var_4528: Boolean = false;

    public function class_801(param1: Boolean = false, param2: class_557 = null, param3: class_557 = null, param4: class_900 = null) {
        super();
        this.var_4528 = param1;
        if (param2 == null) {
            this.var_1556 = new class_557();
        } else {
            this.var_1556 = param2;
        }
        if (param3 == null) {
            this.var_367 = new class_557();
        } else {
            this.var_367 = param3;
        }
        if (param4 == null) {
            this.name_122 = new class_900();
        } else {
            this.name_122 = param4;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 1;
    }

    public function read(param1: IDataInput): void {
        this.var_367 = class_127.getInstance().createInstance(param1.readShort()) as class_557;
        this.var_367.read(param1);
        this.name_122 = class_127.getInstance().createInstance(param1.readShort()) as class_900;
        this.name_122.read(param1);
        this.var_1556 = class_127.getInstance().createInstance(param1.readShort()) as class_557;
        this.var_1556.read(param1);
        param1.readShort();
        this.var_4528 = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_367.write(param1);
        this.name_122.write(param1);
        this.var_1556.write(param1);
        param1.writeShort(5154);
        param1.writeBoolean(this.var_4528);
    }
}
}
