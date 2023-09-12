package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_905 implements ICommand {

    public static const ID: int = 25203;


    public var var_834: class_353;

    public function class_905(param1: class_353 = null) {
        super();
        if (param1 == null) {
            this.var_834 = new class_353();
        } else {
            this.var_834 = param1;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_834 = class_127.getInstance().createInstance(param1.readShort()) as class_353;
        this.var_834.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-17750);
        this.var_834.write(param1);
    }
}
}
