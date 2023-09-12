package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_596 implements ICommand {

    public static const const_1133: uint = 1;

    public static const const_3004: uint = 5;

    public static const const_1429: uint = 6;

    public static const const_2043: uint = 7;

    public static const const_2480: uint = 3;

    public static const const_486: uint = 2;

    public static const const_1007: uint = 0;

    public static const const_2132: uint = 4;

    public static const ID: int = 20320;


    public var var_3462: int = 0;

    public var var_475: uint = 0;

    public var var_2049: Boolean = false;

    public var name_85: class_537;

    public function class_596(param1: uint = 0, param2: class_537 = null, param3: int = 0, param4: Boolean = false) {
        super();
        this.var_475 = param1;
        if (param2 == null) {
            this.name_85 = new class_537();
        } else {
            this.name_85 = param2;
        }
        this.var_3462 = param3;
        this.var_2049 = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 5;
    }

    public function read(param1: IDataInput): void {
        this.var_3462 = param1.readInt();
        this.var_3462 = Number(this.var_3462) >>> 13 | Number(this.var_3462) << 19;
        this.var_475 = param1.readShort();
        this.var_2049 = param1.readBoolean();
        this.name_85 = class_127.getInstance().createInstance(param1.readShort()) as class_537;
        this.name_85.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_3462) << 13 | Number(this.var_3462) >>> 19);
        param1.writeShort(this.var_475);
        param1.writeBoolean(this.var_2049);
        this.name_85.write(param1);
    }
}
}
