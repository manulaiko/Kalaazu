package package_38 {

import flash.utils.ByteArray;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_700 implements ICommand {

    public static const ID: int = 26601;


    public var var_3379: ByteArray;

    public function class_700(param1: ByteArray = null) {
        this.var_3379 = new ByteArray();
        super();
        if (param1 != null) {
            this.var_3379 = param1;
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
        this.var_3379.clear();
        param1.readBytes(this.var_3379, 0, param1.readInt());
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(2350);
        param1.writeInt(this.var_3379.length);
        param1.writeBytes(this.var_3379, 0, this.var_3379.length);
        param1.writeShort(19982);
    }
}
}
