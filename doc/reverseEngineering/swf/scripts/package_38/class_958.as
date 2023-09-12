package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_958 implements ICommand {

    public static const ID: int = 4390;


    public var var_2327: Boolean = false;

    public var var_2245: int = 0;

    public function class_958(param1: int = 0, param2: Boolean = false) {
        super();
        this.var_2245 = param1;
        this.var_2327 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_2327 = param1.readBoolean();
        param1.readShort();
        this.var_2245 = param1.readInt();
        this.var_2245 = Number(this.var_2245) >>> 11 | Number(this.var_2245) << 21;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-30289);
        param1.writeBoolean(this.var_2327);
        param1.writeShort(-5379);
        param1.writeInt(Number(this.var_2245) << 11 | Number(this.var_2245) >>> 21);
    }
}
}
