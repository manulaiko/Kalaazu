package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_920 implements ICommand {

    public static const ID: int = 4873;


    public var var_3896: String = "";

    public var var_1529: int = 0;

    public var var_3563: class_439;

    public var var_3149: int = 0;

    public var var_3073: int = 0;

    public var var_3184: int = 0;

    public var var_2469: String = "";

    public function class_920(param1: int = 0, param2: int = 0, param3: String = "", param4: int = 0, param5: int = 0, param6: String = "", param7: class_439 = null) {
        super();
        this.var_3184 = param1;
        this.var_1529 = param2;
        this.var_2469 = param3;
        this.var_3073 = param4;
        this.var_3149 = param5;
        this.var_3896 = param6;
        if (param7 == null) {
            this.var_3563 = new class_439();
        } else {
            this.var_3563 = param7;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 20;
    }

    public function read(param1: IDataInput): void {
        this.var_3896 = param1.readUTF();
        param1.readShort();
        param1.readShort();
        this.var_1529 = param1.readInt();
        this.var_1529 = Number(this.var_1529) >>> 8 | Number(this.var_1529) << 24;
        this.var_3563 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
        this.var_3563.read(param1);
        this.var_3149 = param1.readInt();
        this.var_3149 = Number(this.var_3149) >>> 4 | Number(this.var_3149) << 28;
        this.var_3073 = param1.readInt();
        this.var_3073 = Number(this.var_3073) >>> 12 | Number(this.var_3073) << 20;
        this.var_3184 = param1.readInt();
        this.var_3184 = Number(this.var_3184) >>> 13 | Number(this.var_3184) << 19;
        this.var_2469 = param1.readUTF();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeUTF(this.var_3896);
        param1.writeShort(-21121);
        param1.writeShort(566);
        param1.writeInt(Number(this.var_1529) << 8 | Number(this.var_1529) >>> 24);
        this.var_3563.write(param1);
        param1.writeInt(Number(this.var_3149) << 4 | Number(this.var_3149) >>> 28);
        param1.writeInt(Number(this.var_3073) << 12 | Number(this.var_3073) >>> 20);
        param1.writeInt(Number(this.var_3184) << 13 | Number(this.var_3184) >>> 19);
        param1.writeUTF(this.var_2469);
    }
}
}
