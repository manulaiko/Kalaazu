package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_956 implements ICommand {

    public static const ID: int = 10114;


    public var options: Vector.<class_897>;

    public var var_2740: String = "";

    public var var_2490: class_514;

    public var var_3078: String = "";

    public var var_2001: String = "";

    public function class_956(param1: String = "", param2: String = "", param3: String = "", param4: class_514 = null, param5: Vector.<class_897> = null) {
        super();
        this.var_2001 = param1;
        this.var_2740 = param2;
        this.var_3078 = param3;
        if (param4 == null) {
            this.var_2490 = new class_514();
        } else {
            this.var_2490 = param4;
        }
        if (param5 == null) {
            this.options = new Vector.<class_897>();
        } else {
            this.options = param5;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 10;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.options.length > 0) {
            this.options.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_897).read(param1);
            this.options.push(_loc4_);
            _loc2_++;
        }
        this.var_2740 = param1.readUTF();
        this.var_2490 = class_127.getInstance().createInstance(param1.readShort()) as class_514;
        this.var_2490.read(param1);
        this.var_3078 = param1.readUTF();
        this.var_2001 = param1.readUTF();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(this.options.length);
        for each(_loc2_ in this.options) {
            _loc2_.write(param1);
        }
        param1.writeUTF(this.var_2740);
        this.var_2490.write(param1);
        param1.writeUTF(this.var_3078);
        param1.writeUTF(this.var_2001);
        param1.writeShort(7114);
    }
}
}
