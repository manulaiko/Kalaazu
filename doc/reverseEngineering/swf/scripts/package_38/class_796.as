package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_796 implements ICommand {

    public static const SHIELD: uint = 1;

    public static const const_1075: uint = 0;

    public static const ID: int = 6953;


    public var currentHitpoints: int = 0;

    public var var_2189: int = 0;

    public var var_3382: int = 0;

    public var var_1820: uint = 0;

    public var var_4754: int = 0;

    public function class_796(param1: uint = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0) {
        super();
        this.var_1820 = param1;
        this.var_4754 = param2;
        this.var_3382 = param3;
        this.currentHitpoints = param4;
        this.var_2189 = param5;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 16;
    }

    public function read(param1: IDataInput): void {
        this.currentHitpoints = param1.readInt();
        this.currentHitpoints = Number(this.currentHitpoints) >>> 14 | Number(this.currentHitpoints) << 18;
        this.var_2189 = param1.readInt();
        this.var_2189 = Number(this.var_2189) << 1 | Number(this.var_2189) >>> 31;
        this.var_3382 = param1.readInt();
        this.var_3382 = Number(this.var_3382) >>> 6 | Number(this.var_3382) << 26;
        this.var_1820 = param1.readShort();
        param1.readShort();
        this.var_4754 = param1.readInt();
        this.var_4754 = Number(this.var_4754) >>> 7 | Number(this.var_4754) << 25;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.currentHitpoints) << 14 | Number(this.currentHitpoints) >>> 18);
        param1.writeInt(Number(this.var_2189) >>> 1 | Number(this.var_2189) << 31);
        param1.writeInt(Number(this.var_3382) << 6 | Number(this.var_3382) >>> 26);
        param1.writeShort(this.var_1820);
        param1.writeShort(-2637);
        param1.writeInt(Number(this.var_4754) << 7 | Number(this.var_4754) >>> 25);
    }
}
}
