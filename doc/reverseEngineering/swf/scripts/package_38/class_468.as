package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_468 extends class_467 implements ICommand {

    public static const ID: int = 13136;


    public var name_98: class_930;

    public function class_468(param1: class_930 = null) {
        super();
        if (param1 == null) {
            this.name_98 = new class_930();
        } else {
            this.name_98 = param1;
        }
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
        this.name_98 = class_127.getInstance().createInstance(param1.readShort()) as class_930;
        this.name_98.read(param1);
        param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeShort(4203);
        this.name_98.write(param1);
        param1.writeShort(5883);
    }
}
}
