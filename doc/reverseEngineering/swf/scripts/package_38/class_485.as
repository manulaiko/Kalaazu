package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_485 implements ICommand {

    public static const ID: int = 10720;


    public var var_2332: Vector.<class_882>;

    public var name_128: int = 0;

    public function class_485(param1: int = 0, param2: Vector.<class_882> = null) {
        super();
        this.name_128 = param1;
        if (param2 == null) {
            this.var_2332 = new Vector.<class_882>();
        } else {
            this.var_2332 = param2;
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
        while (this.var_2332.length > 0) {
            this.var_2332.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_882).read(param1);
            this.var_2332.push(_loc4_);
            _loc2_++;
        }
        this.name_128 = param1.readInt();
        this.name_128 = Number(this.name_128) >>> 2 | Number(this.name_128) << 30;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(this.var_2332.length);
        for each(_loc2_ in this.var_2332) {
            _loc2_.write(param1);
        }
        param1.writeInt(Number(this.name_128) << 2 | Number(this.name_128) >>> 30);
    }
}
}
