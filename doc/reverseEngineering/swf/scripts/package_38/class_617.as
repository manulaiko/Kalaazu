package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_617 implements ICommand {

    public static const const_1219: uint = 1;

    public static const const_1789: uint = 15;

    public static const JUMP: uint = 0;

    public static const const_2005: uint = 5;

    public static const const_1882: uint = 2;

    public static const const_995: uint = 9;

    public static const const_1234: uint = 10;

    public static const LOGOUT: uint = 6;

    public static const const_1391: uint = 16;

    public static const const_705: uint = 12;

    public static const const_795: uint = 8;

    public static const const_1027: uint = 14;

    public static const const_1566: uint = 3;

    public static const const_1107: uint = 4;

    public static const const_2160: uint = 13;

    public static const const_402: uint = 11;

    public static const const_1199: uint = 7;

    public static const ID: int = 423;


    public var var_2201: uint = 0;

    public var charCode: int = 0;

    public var var_3729: Vector.<int>;

    public var parameter: int = 0;

    public function class_617(param1: uint = 0, param2: Vector.<int> = null, param3: int = 0, param4: int = 0) {
        super();
        this.var_2201 = param1;
        if (param2 == null) {
            this.var_3729 = new Vector.<int>();
        } else {
            this.var_3729 = param2;
        }
        this.parameter = param3;
        this.charCode = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 10;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = 0;
        this.var_2201 = param1.readShort();
        this.charCode = param1.readShort();
        param1.readShort();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_3729.length > 0) {
            this.var_3729.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            _loc4_ = (_loc4_ = int(param1.readInt())) << 5 | _loc4_ >>> 27;
            this.var_3729.push(_loc4_);
            _loc2_++;
        }
        this.parameter = param1.readInt();
        this.parameter = Number(this.parameter) >>> 13 | Number(this.parameter) << 19;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: int = 0;
        param1.writeShort(this.var_2201);
        param1.writeShort(this.charCode);
        param1.writeShort(-20216);
        param1.writeInt(this.var_3729.length);
        for each(_loc2_ in this.var_3729) {
            param1.writeInt(_loc2_ >>> 5 | _loc2_ << 27);
        }
        param1.writeInt(Number(this.parameter) << 13 | Number(this.parameter) >>> 19);
    }
}
}
