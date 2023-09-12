package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_529 implements ICommand {

    public static const ID: int = 24942;


    public var score: int = 0;

    public var faction: class_439;

    public function class_529(param1: class_439 = null, param2: int = 0) {
        super();
        if (param1 == null) {
            this.faction = new class_439();
        } else {
            this.faction = param1;
        }
        this.score = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.score = param1.readInt();
        this.score = Number(this.score) << 7 | Number(this.score) >>> 25;
        this.faction = class_127.getInstance().createInstance(param1.readShort()) as class_439;
        this.faction.read(param1);
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.score) >>> 7 | Number(this.score) << 25);
        this.faction.write(param1);
        param1.writeShort(16695);
    }
}
}
