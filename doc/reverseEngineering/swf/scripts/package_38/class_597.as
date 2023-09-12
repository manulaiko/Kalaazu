package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_597 implements ICommand {

    public static const ID: int = 12847;


    public var type: class_745;

    public var seconds: int = 0;

    public function class_597(param1: class_745 = null, param2: int = 0) {
        super();
        if (param1 == null) {
            this.type = new class_745();
        } else {
            this.type = param1;
        }
        this.seconds = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.type = class_127.getInstance().createInstance(param1.readShort()) as class_745;
        this.type.read(param1);
        this.seconds = param1.readInt();
        this.seconds = Number(this.seconds) >>> 3 | Number(this.seconds) << 29;
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.type.write(param1);
        param1.writeInt(Number(this.seconds) << 3 | Number(this.seconds) >>> 29);
        param1.writeShort(27286);
    }
}
}
