package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_869 implements ICommand {

    public static const const_3106: uint = 2;

    public static const LEVEL: uint = 0;

    public static const const_1525: uint = 3;

    public static const const_358: uint = 1;

    public static const ID: int = 29001;


    public var var_430: uint = 0;

    public var maxValue: Number = 0;

    public var var_4154: Vector.<class_934>;

    public var minValue: Number = 0;

    public var var_1438: Vector.<class_934>;

    public function class_869(param1: uint = 0, param2: Number = 0, param3: Number = 0, param4: Vector.<class_934> = null, param5: Vector.<class_934> = null) {
        super();
        this.var_430 = param1;
        this.minValue = param2;
        this.maxValue = param3;
        if (param4 == null) {
            this.var_4154 = new Vector.<class_934>();
        } else {
            this.var_4154 = param4;
        }
        if (param5 == null) {
            this.var_1438 = new Vector.<class_934>();
        } else {
            this.var_1438 = param5;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 24;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        this.var_430 = param1.readShort();
        this.maxValue = param1.readDouble();
        param1.readShort();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_4154.length > 0) {
            this.var_4154.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_934).read(param1);
            this.var_4154.push(_loc4_);
            _loc2_++;
        }
        this.minValue = param1.readDouble();
        while (this.var_1438.length > 0) {
            this.var_1438.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc5_ = class_127.getInstance().createInstance(param1.readShort()) as class_934).read(param1);
            this.var_1438.push(_loc5_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        param1.writeShort(this.var_430);
        param1.writeDouble(this.maxValue);
        param1.writeShort(17018);
        param1.writeInt(this.var_4154.length);
        for each(_loc2_ in this.var_4154) {
            _loc2_.write(param1);
        }
        param1.writeDouble(this.minValue);
        param1.writeInt(this.var_1438.length);
        for each(_loc3_ in this.var_1438) {
            _loc3_.write(param1);
        }
    }
}
}
