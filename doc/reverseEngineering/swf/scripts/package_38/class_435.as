package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_435 extends class_434 implements ICommand {

    public static const const_1501: uint = 0;

    public static const const_1810: uint = 2;

    public static const const_3033: uint = 1;

    public static const ID: int = 27641;


    public var type: uint = 0;

    public function class_435(param1: uint = 0) {
        super();
        this.type = param1;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 0;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.type = param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeShort(this.type);
    }
}
}
