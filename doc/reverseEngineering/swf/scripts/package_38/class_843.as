package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_843 implements ICommand {

    public static const ID: int = 20288;


    public var var_4985: Boolean = false;

    public var factionId: int = 0;

    public var var_136: Boolean = false;

    public var var_5014: int = 0;

    public var name_164: int = 0;

    public var x: int = 0;

    public var y: int = 0;

    public var var_2340: Vector.<int>;

    public function class_843(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0, param6: Boolean = false, param7: Boolean = false, param8: Vector.<int> = null) {
        super();
        this.var_5014 = param1;
        this.factionId = param2;
        this.name_164 = param3;
        this.x = param4;
        this.y = param5;
        this.var_136 = param6;
        this.var_4985 = param7;
        if (param8 == null) {
            this.var_2340 = new Vector.<int>();
        } else {
            this.var_2340 = param8;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 26;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = 0;
        this.var_4985 = param1.readBoolean();
        this.factionId = param1.readInt();
        this.factionId = Number(this.factionId) << 9 | Number(this.factionId) >>> 23;
        this.var_136 = param1.readBoolean();
        this.var_5014 = param1.readInt();
        this.var_5014 = Number(this.var_5014) << 10 | Number(this.var_5014) >>> 22;
        this.name_164 = param1.readInt();
        this.name_164 = Number(this.name_164) >>> 15 | Number(this.name_164) << 17;
        this.x = param1.readInt();
        this.x = Number(this.x) << 12 | Number(this.x) >>> 20;
        this.y = param1.readInt();
        this.y = Number(this.y) >>> 4 | Number(this.y) << 28;
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_2340.length > 0) {
            this.var_2340.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            _loc4_ = (_loc4_ = int(param1.readInt())) << 16 | _loc4_ >>> 16;
            this.var_2340.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: int = 0;
        param1.writeBoolean(this.var_4985);
        param1.writeInt(Number(this.factionId) >>> 9 | Number(this.factionId) << 23);
        param1.writeBoolean(this.var_136);
        param1.writeInt(Number(this.var_5014) >>> 10 | Number(this.var_5014) << 22);
        param1.writeInt(Number(this.name_164) << 15 | Number(this.name_164) >>> 17);
        param1.writeInt(Number(this.x) >>> 12 | Number(this.x) << 20);
        param1.writeInt(Number(this.y) << 4 | Number(this.y) >>> 28);
        param1.writeInt(this.var_2340.length);
        for each(_loc2_ in this.var_2340) {
            param1.writeInt(_loc2_ >>> 16 | _loc2_ << 16);
        }
    }
}
}
