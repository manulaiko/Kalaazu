package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_924 implements ICommand {

    public static const ID: int = 22478;


    public var var_1413: int = 0;

    public var minLevel: int = 0;

    public var name_119: int = 0;

    public var var_2830: Vector.<class_787>;

    public function class_924(param1: int = 0, param2: int = 0, param3: int = 0, param4: Vector.<class_787> = null) {
        super();
        this.minLevel = param1;
        this.name_119 = param2;
        this.var_1413 = param3;
        if (param4 == null) {
            this.var_2830 = new Vector.<class_787>();
        } else {
            this.var_2830 = param4;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 16;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        this.var_1413 = param1.readInt();
        this.var_1413 = Number(this.var_1413) << 10 | Number(this.var_1413) >>> 22;
        this.minLevel = param1.readInt();
        this.minLevel = Number(this.minLevel) << 7 | Number(this.minLevel) >>> 25;
        this.name_119 = param1.readInt();
        this.name_119 = Number(this.name_119) >>> 11 | Number(this.name_119) << 21;
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_2830.length > 0) {
            this.var_2830.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_787).read(param1);
            this.var_2830.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(Number(this.var_1413) >>> 10 | Number(this.var_1413) << 22);
        param1.writeInt(Number(this.minLevel) >>> 7 | Number(this.minLevel) << 25);
        param1.writeInt(Number(this.name_119) << 11 | Number(this.name_119) >>> 21);
        param1.writeInt(this.var_2830.length);
        for each(_loc2_ in this.var_2830) {
            _loc2_.write(param1);
        }
    }
}
}
