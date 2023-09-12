package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_676 implements ICommand {

    public static const ID: int = 4361;


    public var id: int = 0;

    public var var_1675: int = 0;

    public function class_676(param1: int = 0, param2: int = 0) {
        super();
        this.id = param1;
        this.var_1675 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.id = param1.readInt();
        this.id = Number(this.id) >>> 4 | Number(this.id) << 28;
        this.var_1675 = param1.readInt();
        this.var_1675 = Number(this.var_1675) << 7 | Number(this.var_1675) >>> 25;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.id) << 4 | Number(this.id) >>> 28);
        param1.writeInt(Number(this.var_1675) >>> 7 | Number(this.var_1675) << 25);
    }
}
}
