package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_510 implements ICommand {

    public static const ID: int = 13016;


    public var remove: Boolean = false;

    public var var_3518: Vector.<class_617>;

    public function class_510(param1: Vector.<class_617> = null, param2: Boolean = false) {
        super();
        if (param1 == null) {
            this.var_3518 = new Vector.<class_617>();
        } else {
            this.var_3518 = param1;
        }
        this.remove = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        this.remove = param1.readBoolean();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_3518.length > 0) {
            this.var_3518.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_617).read(param1);
            this.var_3518.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeBoolean(this.remove);
        param1.writeInt(this.var_3518.length);
        for each(_loc2_ in this.var_3518) {
            _loc2_.write(param1);
        }
    }
}
}
