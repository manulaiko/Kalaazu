package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_629 implements ICommand {

    public static const ID: int = 7633;


    public var var_4787: int = 0;

    public var id: int = 0;

    public var var_2295: int = 0;

    public var var_2797: int = 0;

    public var type: int = 0;

    public function class_629(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0) {
        super();
        this.id = param1;
        this.type = param2;
        this.var_2797 = param3;
        this.var_4787 = param4;
        this.var_2295 = param5;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 20;
    }

    public function read(param1: IDataInput): void {
        this.var_4787 = param1.readInt();
        this.var_4787 = Number(this.var_4787) >>> 11 | Number(this.var_4787) << 21;
        this.id = param1.readInt();
        this.id = Number(this.id) << 9 | Number(this.id) >>> 23;
        this.var_2295 = param1.readInt();
        this.var_2295 = Number(this.var_2295) << 5 | Number(this.var_2295) >>> 27;
        param1.readShort();
        param1.readShort();
        this.var_2797 = param1.readInt();
        this.var_2797 = Number(this.var_2797) << 5 | Number(this.var_2797) >>> 27;
        this.type = param1.readInt();
        this.type = Number(this.type) << 6 | Number(this.type) >>> 26;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_4787) << 11 | Number(this.var_4787) >>> 21);
        param1.writeInt(Number(this.id) >>> 9 | Number(this.id) << 23);
        param1.writeInt(Number(this.var_2295) >>> 5 | Number(this.var_2295) << 27);
        param1.writeShort(-3483);
        param1.writeShort(11539);
        param1.writeInt(Number(this.var_2797) >>> 5 | Number(this.var_2797) << 27);
        param1.writeInt(Number(this.type) >>> 6 | Number(this.type) << 26);
    }
}
}
