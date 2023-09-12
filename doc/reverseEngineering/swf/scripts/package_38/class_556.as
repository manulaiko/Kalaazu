package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_556 implements ICommand {

    public static const ID: int = 2633;


    public var var_674: int = 0;

    public var var_2497: String = "";

    public var var_325: int = 0;

    public var var_4100: int = 0;

    public var var_2224: int = 0;

    public function class_556(param1: String = "", param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0) {
        super();
        this.var_2497 = param1;
        this.var_4100 = param2;
        this.var_325 = param3;
        this.var_674 = param4;
        this.var_2224 = param5;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 18;
    }

    public function read(param1: IDataInput): void {
        this.var_674 = param1.readInt();
        this.var_674 = Number(this.var_674) << 13 | Number(this.var_674) >>> 19;
        this.var_2497 = param1.readUTF();
        this.var_325 = param1.readInt();
        this.var_325 = Number(this.var_325) << 6 | Number(this.var_325) >>> 26;
        this.var_4100 = param1.readInt();
        this.var_4100 = Number(this.var_4100) >>> 7 | Number(this.var_4100) << 25;
        param1.readShort();
        param1.readShort();
        this.var_2224 = param1.readInt();
        this.var_2224 = Number(this.var_2224) >>> 12 | Number(this.var_2224) << 20;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_674) >>> 13 | Number(this.var_674) << 19);
        param1.writeUTF(this.var_2497);
        param1.writeInt(Number(this.var_325) >>> 6 | Number(this.var_325) << 26);
        param1.writeInt(Number(this.var_4100) << 7 | Number(this.var_4100) >>> 25);
        param1.writeShort(-5479);
        param1.writeShort(-25294);
        param1.writeInt(Number(this.var_2224) << 12 | Number(this.var_2224) >>> 20);
    }
}
}
