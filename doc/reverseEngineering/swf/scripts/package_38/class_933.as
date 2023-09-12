package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_933 implements ICommand {

    public static const ID: int = 31849;


    public var var_4128: class_424;

    public var var_1107: int = 0;

    public function class_933(param1: class_424 = null, param2: int = 0) {
        super();
        if (param1 == null) {
            this.var_4128 = new class_424();
        } else {
            this.var_4128 = param1;
        }
        this.var_1107 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 2;
    }

    public function read(param1: IDataInput): void {
        this.var_4128 = class_127.getInstance().createInstance(param1.readShort()) as class_424;
        this.var_4128.read(param1);
        this.var_1107 = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_4128.write(param1);
        param1.writeShort(this.var_1107);
    }
}
}
