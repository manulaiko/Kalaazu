package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_566 implements ICommand {

    public static const ID: int = 22037;


    public var var_2304: int = 0;

    public var var_3601: int = 0;

    public var var_2245: int = 0;

    public var var_3452: int = 0;

    public var var_4752: int = 0;

    public var var_2978: Number = 0;

    public var var_4330: int = 0;

    public var var_4263: String = "";

    public var var_1326: int = 0;

    public var var_283: int = 0;

    public var var_1105: Number = 0;

    public var var_4965: int = 0;

    public function class_566(param1: int = 0, param2: int = 0, param3: Number = 0, param4: Number = 0, param5: int = 0, param6: int = 0, param7: int = 0, param8: int = 0, param9: int = 0, param10: int = 0, param11: int = 0, param12: String = "") {
        super();
        this.var_2245 = param1;
        this.var_3452 = param2;
        this.var_1105 = param3;
        this.var_2978 = param4;
        this.var_2304 = param5;
        this.var_4965 = param6;
        this.var_4752 = param7;
        this.var_4330 = param8;
        this.var_283 = param9;
        this.var_3601 = param10;
        this.var_1326 = param11;
        this.var_4263 = param12;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 54;
    }

    public function read(param1: IDataInput): void {
        this.var_2304 = param1.readInt();
        this.var_2304 = Number(this.var_2304) >>> 15 | Number(this.var_2304) << 17;
        this.var_3601 = param1.readInt();
        this.var_3601 = Number(this.var_3601) >>> 5 | Number(this.var_3601) << 27;
        this.var_2245 = param1.readInt();
        this.var_2245 = Number(this.var_2245) >>> 13 | Number(this.var_2245) << 19;
        this.var_3452 = param1.readInt();
        this.var_3452 = Number(this.var_3452) >>> 7 | Number(this.var_3452) << 25;
        this.var_4752 = param1.readInt();
        this.var_4752 = Number(this.var_4752) << 3 | Number(this.var_4752) >>> 29;
        this.var_2978 = param1.readDouble();
        this.var_4330 = param1.readInt();
        this.var_4330 = Number(this.var_4330) >>> 2 | Number(this.var_4330) << 30;
        this.var_4263 = param1.readUTF();
        this.var_1326 = param1.readInt();
        this.var_1326 = Number(this.var_1326) << 9 | Number(this.var_1326) >>> 23;
        this.var_283 = param1.readInt();
        this.var_283 = Number(this.var_283) << 11 | Number(this.var_283) >>> 21;
        this.var_1105 = param1.readDouble();
        this.var_4965 = param1.readInt();
        this.var_4965 = Number(this.var_4965) >>> 4 | Number(this.var_4965) << 28;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_2304) << 15 | Number(this.var_2304) >>> 17);
        param1.writeInt(Number(this.var_3601) << 5 | Number(this.var_3601) >>> 27);
        param1.writeInt(Number(this.var_2245) << 13 | Number(this.var_2245) >>> 19);
        param1.writeInt(Number(this.var_3452) << 7 | Number(this.var_3452) >>> 25);
        param1.writeInt(Number(this.var_4752) >>> 3 | Number(this.var_4752) << 29);
        param1.writeDouble(this.var_2978);
        param1.writeInt(Number(this.var_4330) << 2 | Number(this.var_4330) >>> 30);
        param1.writeUTF(this.var_4263);
        param1.writeInt(Number(this.var_1326) >>> 9 | Number(this.var_1326) << 23);
        param1.writeInt(Number(this.var_283) >>> 11 | Number(this.var_283) << 21);
        param1.writeDouble(this.var_1105);
        param1.writeInt(Number(this.var_4965) << 4 | Number(this.var_4965) >>> 28);
    }
}
}
