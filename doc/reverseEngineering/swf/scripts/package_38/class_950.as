package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_950 implements ICommand {

    public static const ID: int = 10809;


    public var name_150: int = 0;

    public var var_4319: String = "";

    public var var_1844: int = 0;

    public var var_4412: int = 0;

    public function class_950(param1: String = "", param2: int = 0, param3: int = 0, param4: int = 0) {
        super();
        this.var_4319 = param1;
        this.var_1844 = param2;
        this.var_4412 = param3;
        this.name_150 = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 14;
    }

    public function read(param1: IDataInput): void {
        this.name_150 = param1.readInt();
        this.name_150 = Number(this.name_150) >>> 10 | Number(this.name_150) << 22;
        this.var_4319 = param1.readUTF();
        this.var_1844 = param1.readInt();
        this.var_1844 = Number(this.var_1844) >>> 13 | Number(this.var_1844) << 19;
        this.var_4412 = param1.readInt();
        this.var_4412 = Number(this.var_4412) >>> 12 | Number(this.var_4412) << 20;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.name_150) << 10 | Number(this.name_150) >>> 22);
        param1.writeUTF(this.var_4319);
        param1.writeInt(Number(this.var_1844) << 13 | Number(this.var_1844) >>> 19);
        param1.writeInt(Number(this.var_4412) << 12 | Number(this.var_4412) >>> 20);
    }
}
}
