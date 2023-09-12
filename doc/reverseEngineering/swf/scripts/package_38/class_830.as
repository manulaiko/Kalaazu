package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_830 implements ICommand {

    public static const ID: int = 5744;


    public var var_731: int = 0;

    public var var_717: int = 0;

    public var type: class_523;

    public function class_830(param1: class_523 = null, param2: int = 0, param3: int = 0) {
        super();
        if (param1 == null) {
            this.type = new class_523();
        } else {
            this.type = param1;
        }
        this.var_731 = param2;
        this.var_717 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_731 = param1.readInt();
        this.var_731 = Number(this.var_731) >>> 9 | Number(this.var_731) << 23;
        this.var_717 = param1.readInt();
        this.var_717 = Number(this.var_717) << 9 | Number(this.var_717) >>> 23;
        this.type = class_127.getInstance().createInstance(param1.readShort()) as class_523;
        this.type.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-20039);
        param1.writeInt(Number(this.var_731) << 9 | Number(this.var_731) >>> 23);
        param1.writeInt(Number(this.var_717) >>> 9 | Number(this.var_717) << 23);
        this.type.write(param1);
    }
}
}
