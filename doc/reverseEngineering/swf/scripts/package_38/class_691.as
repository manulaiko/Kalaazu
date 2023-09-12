package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_691 implements ICommand {

    public static const ID: int = 12308;


    public var var_3315: Vector.<class_946>;

    public var var_1823: int = 0;

    public var var_4832: Vector.<class_479>;

    public var name_93: int = 0;

    public function class_691(param1: int = 0, param2: Vector.<class_946> = null, param3: Vector.<class_479> = null, param4: int = 0) {
        super();
        this.name_93 = param1;
        if (param2 == null) {
            this.var_3315 = new Vector.<class_946>();
        } else {
            this.var_3315 = param2;
        }
        if (param3 == null) {
            this.var_4832 = new Vector.<class_479>();
        } else {
            this.var_4832 = param3;
        }
        this.var_1823 = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 16;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_3315.length > 0) {
            this.var_3315.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_946).read(param1);
            this.var_3315.push(_loc4_);
            _loc2_++;
        }
        this.var_1823 = param1.readInt();
        this.var_1823 = Number(this.var_1823) >>> 6 | Number(this.var_1823) << 26;
        while (this.var_4832.length > 0) {
            this.var_4832.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc5_ = class_127.getInstance().createInstance(param1.readShort()) as class_479).read(param1);
            this.var_4832.push(_loc5_);
            _loc2_++;
        }
        this.name_93 = param1.readInt();
        this.name_93 = Number(this.name_93) >>> 11 | Number(this.name_93) << 21;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        param1.writeInt(this.var_3315.length);
        for each(_loc2_ in this.var_3315) {
            _loc2_.write(param1);
        }
        param1.writeInt(Number(this.var_1823) << 6 | Number(this.var_1823) >>> 26);
        param1.writeInt(this.var_4832.length);
        for each(_loc3_ in this.var_4832) {
            _loc3_.write(param1);
        }
        param1.writeInt(Number(this.name_93) << 11 | Number(this.name_93) >>> 21);
    }
}
}
