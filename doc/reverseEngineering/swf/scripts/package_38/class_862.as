package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_862 implements ICommand {

    public static const const_2553: uint = 2;

    public static const ACTIVE: uint = 1;

    public static const READY: uint = 0;

    public static const ID: int = 686;


    public var var_1772: uint = 0;

    public function class_862(param1: uint = 0) {
        super();
        this.var_1772 = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_1772 = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(637);
        param1.writeShort(this.var_1772);
    }
}
}
