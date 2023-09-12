package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_940 implements ICommand {

    public static const ID: int = 18091;


    public var name_18: int = 0;

    public var var_4787: int = 0;

    public var var_2295: int = 0;

    public var name_150: int = 0;

    public var name_141: int = 0;

    public function class_940(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0) {
        super();
        this.name_150 = param1;
        this.name_141 = param2;
        this.name_18 = param3;
        this.var_4787 = param4;
        this.var_2295 = param5;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 20;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.name_18 = param1.readInt();
        this.name_18 = Number(this.name_18) << 5 | Number(this.name_18) >>> 27;
        this.var_4787 = param1.readInt();
        this.var_4787 = Number(this.var_4787) << 12 | Number(this.var_4787) >>> 20;
        this.var_2295 = param1.readInt();
        this.var_2295 = Number(this.var_2295) >>> 14 | Number(this.var_2295) << 18;
        this.name_150 = param1.readInt();
        this.name_150 = Number(this.name_150) >>> 14 | Number(this.name_150) << 18;
        this.name_141 = param1.readInt();
        this.name_141 = Number(this.name_141) >>> 7 | Number(this.name_141) << 25;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-19609);
        param1.writeInt(Number(this.name_18) >>> 5 | Number(this.name_18) << 27);
        param1.writeInt(Number(this.var_4787) >>> 12 | Number(this.var_4787) << 20);
        param1.writeInt(Number(this.var_2295) << 14 | Number(this.var_2295) >>> 18);
        param1.writeInt(Number(this.name_150) << 14 | Number(this.name_150) >>> 18);
        param1.writeInt(Number(this.name_141) << 7 | Number(this.name_141) >>> 25);
    }
}
}
