package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_690 implements ICommand {

    public static const ID: int = 4330;


    public var enabled: Boolean = false;

    public var var_3505: int = 0;

    public function class_690(param1: Boolean = false, param2: int = 0) {
        super();
        this.enabled = param1;
        this.var_3505 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        this.enabled = param1.readBoolean();
        this.var_3505 = param1.readInt();
        this.var_3505 = Number(this.var_3505) >>> 10 | Number(this.var_3505) << 22;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.enabled);
        param1.writeInt(Number(this.var_3505) << 10 | Number(this.var_3505) >>> 22);
    }
}
}
