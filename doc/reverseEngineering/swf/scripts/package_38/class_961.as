package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_961 implements ICommand {

    public static const ID: int = 11468;


    public var var_1574: int = 0;

    public var var_4184: int = 0;

    public var name_90: int = 0;

    public var shield: int = 0;

    public var name_105: int = 0;

    public var name_37: int = 0;

    public var name_128: int = 0;

    public var var_2217: int = 0;

    public var var_3310: Boolean = false;

    public function class_961(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0, param6: int = 0, param7: int = 0, param8: int = 0, param9: Boolean = false) {
        super();
        this.name_128 = param1;
        this.var_4184 = param2;
        this.shield = param3;
        this.name_105 = param4;
        this.name_90 = param5;
        this.name_37 = param6;
        this.var_2217 = param7;
        this.var_1574 = param8;
        this.var_3310 = param9;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 33;
    }

    public function read(param1: IDataInput): void {
        this.var_1574 = param1.readInt();
        this.var_1574 = Number(this.var_1574) << 10 | Number(this.var_1574) >>> 22;
        this.var_4184 = param1.readInt();
        this.var_4184 = Number(this.var_4184) >>> 7 | Number(this.var_4184) << 25;
        this.name_90 = param1.readInt();
        this.name_90 = Number(this.name_90) >>> 8 | Number(this.name_90) << 24;
        this.shield = param1.readInt();
        this.shield = Number(this.shield) << 12 | Number(this.shield) >>> 20;
        this.name_105 = param1.readInt();
        this.name_105 = Number(this.name_105) << 9 | Number(this.name_105) >>> 23;
        this.name_37 = param1.readInt();
        this.name_37 = Number(this.name_37) >>> 13 | Number(this.name_37) << 19;
        this.name_128 = param1.readInt();
        this.name_128 = Number(this.name_128) >>> 9 | Number(this.name_128) << 23;
        this.var_2217 = param1.readInt();
        this.var_2217 = Number(this.var_2217) << 6 | Number(this.var_2217) >>> 26;
        this.var_3310 = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_1574) >>> 10 | Number(this.var_1574) << 22);
        param1.writeInt(Number(this.var_4184) << 7 | Number(this.var_4184) >>> 25);
        param1.writeInt(Number(this.name_90) << 8 | Number(this.name_90) >>> 24);
        param1.writeInt(Number(this.shield) >>> 12 | Number(this.shield) << 20);
        param1.writeInt(Number(this.name_105) >>> 9 | Number(this.name_105) << 23);
        param1.writeInt(Number(this.name_37) << 13 | Number(this.name_37) >>> 19);
        param1.writeInt(Number(this.name_128) << 9 | Number(this.name_128) >>> 23);
        param1.writeInt(Number(this.var_2217) >>> 6 | Number(this.var_2217) << 26);
        param1.writeBoolean(this.var_3310);
    }
}
}
