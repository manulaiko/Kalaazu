package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_824 implements ICommand {

    public static const ID: int = 13691;


    public var var_3870: Number = 0;

    public var var_4531: Vector.<class_718>;

    public var name_168: String = "";

    public function class_824(param1: String = "", param2: Number = 0, param3: Vector.<class_718> = null) {
        super();
        this.name_168 = param1;
        this.var_3870 = param2;
        if (param3 == null) {
            this.var_4531 = new Vector.<class_718>();
        } else {
            this.var_4531 = param3;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 14;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        this.var_3870 = param1.readDouble();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_4531.length > 0) {
            this.var_4531.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_718).read(param1);
            this.var_4531.push(_loc4_);
            _loc2_++;
        }
        this.name_168 = param1.readUTF();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeDouble(this.var_3870);
        param1.writeInt(this.var_4531.length);
        for each(_loc2_ in this.var_4531) {
            _loc2_.write(param1);
        }
        param1.writeUTF(this.name_168);
        param1.writeShort(-25482);
    }
}
}
