package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_492 extends class_491 implements ICommand {

    public static const ID: int = 23900;


    public var var_3151: int = 0;

    public var var_1359: int = 0;

    public var var_2015: int = 0;

    public function class_492(param1: int = 0, param2: Number = 0, param3: Number = 0, param4: int = 0, param5: Number = 0, param6: int = 0) {
        super(param3, param2, param5);
        this.var_3151 = param6;
        this.var_1359 = param4;
        this.var_2015 = param1;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 60;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.var_3151 = param1.readInt();
        this.var_3151 = Number(this.var_3151) << 7 | Number(this.var_3151) >>> 25;
        this.var_1359 = param1.readInt();
        this.var_1359 = Number(this.var_1359) >>> 14 | Number(this.var_1359) << 18;
        this.var_2015 = param1.readInt();
        this.var_2015 = Number(this.var_2015) << 4 | Number(this.var_2015) >>> 28;
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeInt(Number(this.var_3151) >>> 7 | Number(this.var_3151) << 25);
        param1.writeInt(Number(this.var_1359) << 14 | Number(this.var_1359) >>> 18);
        param1.writeInt(Number(this.var_2015) >>> 4 | Number(this.var_2015) << 28);
    }
}
}
