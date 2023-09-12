package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_650 implements ICommand {

    public static const ID: int = 20331;


    public var hash: String = "";

    public var y: int = 0;

    public var x: int = 0;

    public function class_650(param1: String = "", param2: int = 0, param3: int = 0) {
        super();
        this.hash = param1;
        this.x = param2;
        this.y = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 10;
    }

    public function read(param1: IDataInput): void {
        this.hash = param1.readUTF();
        this.y = param1.readInt();
        this.y = Number(this.y) << 9 | Number(this.y) >>> 23;
        this.x = param1.readInt();
        this.x = Number(this.x) << 4 | Number(this.x) >>> 28;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.hash);
        param1.writeInt(Number(this.y) >>> 9 | Number(this.y) << 23);
        param1.writeInt(Number(this.x) >>> 4 | Number(this.x) << 28);
    }
}
}
