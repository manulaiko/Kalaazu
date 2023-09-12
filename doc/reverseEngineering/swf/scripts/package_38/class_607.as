package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_607 implements ICommand {

    public static const const_1394: uint = 1;

    public static const URIDIUM: uint = 0;

    public static const ID: int = 27279;


    public var var_4828: int = 0;

    public var var_861: class_427;

    public var amount: int = 0;

    public var var_1755: uint = 0;

    public function class_607(param1: class_427 = null, param2: uint = 0, param3: int = 0, param4: int = 0) {
        super();
        if (param1 == null) {
            this.var_861 = new class_427();
        } else {
            this.var_861 = param1;
        }
        this.var_1755 = param2;
        this.amount = param3;
        this.var_4828 = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_4828 = param1.readInt();
        this.var_4828 = Number(this.var_4828) << 1 | Number(this.var_4828) >>> 31;
        this.var_861 = class_127.getInstance().createInstance(param1.readShort()) as class_427;
        this.var_861.read(param1);
        this.amount = param1.readInt();
        this.amount = Number(this.amount) << 1 | Number(this.amount) >>> 31;
        this.var_1755 = param1.readShort();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_4828) >>> 1 | Number(this.var_4828) << 31);
        this.var_861.write(param1);
        param1.writeInt(Number(this.amount) >>> 1 | Number(this.amount) << 31);
        param1.writeShort(this.var_1755);
        param1.writeShort(15822);
    }
}
}
