package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_740 implements ICommand {

    public static const const_682: uint = 0;

    public static const const_3280: uint = 1;

    public static const ID: int = 19614;


    public var var_2168: int = 0;

    public var updateMode: uint = 0;

    public var score: int = 0;

    public function class_740(param1: uint = 0, param2: int = 0, param3: int = 0) {
        super();
        this.updateMode = param1;
        this.var_2168 = param2;
        this.score = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_2168 = param1.readInt();
        this.var_2168 = Number(this.var_2168) << 13 | Number(this.var_2168) >>> 19;
        this.updateMode = param1.readShort();
        param1.readShort();
        this.score = param1.readInt();
        this.score = Number(this.score) >>> 4 | Number(this.score) << 28;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_2168) >>> 13 | Number(this.var_2168) << 19);
        param1.writeShort(this.updateMode);
        param1.writeShort(18798);
        param1.writeInt(Number(this.score) << 4 | Number(this.score) >>> 28);
    }
}
}
