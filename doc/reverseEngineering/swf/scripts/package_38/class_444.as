package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_444 extends class_436 implements ICommand {

    public static const const_2272: uint = 1;

    public static const const_2222: uint = 3;

    public static const const_1686: uint = 2;

    public static const const_89: uint = 0;

    public static const ID: int = 23083;


    public var number: int = 0;

    public var type: uint = 0;

    public function class_444(param1: int = 0, param2: uint = 0) {
        super();
        this.type = param2;
        this.number = param1;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 4;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.number = param1.readInt();
        this.number = Number(this.number) << 14 | Number(this.number) >>> 18;
        this.type = param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeInt(Number(this.number) >>> 14 | Number(this.number) << 18);
        param1.writeShort(this.type);
    }
}
}
