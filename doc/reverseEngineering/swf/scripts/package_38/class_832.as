package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_832 implements ICommand {

    public static const ID: int = 10470;


    public var var_158: class_647;

    public function class_832(param1: class_647 = null) {
        super();
        if (param1 == null) {
            this.var_158 = new class_647();
        } else {
            this.var_158 = param1;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.var_158 = class_127.getInstance().createInstance(param1.readShort()) as class_647;
        this.var_158.read(param1);
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_158.write(param1);
        param1.writeShort(-15722);
    }
}
}
