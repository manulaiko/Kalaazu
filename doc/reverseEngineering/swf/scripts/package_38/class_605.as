package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_605 implements ICommand {

    public static const ID: int = 16993;


    public var var_2270: class_315;

    public var var_1818: String = "";

    public function class_605(param1: String = "", param2: class_315 = null) {
        super();
        this.var_1818 = param1;
        if (param2 == null) {
            this.var_2270 = new class_315();
        } else {
            this.var_2270 = param2;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 2;
    }

    public function read(param1: IDataInput): void {
        this.var_2270 = class_127.getInstance().createInstance(param1.readShort()) as class_315;
        this.var_2270.read(param1);
        this.var_1818 = param1.readUTF();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_2270.write(param1);
        param1.writeUTF(this.var_1818);
    }
}
}
