package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_489 implements ICommand {

    public static const ID: int = 3574;


    public var var_556: Vector.<int>;

    public var price: int = 0;

    public function class_489(param1: int = 0, param2: Vector.<int> = null) {
        super();
        this.price = param1;
        if (param2 == null) {
            this.var_556 = new Vector.<int>();
        } else {
            this.var_556 = param2;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = 0;
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_556.length > 0) {
            this.var_556.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            _loc4_ = (_loc4_ = int(param1.readInt())) >>> 11 | _loc4_ << 21;
            this.var_556.push(_loc4_);
            _loc2_++;
        }
        this.price = param1.readInt();
        this.price = Number(this.price) << 1 | Number(this.price) >>> 31;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: int = 0;
        param1.writeInt(this.var_556.length);
        for each(_loc2_ in this.var_556) {
            param1.writeInt(_loc2_ << 11 | _loc2_ >>> 21);
        }
        param1.writeInt(Number(this.price) >>> 1 | Number(this.price) << 31);
        param1.writeShort(5013);
    }
}
}
