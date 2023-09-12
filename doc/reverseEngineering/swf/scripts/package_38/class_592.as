package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_592 implements ICommand {

    public static const ID: int = 596;


    public var var_1155: class_433;

    public var var_5058: int = 0;

    public var var_3814: int = 0;

    public var var_3369: class_433;

    public var var_2438: String = "";

    public var name_82: String = "";

    public function class_592(param1: int = 0, param2: String = "", param3: class_433 = null, param4: int = 0, param5: String = "", param6: class_433 = null) {
        super();
        this.var_3814 = param1;
        this.var_2438 = param2;
        if (param3 == null) {
            this.var_1155 = new class_433();
        } else {
            this.var_1155 = param3;
        }
        this.var_5058 = param4;
        this.name_82 = param5;
        if (param6 == null) {
            this.var_3369 = new class_433();
        } else {
            this.var_3369 = param6;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 12;
    }

    public function read(param1: IDataInput): void {
        this.var_1155 = class_127.getInstance().createInstance(param1.readShort()) as class_433;
        this.var_1155.read(param1);
        this.var_5058 = param1.readInt();
        this.var_5058 = Number(this.var_5058) << 9 | Number(this.var_5058) >>> 23;
        this.var_3814 = param1.readInt();
        this.var_3814 = Number(this.var_3814) << 11 | Number(this.var_3814) >>> 21;
        this.var_3369 = class_127.getInstance().createInstance(param1.readShort()) as class_433;
        this.var_3369.read(param1);
        this.var_2438 = param1.readUTF();
        this.name_82 = param1.readUTF();
        param1.readShort();
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_1155.write(param1);
        param1.writeInt(Number(this.var_5058) >>> 9 | Number(this.var_5058) << 23);
        param1.writeInt(Number(this.var_3814) >>> 11 | Number(this.var_3814) << 21);
        this.var_3369.write(param1);
        param1.writeUTF(this.var_2438);
        param1.writeUTF(this.name_82);
        param1.writeShort(-2976);
        param1.writeShort(-27904);
    }
}
}
