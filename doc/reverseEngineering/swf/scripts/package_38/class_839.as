package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_839 extends class_650 implements ICommand {

    public static const ID: int = 52;


    public var var_2266: Boolean = false;

    public var name_126: int = 0;

    public var var_1669: Boolean = false;

    public function class_839(param1: String = "", param2: Boolean = false, param3: Boolean = false, param4: int = 0, param5: int = 0, param6: int = 0) {
        super(param1, param6, param5);
        this.name_126 = param4;
        this.var_1669 = param2;
        this.var_2266 = param3;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 26;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.var_2266 = param1.readBoolean();
        this.name_126 = param1.readInt();
        this.name_126 = Number(this.name_126) >>> 6 | Number(this.name_126) << 26;
        this.var_1669 = param1.readBoolean();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeBoolean(this.var_2266);
        param1.writeInt(Number(this.name_126) << 6 | Number(this.name_126) >>> 26);
        param1.writeBoolean(this.var_1669);
    }
}
}
