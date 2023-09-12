package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_959 implements ICommand {

    public static const ID: int = 3826;


    public var name_101: int = 0;

    public var name_89: int = 0;

    public var name_151: Vector.<class_529>;

    public var name_48: int = 0;

    public var name_71: int = 0;

    public var name_109: Vector.<class_529>;

    public function class_959(param1: Vector.<class_529> = null, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0, param6: Vector.<class_529> = null) {
        super();
        if (param1 == null) {
            this.name_151 = new Vector.<class_529>();
        } else {
            this.name_151 = param1;
        }
        this.name_48 = param2;
        this.name_71 = param3;
        this.name_101 = param4;
        this.name_89 = param5;
        if (param6 == null) {
            this.name_109 = new Vector.<class_529>();
        } else {
            this.name_109 = param6;
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
        this.name_101 = param1.readInt();
        this.name_101 = Number(this.name_101) >>> 7 | Number(this.name_101) << 25;
        param1.readShort();
        this.name_89 = param1.readInt();
        this.name_89 = Number(this.name_89) >>> 14 | Number(this.name_89) << 18;
        param1.readShort();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.name_151.length > 0) {
            this.name_151.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_529).read(param1);
            this.name_151.push(_loc4_);
            _loc2_++;
        }
        this.name_48 = param1.readInt();
        this.name_48 = Number(this.name_48) >>> 11 | Number(this.name_48) << 21;
        this.name_71 = param1.readInt();
        this.name_71 = Number(this.name_71) << 9 | Number(this.name_71) >>> 23;
        while (this.name_109.length > 0) {
            this.name_109.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc5_ = class_127.getInstance().createInstance(param1.readShort()) as class_529).read(param1);
            this.name_109.push(_loc5_);
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
        param1.writeInt(Number(this.name_101) << 7 | Number(this.name_101) >>> 25);
        param1.writeShort(-31395);
        param1.writeInt(Number(this.name_89) << 14 | Number(this.name_89) >>> 18);
        param1.writeShort(21735);
        param1.writeInt(this.name_151.length);
        for each(_loc2_ in this.name_151) {
            _loc2_.write(param1);
        }
        param1.writeInt(Number(this.name_48) << 11 | Number(this.name_48) >>> 21);
        param1.writeInt(Number(this.name_71) >>> 9 | Number(this.name_71) << 23);
        param1.writeInt(this.name_109.length);
        for each(_loc3_ in this.name_109) {
            _loc3_.write(param1);
        }
    }
}
}
