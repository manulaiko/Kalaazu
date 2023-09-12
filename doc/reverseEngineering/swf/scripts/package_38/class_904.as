package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_904 implements ICommand {

    public static const ID: int = 29823;


    public var name_37: int = 0;

    public var var_2731: Boolean = false;

    public var var_2489: int = 0;

    public function class_904(param1: int = 0, param2: int = 0, param3: Boolean = false) {
        super();
        this.var_2489 = param1;
        this.name_37 = param2;
        this.var_2731 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 9;
    }

    public function read(param1: IDataInput): void {
        this.name_37 = param1.readInt();
        this.name_37 = Number(this.name_37) << 3 | Number(this.name_37) >>> 29;
        param1.readShort();
        this.var_2731 = param1.readBoolean();
        this.var_2489 = param1.readInt();
        this.var_2489 = Number(this.var_2489) >>> 7 | Number(this.var_2489) << 25;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.name_37) >>> 3 | Number(this.name_37) << 29);
        param1.writeShort(27532);
        param1.writeBoolean(this.var_2731);
        param1.writeInt(Number(this.var_2489) << 7 | Number(this.var_2489) >>> 25);
    }
}
}
