package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_742 implements ICommand {

    public static const ID: int = 4062;


    public var var_2847: int = 0;

    public var name_88: int = 0;

    public var name_114: int = 0;

    public function class_742(param1: int = 0, param2: int = 0, param3: int = 0) {
        super();
        this.var_2847 = param1;
        this.name_114 = param2;
        this.name_88 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 12;
    }

    public function read(param1: IDataInput): void {
        this.var_2847 = param1.readInt();
        this.var_2847 = Number(this.var_2847) << 14 | Number(this.var_2847) >>> 18;
        this.name_88 = param1.readInt();
        this.name_88 = Number(this.name_88) >>> 7 | Number(this.name_88) << 25;
        this.name_114 = param1.readInt();
        this.name_114 = Number(this.name_114) >>> 1 | Number(this.name_114) << 31;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_2847) >>> 14 | Number(this.var_2847) << 18);
        param1.writeInt(Number(this.name_88) << 7 | Number(this.name_88) >>> 25);
        param1.writeInt(Number(this.name_114) << 1 | Number(this.name_114) >>> 31);
    }
}
}
