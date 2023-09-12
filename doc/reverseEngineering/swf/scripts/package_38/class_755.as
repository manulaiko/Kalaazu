package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_755 implements ICommand {

    public static const ID: int = 8689;


    public var var_3562: class_885;

    public var var_4859: class_766;

    public var var_732: class_935;

    public function class_755(param1: class_766 = null, param2: class_935 = null, param3: class_885 = null) {
        super();
        if (param1 == null) {
            this.var_4859 = new class_766();
        } else {
            this.var_4859 = param1;
        }
        if (param2 == null) {
            this.var_732 = new class_935();
        } else {
            this.var_732 = param2;
        }
        if (param3 == null) {
            this.var_3562 = new class_885();
        } else {
            this.var_3562 = param3;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.var_3562 = class_127.getInstance().createInstance(param1.readShort()) as class_885;
        this.var_3562.read(param1);
        this.var_4859 = class_127.getInstance().createInstance(param1.readShort()) as class_766;
        this.var_4859.read(param1);
        this.var_732 = class_127.getInstance().createInstance(param1.readShort()) as class_935;
        this.var_732.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_3562.write(param1);
        this.var_4859.write(param1);
        this.var_732.write(param1);
    }
}
}
