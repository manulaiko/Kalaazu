package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_482 implements ICommand {

    public static const ID: int = 7765;


    public var speed: int = 0;

    public var factionId: int = 0;

    public function class_482(param1: int = 0, param2: int = 0) {
        super();
        this.factionId = param1;
        this.speed = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.speed = param1.readInt();
        this.speed = Number(this.speed) << 9 | Number(this.speed) >>> 23;
        this.factionId = param1.readInt();
        this.factionId = Number(this.factionId) >>> 1 | Number(this.factionId) << 31;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.speed) >>> 9 | Number(this.speed) << 23);
        param1.writeInt(Number(this.factionId) << 1 | Number(this.factionId) >>> 31);
    }
}
}
