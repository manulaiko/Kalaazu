package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_757 implements ICommand {

    public static const const_2836: uint = 0;

    public static const const_2628: uint = 1;

    public static const SELECT: uint = 0;

    public static const ACTIVATE: uint = 1;

    public static const ID: int = 18889;


    public var var_2201: uint = 0;

    public var var_2179: uint = 0;

    public var var_2092: String = "";

    public function class_757(param1: String = "", param2: uint = 0, param3: uint = 0) {
        super();
        this.var_2092 = param1;
        this.var_2201 = param2;
        this.var_2179 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 2;
    }

    public function read(param1: IDataInput): void {
        this.var_2201 = param1.readShort();
        this.var_2179 = param1.readShort();
        this.var_2092 = param1.readUTF();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.var_2201);
        param1.writeShort(this.var_2179);
        param1.writeUTF(this.var_2092);
        param1.writeShort(21922);
    }
}
}
