package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_825 implements ICommand {

    public static const ID: int = 12658;


    public var var_2432: Vector.<class_361>;

    public function class_825(param1: Vector.<class_361> = null) {
        super();
        if (param1 == null) {
            this.var_2432 = new Vector.<class_361>();
        } else {
            this.var_2432 = param1;
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
        while (this.var_2432.length > 0) {
            this.var_2432.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_361).read(param1);
            this.var_2432.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(this.var_2432.length);
        for each(_loc2_ in this.var_2432) {
            _loc2_.write(param1);
        }
    }
}
}
