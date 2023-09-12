package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_829 implements ICommand {

    public static const ID: int = 1110;


    public var var_3261: String = "";

    public var var_1562: int = 0;

    public var hideAllWindows: Boolean = false;

    public function class_829(param1: int = 0, param2: String = "", param3: Boolean = false) {
        super();
        this.var_1562 = param1;
        this.var_3261 = param2;
        this.hideAllWindows = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 7;
    }

    public function read(param1: IDataInput): void {
        this.var_3261 = param1.readUTF();
        this.var_1562 = param1.readInt();
        this.var_1562 = Number(this.var_1562) >>> 13 | Number(this.var_1562) << 19;
        this.hideAllWindows = param1.readBoolean();
        param1.readShort();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.var_3261);
        param1.writeInt(Number(this.var_1562) << 13 | Number(this.var_1562) >>> 19);
        param1.writeBoolean(this.hideAllWindows);
        param1.writeShort(-27662);
        param1.writeShort(15301);
    }
}
}
