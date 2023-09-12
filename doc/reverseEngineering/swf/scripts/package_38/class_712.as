package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_712 implements ICommand {

    public static const ID: int = 27856;


    public var name_85: class_537;

    public var x: int = 0;

    public var y: int = 0;

    public var maximized: Boolean = false;

    public function class_712(param1: class_537 = null, param2: int = 0, param3: int = 0, param4: Boolean = false) {
        super();
        if (param1 == null) {
            this.name_85 = new class_537();
        } else {
            this.name_85 = param1;
        }
        this.x = param2;
        this.y = param3;
        this.maximized = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 9;
    }

    public function read(param1: IDataInput): void {
        this.name_85 = class_127.getInstance().createInstance(param1.readShort()) as class_537;
        this.name_85.read(param1);
        this.x = param1.readInt();
        this.x = Number(this.x) << 10 | Number(this.x) >>> 22;
        this.y = param1.readInt();
        this.y = Number(this.y) >>> 3 | Number(this.y) << 29;
        this.maximized = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.name_85.write(param1);
        param1.writeInt(Number(this.x) >>> 10 | Number(this.x) << 22);
        param1.writeInt(Number(this.y) << 3 | Number(this.y) >>> 29);
        param1.writeBoolean(this.maximized);
    }
}
}
