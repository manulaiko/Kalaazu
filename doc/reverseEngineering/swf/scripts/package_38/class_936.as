package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_936 implements ICommand {

    public static const ID: int = 32194;


    public var var_1116: Vector.<class_583>;

    public function class_936(param1: Vector.<class_583> = null) {
        super();
        if (param1 == null) {
            this.var_1116 = new Vector.<class_583>();
        } else {
            this.var_1116 = param1;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        param1.readShort();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_1116.length > 0) {
            this.var_1116.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_583).read(param1);
            this.var_1116.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeShort(10241);
        param1.writeInt(this.var_1116.length);
        for each(_loc2_ in this.var_1116) {
            _loc2_.write(param1);
        }
    }
}
}
