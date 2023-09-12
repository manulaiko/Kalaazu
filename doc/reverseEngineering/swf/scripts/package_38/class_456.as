package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_456 implements ICommand {

    public static const ID: int = 8578;


    public var infected: Boolean = false;

    public var var_3175: int = 0;

    public function class_456(param1: Boolean = false, param2: int = 0) {
        super();
        this.infected = param1;
        this.var_3175 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        this.infected = param1.readBoolean();
        param1.readShort();
        this.var_3175 = param1.readInt();
        this.var_3175 = Number(this.var_3175) << 14 | Number(this.var_3175) >>> 18;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.infected);
        param1.writeShort(-16456);
        param1.writeInt(Number(this.var_3175) >>> 14 | Number(this.var_3175) << 18);
    }
}
}
