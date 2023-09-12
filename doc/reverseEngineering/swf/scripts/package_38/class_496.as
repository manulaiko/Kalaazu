package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_496 implements ICommand {

    public static const ID: int = 14641;


    public var alignment: class_516;

    public var var_2863: String = "";

    public var var_2205: Boolean = false;

    public var closeable: Boolean = false;

    public function class_496(param1: class_516 = null, param2: Boolean = false, param3: Boolean = false, param4: String = "") {
        super();
        if (param1 == null) {
            this.alignment = new class_516();
        } else {
            this.alignment = param1;
        }
        this.closeable = param2;
        this.var_2205 = param3;
        this.var_2863 = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.alignment = class_127.getInstance().createInstance(param1.readShort()) as class_516;
        this.alignment.read(param1);
        this.var_2863 = param1.readUTF();
        this.var_2205 = param1.readBoolean();
        this.closeable = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-6625);
        this.alignment.write(param1);
        param1.writeUTF(this.var_2863);
        param1.writeBoolean(this.var_2205);
        param1.writeBoolean(this.closeable);
    }
}
}
