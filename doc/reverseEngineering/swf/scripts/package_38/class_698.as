package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_698 implements ICommand {

    public static const ID: int = 29719;


    public var name_115: int = 0;

    public var timer: int = 0;

    public var var_976: int = 0;

    public function class_698(param1: int = 0, param2: int = 0, param3: int = 0) {
        super();
        this.var_976 = param1;
        this.name_115 = param2;
        this.timer = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 12;
    }

    public function read(param1: IDataInput): void {
        this.name_115 = param1.readInt();
        this.name_115 = Number(this.name_115) << 6 | Number(this.name_115) >>> 26;
        param1.readShort();
        this.timer = param1.readInt();
        this.timer = Number(this.timer) << 15 | Number(this.timer) >>> 17;
        param1.readShort();
        this.var_976 = param1.readInt();
        this.var_976 = Number(this.var_976) << 4 | Number(this.var_976) >>> 28;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.name_115) >>> 6 | Number(this.name_115) << 26);
        param1.writeShort(17254);
        param1.writeInt(Number(this.timer) >>> 15 | Number(this.timer) << 17);
        param1.writeShort(-27519);
        param1.writeInt(Number(this.var_976) >>> 4 | Number(this.var_976) << 28);
    }
}
}
