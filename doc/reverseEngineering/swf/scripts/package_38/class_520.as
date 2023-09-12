package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_520 implements ICommand {

    public static const ID: int = 30931;


    public var var_710: int = 0;

    public var var_2911: int = 0;

    public var var_2158: int = 0;

    public function class_520(param1: int = 0, param2: int = 0, param3: int = 0) {
        super();
        this.var_2158 = param1;
        this.var_2911 = param2;
        this.var_710 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 12;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        param1.readShort();
        this.var_710 = param1.readInt();
        this.var_710 = Number(this.var_710) << 13 | Number(this.var_710) >>> 19;
        this.var_2911 = param1.readInt();
        this.var_2911 = Number(this.var_2911) << 16 | Number(this.var_2911) >>> 16;
        this.var_2158 = param1.readInt();
        this.var_2158 = Number(this.var_2158) << 15 | Number(this.var_2158) >>> 17;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-4912);
        param1.writeShort(-6683);
        param1.writeInt(Number(this.var_710) >>> 13 | Number(this.var_710) << 19);
        param1.writeInt(Number(this.var_2911) >>> 16 | Number(this.var_2911) << 16);
        param1.writeInt(Number(this.var_2158) >>> 15 | Number(this.var_2158) << 17);
    }
}
}
