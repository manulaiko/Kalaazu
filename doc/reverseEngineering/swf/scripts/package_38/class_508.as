package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_508 extends class_432 implements ICommand {

    public static const ID: int = 25891;


    public var name_105: int = 0;

    public var hp: int = 0;

    public var var_2217: int = 0;

    public var var_3738: int = 0;

    public var shield: int = 0;

    public var var_737: int = 0;

    public function class_508(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0, param6: int = 0) {
        super();
        this.hp = param1;
        this.var_737 = param2;
        this.shield = param5;
        this.name_105 = param6;
        this.var_2217 = param3;
        this.var_3738 = param4;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 24;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.name_105 = param1.readInt();
        this.name_105 = Number(this.name_105) >>> 15 | Number(this.name_105) << 17;
        this.hp = param1.readInt();
        this.hp = Number(this.hp) << 6 | Number(this.hp) >>> 26;
        this.var_2217 = param1.readInt();
        this.var_2217 = Number(this.var_2217) >>> 8 | Number(this.var_2217) << 24;
        this.var_3738 = param1.readInt();
        this.var_3738 = Number(this.var_3738) >>> 13 | Number(this.var_3738) << 19;
        this.shield = param1.readInt();
        this.shield = Number(this.shield) >>> 16 | Number(this.shield) << 16;
        this.var_737 = param1.readInt();
        this.var_737 = Number(this.var_737) >>> 8 | Number(this.var_737) << 24;
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeInt(Number(this.name_105) << 15 | Number(this.name_105) >>> 17);
        param1.writeInt(Number(this.hp) >>> 6 | Number(this.hp) << 26);
        param1.writeInt(Number(this.var_2217) << 8 | Number(this.var_2217) >>> 24);
        param1.writeInt(Number(this.var_3738) << 13 | Number(this.var_3738) >>> 19);
        param1.writeInt(Number(this.shield) << 16 | Number(this.shield) >>> 16);
        param1.writeInt(Number(this.var_737) << 8 | Number(this.var_737) >>> 24);
    }
}
}
