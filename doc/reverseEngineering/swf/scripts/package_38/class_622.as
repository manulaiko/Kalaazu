package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_622 implements ICommand {

    public static const ID: int = 3850;


    public var var_4474: int = 0;

    public var name_106: int = 0;

    public var name_133: int = 0;

    public var name_56: Boolean = false;

    public var name_150: int = 0;

    public var name_40: Boolean = false;

    public function class_622(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: Boolean = false, param6: Boolean = false) {
        super();
        this.name_133 = param1;
        this.name_150 = param2;
        this.name_106 = param3;
        this.var_4474 = param4;
        this.name_56 = param5;
        this.name_40 = param6;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 18;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_4474 = param1.readInt();
        this.var_4474 = Number(this.var_4474) << 13 | Number(this.var_4474) >>> 19;
        this.name_106 = param1.readInt();
        this.name_106 = Number(this.name_106) >>> 5 | Number(this.name_106) << 27;
        this.name_133 = param1.readInt();
        this.name_133 = Number(this.name_133) >>> 9 | Number(this.name_133) << 23;
        this.name_56 = param1.readBoolean();
        this.name_150 = param1.readInt();
        this.name_150 = Number(this.name_150) << 4 | Number(this.name_150) >>> 28;
        this.name_40 = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(18440);
        param1.writeInt(Number(this.var_4474) >>> 13 | Number(this.var_4474) << 19);
        param1.writeInt(Number(this.name_106) << 5 | Number(this.name_106) >>> 27);
        param1.writeInt(Number(this.name_133) << 9 | Number(this.name_133) >>> 23);
        param1.writeBoolean(this.name_56);
        param1.writeInt(Number(this.name_150) >>> 4 | Number(this.name_150) << 28);
        param1.writeBoolean(this.name_40);
    }
}
}
