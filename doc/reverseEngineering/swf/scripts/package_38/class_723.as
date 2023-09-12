package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_723 implements ICommand {

    public static const ID: int = 11406;


    public var var_2965: Number = 0;

    public var var_158: class_647;

    public var var_1618: Number = 0;

    public function class_723(param1: class_647 = null, param2: Number = 0, param3: Number = 0) {
        super();
        if (param1 == null) {
            this.var_158 = new class_647();
        } else {
            this.var_158 = param1;
        }
        this.var_2965 = param2;
        this.var_1618 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_2965 = param1.readFloat();
        this.var_158 = class_127.getInstance().createInstance(param1.readShort()) as class_647;
        this.var_158.read(param1);
        this.var_1618 = param1.readFloat();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeFloat(this.var_2965);
        this.var_158.write(param1);
        param1.writeFloat(this.var_1618);
    }
}
}
