package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_499 implements ICommand {

    public static const ID: int = 26611;


    public var attributes: Vector.<class_467>;

    public var name_128: int = 0;

    public function class_499(param1: int = 0, param2: Vector.<class_467> = null) {
        super();
        this.name_128 = param1;
        if (param2 == null) {
            this.attributes = new Vector.<class_467>();
        } else {
            this.attributes = param2;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.attributes.length > 0) {
            this.attributes.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_467).read(param1);
            this.attributes.push(_loc4_);
            _loc2_++;
        }
        this.name_128 = param1.readInt();
        this.name_128 = Number(this.name_128) >>> 4 | Number(this.name_128) << 28;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(this.attributes.length);
        for each(_loc2_ in this.attributes) {
            _loc2_.write(param1);
        }
        param1.writeInt(Number(this.name_128) << 4 | Number(this.name_128) >>> 28);
        param1.writeShort(-32069);
    }
}
}
