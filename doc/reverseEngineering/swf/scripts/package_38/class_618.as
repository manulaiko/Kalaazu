package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_618 implements ICommand {

    public static const ID: int = 29319;


    public var options: Vector.<class_897>;

    public function class_618(param1: Vector.<class_897> = null) {
        super();
        if (param1 == null) {
            this.options = new Vector.<class_897>();
        } else {
            this.options = param1;
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
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.options.length > 0) {
            this.options.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_897).read(param1);
            this.options.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(this.options.length);
        for each(_loc2_ in this.options) {
            _loc2_.write(param1);
        }
    }
}
}
