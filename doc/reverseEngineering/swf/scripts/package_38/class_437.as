package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_437 extends class_436 implements ICommand {

    public static const const_1387: uint = 2;

    public static const const_967: uint = 4;

    public static const const_474: uint = 5;

    public static const const_3306: uint = 6;

    public static const const_131: uint = 1;

    public static const const_1750: uint = 0;

    public static const const_616: uint = 3;

    public static const ID: int = 30831;


    public var type: uint = 0;

    public function class_437(param1: uint = 0) {
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
        param1.readShort();
        param1.readShort();
        this.type = param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeShort(16110);
        param1.writeShort(-8668);
        param1.writeShort(this.type);
    }
}
}
