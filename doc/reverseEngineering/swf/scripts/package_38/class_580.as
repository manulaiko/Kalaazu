package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_580 implements ICommand {

    public static const const_166: uint = 1;

    public static const const_2852: uint = 3;

    public static const const_1083: uint = 0;

    public static const const_1200: uint = 2;

    public static const ID: int = 23530;


    public var var_1068: uint = 0;

    public var var_861: class_427;

    public var amount: int = 0;

    public function class_580(param1: uint = 0, param2: class_427 = null, param3: int = 0) {
        super();
        this.var_1068 = param1;
        if (param2 == null) {
            this.var_861 = new class_427();
        } else {
            this.var_861 = param2;
        }
        this.amount = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.var_1068 = param1.readShort();
        this.var_861 = class_127.getInstance().createInstance(param1.readShort()) as class_427;
        this.var_861.read(param1);
        this.amount = param1.readInt();
        this.amount = Number(this.amount) >>> 14 | Number(this.amount) << 18;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.var_1068);
        this.var_861.write(param1);
        param1.writeInt(Number(this.amount) << 14 | Number(this.amount) >>> 18);
    }
}
}
