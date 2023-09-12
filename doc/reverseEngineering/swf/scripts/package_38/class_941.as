package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_941 extends class_606 implements ICommand {

    public static const const_2178: uint = 1;

    public static const const_2151: uint = 2;

    public static const const_2861: uint = 0;

    public static const ID: int = 20489;


    public var replacement: uint = 0;

    public var mapId: int = 0;

    public function class_941(param1: uint = 0, param2: int = 0) {
        super();
        this.mapId = param2;
        this.replacement = param1;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 4;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.replacement = param1.readShort();
        this.mapId = param1.readInt();
        this.mapId = Number(this.mapId) >>> 13 | Number(this.mapId) << 19;
        param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeShort(this.replacement);
        param1.writeInt(Number(this.mapId) << 13 | Number(this.mapId) >>> 19);
        param1.writeShort(29710);
    }
}
}
