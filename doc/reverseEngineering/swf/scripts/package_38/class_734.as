package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_734 implements ICommand {

    public static const ID: int = 3801;


    public var var_1602: class_427;

    public var var_2965: int = 0;

    public var var_158: class_647;

    public function class_734(param1: class_647 = null, param2: class_427 = null, param3: int = 0) {
        super();
        if (param1 == null) {
            this.var_158 = new class_647();
        } else {
            this.var_158 = param1;
        }
        if (param2 == null) {
            this.var_1602 = new class_427();
        } else {
            this.var_1602 = param2;
        }
        this.var_2965 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.var_1602 = class_127.getInstance().createInstance(param1.readShort()) as class_427;
        this.var_1602.read(param1);
        this.var_2965 = param1.readInt();
        this.var_2965 = Number(this.var_2965) << 10 | Number(this.var_2965) >>> 22;
        this.var_158 = class_127.getInstance().createInstance(param1.readShort()) as class_647;
        this.var_158.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_1602.write(param1);
        param1.writeInt(Number(this.var_2965) >>> 10 | Number(this.var_2965) << 22);
        this.var_158.write(param1);
    }
}
}
