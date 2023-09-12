package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_347 implements ICommand {

    public static const ID: int = 25971;


    public var selection: class_345;

    public var var_2890: class_99;

    public function class_347(param1: class_345 = null, param2: class_99 = null) {
        super();
        if (param1 == null) {
            this.selection = new class_345();
        } else {
            this.selection = param1;
        }
        if (param2 == null) {
            this.var_2890 = new class_99();
        } else {
            this.var_2890 = param2;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.selection = class_127.getInstance().createInstance(param1.readShort()) as class_345;
        this.selection.read(param1);
        param1.readShort();
        this.var_2890 = class_127.getInstance().createInstance(param1.readShort()) as class_99;
        this.var_2890.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.selection.write(param1);
        param1.writeShort(8550);
        this.var_2890.write(param1);
    }
}
}
