package package_38 {

import flash.utils.ByteArray;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_102 implements ICommand {

    public static const ID: int = 21931;


    public var var_4027: ByteArray;

    public function class_102(param1: ByteArray = null) {
        this.var_4027 = new ByteArray();
        super();
        if (param1 != null) {
            this.var_4027 = param1;
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
        this.var_4027.clear();
        param1.readBytes(this.var_4027, 0, param1.readInt());
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-27333);
        param1.writeInt(this.var_4027.length);
        param1.writeBytes(this.var_4027, 0, this.var_4027.length);
    }
}
}
