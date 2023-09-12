package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_476 implements ICommand {

    public static const ID: int = 5888;


    public var var_4592: class_353;

    public function class_476(param1: class_353 = null) {
        super();
        if (param1 == null) {
            this.var_4592 = new class_353();
        } else {
            this.var_4592 = param1;
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
        this.var_4592 = class_127.getInstance().createInstance(param1.readShort()) as class_353;
        this.var_4592.read(param1);
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-26817);
        this.var_4592.write(param1);
        param1.writeShort(-15883);
    }
}
}
