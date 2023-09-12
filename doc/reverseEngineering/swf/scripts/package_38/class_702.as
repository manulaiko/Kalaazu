package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_702 implements ICommand {

    public static const ID: int = 21885;


    public var var_3452: int = 0;

    public var name_164: int = 0;

    public var var_2978: Number = 0;

    public var name_127: int = 0;

    public function class_702(param1: int = 0, param2: Number = 0, param3: int = 0, param4: int = 0) {
        super();
        this.var_3452 = param1;
        this.var_2978 = param2;
        this.name_164 = param3;
        this.name_127 = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 14;
    }

    public function read(param1: IDataInput): void {
        this.var_3452 = param1.readShort();
        param1.readShort();
        this.name_164 = param1.readShort();
        this.var_2978 = param1.readDouble();
        param1.readShort();
        this.name_127 = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.var_3452);
        param1.writeShort(-7374);
        param1.writeShort(this.name_164);
        param1.writeDouble(this.var_2978);
        param1.writeShort(10723);
        param1.writeShort(this.name_127);
    }
}
}
