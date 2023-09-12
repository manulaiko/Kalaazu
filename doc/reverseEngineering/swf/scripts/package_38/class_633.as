package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_633 implements ICommand {

    public static const STANDARD: uint = 0;

    public static const ID: int = 5599;


    public var type: uint = 0;

    public var var_4968: Vector.<String>;

    public var message: String = "";

    public var priority: int = 0;

    public function class_633(param1: uint = 0, param2: int = 0, param3: String = "", param4: Vector.<String> = null) {
        super();
        this.type = param1;
        this.priority = param2;
        this.message = param3;
        if (param4 == null) {
            this.var_4968 = new Vector.<String>();
        } else {
            this.var_4968 = param4;
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
        this.type = param1.readShort();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_4968.length > 0) {
            this.var_4968.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            _loc4_ = param1.readUTF();
            this.var_4968.push(_loc4_);
            _loc2_++;
        }
        this.message = param1.readUTF();
        this.priority = param1.readInt();
        this.priority = Number(this.priority) >>> 16 | Number(this.priority) << 16;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeShort(this.type);
        param1.writeInt(this.var_4968.length);
        for each(_loc2_ in this.var_4968) {
            param1.writeUTF(_loc2_);
        }
        param1.writeUTF(this.message);
        param1.writeInt(Number(this.priority) << 16 | Number(this.priority) >>> 16);
    }
}
}
