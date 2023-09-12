package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_631 implements ICommand {

    public static const ID: int = 2083;


    public var var_4243: class_439;

    public var var_2220: Vector.<class_500>;

    public var var_1014: class_500;

    public var var_4976: Vector.<class_500>;

    public var var_1998: Vector.<class_500>;

    public function class_631(param1: Vector.<class_500> = null, param2: Vector.<class_500> = null, param3: Vector.<class_500> = null, param4: class_500 = null, param5: class_439 = null) {
        super();
        if (param1 == null) {
            this.var_1998 = new Vector.<class_500>();
        } else {
            this.var_1998 = param1;
        }
        if (param2 == null) {
            this.var_4976 = new Vector.<class_500>();
        } else {
            this.var_4976 = param2;
        }
        if (param3 == null) {
            this.var_2220 = new Vector.<class_500>();
        } else {
            this.var_2220 = param3;
        }
        if (param4 == null) {
            this.var_1014 = new class_500();
        } else {
            this.var_1014 = param4;
        }
        if (param5 == null) {
            this.var_4243 = new class_439();
        } else {
            this.var_4243 = param5;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 12;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        this.var_4243 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
        this.var_4243.read(param1);
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_2220.length > 0) {
            this.var_2220.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_500).read(param1);
            this.var_2220.push(_loc4_);
            _loc2_++;
        }
        this.var_1014 = class_127.getInstance().createInstance(param1.readShort()) as class_500;
        this.var_1014.read(param1);
        while (this.var_4976.length > 0) {
            this.var_4976.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc5_ = class_127.getInstance().createInstance(param1.readShort()) as class_500).read(param1);
            this.var_4976.push(_loc5_);
            _loc2_++;
        }
        while (this.var_1998.length > 0) {
            this.var_1998.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc6_ = class_127.getInstance().createInstance(param1.readShort()) as class_500).read(param1);
            this.var_1998.push(_loc6_);
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
        var _loc4_: * = null;
        this.var_4243.write(param1);
        param1.writeInt(this.var_2220.length);
        for each(_loc2_ in this.var_2220) {
            _loc2_.write(param1);
        }
        this.var_1014.write(param1);
        param1.writeInt(this.var_4976.length);
        for each(_loc3_ in this.var_4976) {
            _loc3_.write(param1);
        }
        param1.writeInt(this.var_1998.length);
        for each(_loc4_ in this.var_1998) {
            _loc4_.write(param1);
        }
    }
}
}
