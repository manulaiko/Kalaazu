package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_634 implements ICommand {

    public static const ID: int = 17372;


    public var name_37: int = 0;

    public var var_2489: int = 0;

    public var name_115: int = 0;

    public function class_634(param1: int = 0, param2: int = 0, param3: int = 0) {
        super();
        this.name_115 = param1;
        this.name_37 = param2;
        this.var_2489 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 12;
    }

    public function read(param1: IDataInput): void {
        this.name_37 = param1.readInt();
        this.name_37 = Number(this.name_37) >>> 4 | Number(this.name_37) << 28;
        param1.readShort();
        this.var_2489 = param1.readInt();
        this.var_2489 = Number(this.var_2489) << 9 | Number(this.var_2489) >>> 23;
        this.name_115 = param1.readInt();
        this.name_115 = Number(this.name_115) >>> 14 | Number(this.name_115) << 18;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.name_37) << 4 | Number(this.name_37) >>> 28);
        param1.writeShort(11248);
        param1.writeInt(Number(this.var_2489) >>> 9 | Number(this.var_2489) << 23);
        param1.writeInt(Number(this.name_115) << 14 | Number(this.name_115) >>> 18);
    }
}
}
