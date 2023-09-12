package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_440 implements ICommand {

    public static const const_352: uint = 0;

    public static const const_2913: uint = 1;

    public static const ID: int = 1271;


    public var var_1822: int = 0;

    public var showButtons: Boolean = false;

    public var var_1328: uint = 0;

    public var var_5049: String = "";

    public var languageKeys: Vector.<String>;

    public var name_85: int = 0;

    public function class_440(param1: int = 0, param2: String = "", param3: Boolean = false, param4: Vector.<String> = null, param5: int = 0, param6: uint = 0) {
        super();
        this.name_85 = param1;
        this.var_5049 = param2;
        this.showButtons = param3;
        if (param4 == null) {
            this.languageKeys = new Vector.<String>();
        } else {
            this.languageKeys = param4;
        }
        this.var_1822 = param5;
        this.var_1328 = param6;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 15;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        this.var_1822 = param1.readInt();
        this.var_1822 = Number(this.var_1822) >>> 11 | Number(this.var_1822) << 21;
        this.showButtons = param1.readBoolean();
        this.var_1328 = param1.readShort();
        this.var_5049 = param1.readUTF();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.languageKeys.length > 0) {
            this.languageKeys.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            _loc4_ = param1.readUTF();
            this.languageKeys.push(_loc4_);
            _loc2_++;
        }
        param1.readShort();
        this.name_85 = param1.readInt();
        this.name_85 = Number(this.name_85) >>> 11 | Number(this.name_85) << 21;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeInt(Number(this.var_1822) << 11 | Number(this.var_1822) >>> 21);
        param1.writeBoolean(this.showButtons);
        param1.writeShort(this.var_1328);
        param1.writeUTF(this.var_5049);
        param1.writeInt(this.languageKeys.length);
        for each(_loc2_ in this.languageKeys) {
            param1.writeUTF(_loc2_);
        }
        param1.writeShort(-12347);
        param1.writeInt(Number(this.name_85) << 11 | Number(this.name_85) >>> 21);
        param1.writeShort(1928);
    }
}
}
