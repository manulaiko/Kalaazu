package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_704 extends class_467 implements ICommand {

    public static const ID: int = 8188;


    public var name_45: int = 0;

    public function class_704(param1: int = 0) {
        super();
        this.name_45 = param1;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 4;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.name_45 = param1.readInt();
        this.name_45 = Number(this.name_45) >>> 8 | Number(this.name_45) << 24;
        param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeInt(Number(this.name_45) << 8 | Number(this.name_45) >>> 24);
        param1.writeShort(14037);
    }
}
}
