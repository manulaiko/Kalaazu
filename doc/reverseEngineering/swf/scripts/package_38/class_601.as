package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_601 implements ICommand {

    public static const ID: int = 1178;


    public var var_2377: String = "";

    public var var_344: Vector.<class_943>;

    public function class_601(param1: String = "", param2: Vector.<class_943> = null) {
        super();
        this.var_2377 = param1;
        if (param2 == null) {
            this.var_344 = new Vector.<class_943>();
        } else {
            this.var_344 = param2;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 6;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        this.var_2377 = param1.readUTF();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_344.length > 0) {
            this.var_344.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_943).read(param1);
            this.var_344.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeUTF(this.var_2377);
        param1.writeInt(this.var_344.length);
        for each(_loc2_ in this.var_344) {
            _loc2_.write(param1);
        }
    }
}
}
