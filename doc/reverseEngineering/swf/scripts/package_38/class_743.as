package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_743 extends class_432 implements ICommand {

    public static const ID: int = 4182;


    public var active: Boolean = false;

    public function class_743(param1: Boolean = false) {
        super();
        this.active = param1;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 1;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.active = param1.readBoolean();
        param1.readShort();
        param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeBoolean(this.active);
        param1.writeShort(2746);
        param1.writeShort(1264);
    }
}
}
