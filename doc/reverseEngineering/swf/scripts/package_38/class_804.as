package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_804 extends class_442 implements ICommand {

    public static const ID: int = 15715;


    public var name_4: Number = 0;

    public var name_75: class_439;

    public var name_167: int = 0;

    public var name_70: int = 0;

    public var var_4581: Boolean = false;

    public function class_804(param1: int = 0, param2: String = "", param3: Boolean = false, param4: uint = 0, param5: Boolean = false, param6: Number = 0, param7: int = 0, param8: class_443 = null, param9: class_439 = null, param10: String = "", param11: Vector.<int> = null, param12: Boolean = false, param13: class_872 = null) {
        super(param2, param8, param10, param13, param4, param11, param5, param12);
        if (param9 == null) {
            this.name_75 = new class_439();
        } else {
            this.name_75 = param9;
        }
        this.name_167 = param1;
        this.name_70 = param7;
        this.name_4 = param6;
        this.var_4581 = param3;
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 37;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.name_4 = param1.readDouble();
        this.name_75 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
        this.name_75.read(param1);
        this.name_167 = param1.readInt();
        this.name_167 = Number(this.name_167) >>> 9 | Number(this.name_167) << 23;
        this.name_70 = param1.readInt();
        this.name_70 = Number(this.name_70) << 15 | Number(this.name_70) >>> 17;
        this.var_4581 = param1.readBoolean();
        param1.readShort();
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        param1.writeDouble(this.name_4);
        this.name_75.write(param1);
        param1.writeInt(Number(this.name_167) << 9 | Number(this.name_167) >>> 23);
        param1.writeInt(Number(this.name_70) >>> 15 | Number(this.name_70) << 17);
        param1.writeBoolean(this.var_4581);
        param1.writeShort(-29854);
    }
}
}
