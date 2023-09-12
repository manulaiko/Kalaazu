package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_673 extends class_434 implements ICommand {

    public static const ID: int = 7725;


    public var name_152: int = 0;

    public var var_2313: class_951;

    public var var_970: int = 0;

    public var name_168: String = "";

    public var var_546: class_564;

    public var name_158: String = "";

    public function class_673(param1: int = 0, param2: String = "", param3: class_564 = null, param4: String = "", param5: class_951 = null, param6: int = 0) {
        super();
        this.name_168 = param2;
        this.name_158 = param4;
        this.name_152 = param1;
        this.var_970 = param6;
        if (param3 == null) {
            this.var_546 = new class_564();
        } else {
            this.var_546 = param3;
        }
        if (param5 == null) {
            this.var_2313 = new class_951();
        } else {
            this.var_2313 = param5;
        }
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 12;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.name_152 = param1.readInt();
        this.name_152 = Number(this.name_152) << 16 | Number(this.name_152) >>> 16;
        this.var_2313 = class_127.getInstance().createInstance(param1.readShort()) as class_951;
        this.var_2313.read(param1);
        this.var_970 = param1.readInt();
        this.var_970 = Number(this.var_970) >>> 13 | Number(this.var_970) << 19;
        this.name_168 = param1.readUTF();
        param1.readShort();
        this.var_546 = class_127.getInstance().createInstance(param1.readShort()) as class_564;
        this.var_546.read(param1);
        this.name_158 = param1.readUTF();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeInt(Number(this.name_152) >>> 16 | Number(this.name_152) << 16);
        this.var_2313.write(param1);
        param1.writeInt(Number(this.var_970) << 13 | Number(this.var_970) >>> 19);
        param1.writeUTF(this.name_168);
        param1.writeShort(25583);
        this.var_546.write(param1);
        param1.writeUTF(this.name_158);
    }
}
}
