package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_949 implements ICommand {

    public static const ID: int = 9855;


    public var var_450: class_424;

    public var var_2555: Vector.<int>;

    public function class_949(param1: class_424 = null, param2: Vector.<int> = null) {
        super();
        if (param1 == null) {
            this.var_450 = new class_424();
        } else {
            this.var_450 = param1;
        }
        if (param2 == null) {
            this.var_2555 = new Vector.<int>();
        } else {
            this.var_2555 = param2;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = 0;
        this.var_450 = class_127.getInstance().createInstance(param1.readShort()) as class_424;
        this.var_450.read(param1);
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_2555.length > 0) {
            this.var_2555.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            _loc4_ = (_loc4_ = int(param1.readInt())) >>> 3 | _loc4_ << 29;
            this.var_2555.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: int = 0;
        this.var_450.write(param1);
        param1.writeInt(this.var_2555.length);
        for each(_loc2_ in this.var_2555) {
            param1.writeInt(_loc2_ << 3 | _loc2_ >>> 29);
        }
    }
}
}
