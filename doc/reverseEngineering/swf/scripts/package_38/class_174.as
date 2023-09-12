package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_174 implements ICommand {

    public static const const_1077: uint = 1;

    public static const PET: uint = 3;

    public static const const_2199: uint = 2;

    public static const INACTIVE: uint = 0;

    public static const const_1452: uint = 5;

    public static const const_1459: uint = 4;

    public static const const_1592: uint = 6;

    public static const ID: int = 25272;


    public var var_4997: int = 0;

    public var var_2651: int = 0;

    public var var_3749: int = 0;

    public var var_1591: int = 0;

    public var var_2027: int = 0;

    public var var_4734: int = 0;

    public var type: uint = 0;

    public var var_837: int = 0;

    public var var_1909: int = 0;

    public function class_174(param1: uint = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0, param6: int = 0, param7: int = 0, param8: int = 0, param9: int = 0) {
        super();
        this.type = param1;
        this.var_2027 = param2;
        this.var_2651 = param3;
        this.var_4997 = param4;
        this.var_4734 = param5;
        this.var_1591 = param6;
        this.var_1909 = param7;
        this.var_837 = param8;
        this.var_3749 = param9;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 32;
    }

    public function read(param1: IDataInput): void {
        this.var_4997 = param1.readInt();
        this.var_4997 = Number(this.var_4997) << 12 | Number(this.var_4997) >>> 20;
        this.var_2651 = param1.readInt();
        this.var_2651 = Number(this.var_2651) >>> 7 | Number(this.var_2651) << 25;
        this.var_3749 = param1.readInt();
        this.var_3749 = Number(this.var_3749) << 11 | Number(this.var_3749) >>> 21;
        this.var_1591 = param1.readInt();
        this.var_1591 = Number(this.var_1591) << 5 | Number(this.var_1591) >>> 27;
        this.var_2027 = param1.readInt();
        this.var_2027 = Number(this.var_2027) << 6 | Number(this.var_2027) >>> 26;
        this.var_4734 = param1.readInt();
        this.var_4734 = Number(this.var_4734) >>> 1 | Number(this.var_4734) << 31;
        this.type = param1.readShort();
        this.var_837 = param1.readInt();
        this.var_837 = Number(this.var_837) >>> 1 | Number(this.var_837) << 31;
        param1.readShort();
        this.var_1909 = param1.readInt();
        this.var_1909 = Number(this.var_1909) >>> 8 | Number(this.var_1909) << 24;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_4997) >>> 12 | Number(this.var_4997) << 20);
        param1.writeInt(Number(this.var_2651) << 7 | Number(this.var_2651) >>> 25);
        param1.writeInt(Number(this.var_3749) >>> 11 | Number(this.var_3749) << 21);
        param1.writeInt(Number(this.var_1591) >>> 5 | Number(this.var_1591) << 27);
        param1.writeInt(Number(this.var_2027) >>> 6 | Number(this.var_2027) << 26);
        param1.writeInt(Number(this.var_4734) << 1 | Number(this.var_4734) >>> 31);
        param1.writeShort(this.type);
        param1.writeInt(Number(this.var_837) << 1 | Number(this.var_837) >>> 31);
        param1.writeShort(-10973);
        param1.writeInt(Number(this.var_1909) << 8 | Number(this.var_1909) >>> 24);
    }
}
}
