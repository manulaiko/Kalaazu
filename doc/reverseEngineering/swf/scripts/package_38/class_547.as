package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_547 implements ICommand {

    public static const ID: int = 1995;


    public var var_740: String = "";

    public var var_4415: Number = 0;

    public var var_4098: Boolean = false;

    public var var_4903: String = "";

    public var state: class_732;

    public var var_1529: int = 0;

    public var var_3652: Number = 0;

    public function class_547(param1: int = 0, param2: Number = 0, param3: Number = 0, param4: String = "", param5: String = "", param6: class_732 = null, param7: Boolean = false) {
        super();
        this.var_1529 = param1;
        this.var_3652 = param2;
        this.var_4415 = param3;
        this.var_4903 = param4;
        this.var_740 = param5;
        if (param6 == null) {
            this.state = new class_732();
        } else {
            this.state = param6;
        }
        this.var_4098 = param7;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 17;
    }

    public function read(param1: IDataInput): void {
        this.var_740 = param1.readUTF();
        this.var_4415 = param1.readFloat();
        this.var_4098 = param1.readBoolean();
        this.var_4903 = param1.readUTF();
        this.state = class_127.getInstance().createInstance(param1.readShort()) as class_732;
        this.state.read(param1);
        this.var_1529 = param1.readInt();
        this.var_1529 = Number(this.var_1529) >>> 9 | Number(this.var_1529) << 23;
        this.var_3652 = param1.readFloat();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.var_740);
        param1.writeFloat(this.var_4415);
        param1.writeBoolean(this.var_4098);
        param1.writeUTF(this.var_4903);
        this.state.write(param1);
        param1.writeInt(Number(this.var_1529) << 9 | Number(this.var_1529) >>> 23);
        param1.writeFloat(this.var_3652);
    }
}
}
