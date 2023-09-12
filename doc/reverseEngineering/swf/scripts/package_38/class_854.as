package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_854 implements ICommand {

    public static const ID: int = 9702;


    public var var_2337: class_748;

    public function class_854(param1: class_748 = null) {
        super();
        if (param1 == null) {
            this.var_2337 = new class_748();
        } else {
            this.var_2337 = param1;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.var_2337 = class_127.getInstance().createInstance(param1.readShort()) as class_748;
        this.var_2337.read(param1);
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_2337.write(param1);
        param1.writeShort(-24121);
    }
}
}
