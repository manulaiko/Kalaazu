package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_853 implements ICommand {

    public static const ID: int = 30352;


    public var var_158: class_647;

    public var var_1120: Vector.<class_353>;

    public function class_853(param1: class_647 = null, param2: Vector.<class_353> = null) {
        super();
        if (param1 == null) {
            this.var_158 = new class_647();
        } else {
            this.var_158 = param1;
        }
        if (param2 == null) {
            this.var_1120 = new Vector.<class_353>();
        } else {
            this.var_1120 = param2;
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
        this.var_158 = class_127.getInstance().createInstance(param1.readShort()) as class_647;
        this.var_158.read(param1);
        param1.readShort();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_1120.length > 0) {
            this.var_1120.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_353).read(param1);
            this.var_1120.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        this.var_158.write(param1);
        param1.writeShort(13053);
        param1.writeInt(this.var_1120.length);
        for each(_loc2_ in this.var_1120) {
            _loc2_.write(param1);
        }
    }
}
}
