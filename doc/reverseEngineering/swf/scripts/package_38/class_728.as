package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_728 implements ICommand {

    public static const ID: int = 9360;


    public var var_2388: int = 0;

    public var var_2806: class_630;

    public var var_5045: int = 0;

    public function class_728(param1: class_630 = null, param2: int = 0, param3: int = 0) {
        super();
        if (param1 == null) {
            this.var_2806 = new class_630();
        } else {
            this.var_2806 = param1;
        }
        this.var_5045 = param2;
        this.var_2388 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_2388 = param1.readInt();
        this.var_2388 = Number(this.var_2388) << 10 | Number(this.var_2388) >>> 22;
        this.var_2806 = class_127.getInstance().createInstance(param1.readShort()) as class_630;
        this.var_2806.read(param1);
        this.var_5045 = param1.readInt();
        this.var_5045 = Number(this.var_5045) << 4 | Number(this.var_5045) >>> 28;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_2388) >>> 10 | Number(this.var_2388) << 22);
        this.var_2806.write(param1);
        param1.writeInt(Number(this.var_5045) >>> 4 | Number(this.var_5045) << 28);
    }
}
}
