package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_466 implements ICommand {

    public static const ID: int = 22038;


    public var var_1055: int = 0;

    public var var_2713: int = 0;

    public function class_466(param1: int = 0, param2: int = 0) {
        super();
        this.var_2713 = param1;
        this.var_1055 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_1055 = param1.readInt();
        this.var_1055 = Number(this.var_1055) << 5 | Number(this.var_1055) >>> 27;
        this.var_2713 = param1.readInt();
        this.var_2713 = Number(this.var_2713) >>> 2 | Number(this.var_2713) << 30;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_1055) >>> 5 | Number(this.var_1055) << 27);
        param1.writeInt(Number(this.var_2713) << 2 | Number(this.var_2713) >>> 30);
    }
}
}
