package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_895 implements ICommand {

    public static const ID: int = 31215;


    public var list: Vector.<class_827>;

    public function class_895(param1: Vector.<class_827> = null) {
        super();
        if (param1 == null) {
            this.list = new Vector.<class_827>();
        } else {
            this.list = param1;
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
        while (this.list.length > 0) {
            this.list.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_827).read(param1);
            this.list.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(this.list.length);
        for each(_loc2_ in this.list) {
            _loc2_.write(param1);
        }
    }
}
}
