package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_883 implements ICommand {

    public static const ID: int = 8437;


    public var name_90: int = 0;

    public var name_164: int = 0;

    public var name_115: int = 0;

    public var name_127: int = 0;

    public var var_124: int = 0;

    public var maxHitpoints: int = 0;

    public var type: class_445;

    public var var_661: Boolean = false;

    public var var_2703: int = 0;

    public function class_883(param1: int = 0, param2: class_445 = null, param3: int = 0, param4: int = 0, param5: int = 0, param6: int = 0, param7: Boolean = false, param8: int = 0, param9: int = 0) {
        super();
        this.name_115 = param1;
        if (param2 == null) {
            this.type = new class_445();
        } else {
            this.type = param2;
        }
        this.name_164 = param3;
        this.name_127 = param4;
        this.name_90 = param5;
        this.maxHitpoints = param6;
        this.var_661 = param7;
        this.var_124 = param8;
        this.var_2703 = param9;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 29;
    }

    public function read(param1: IDataInput): void {
        this.name_90 = param1.readInt();
        this.name_90 = Number(this.name_90) >>> 5 | Number(this.name_90) << 27;
        this.name_164 = param1.readInt();
        this.name_164 = Number(this.name_164) << 8 | Number(this.name_164) >>> 24;
        this.name_115 = param1.readInt();
        this.name_115 = Number(this.name_115) << 6 | Number(this.name_115) >>> 26;
        this.name_127 = param1.readInt();
        this.name_127 = Number(this.name_127) << 15 | Number(this.name_127) >>> 17;
        this.var_124 = param1.readInt();
        this.var_124 = Number(this.var_124) >>> 15 | Number(this.var_124) << 17;
        this.maxHitpoints = param1.readInt();
        this.maxHitpoints = Number(this.maxHitpoints) >>> 15 | Number(this.maxHitpoints) << 17;
        param1.readShort();
        this.type = class_127.getInstance().createInstance(param1.readShort()) as class_445;
        this.type.read(param1);
        this.var_661 = param1.readBoolean();
        this.var_2703 = param1.readInt();
        this.var_2703 = Number(this.var_2703) >>> 12 | Number(this.var_2703) << 20;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.name_90) << 5 | Number(this.name_90) >>> 27);
        param1.writeInt(Number(this.name_164) >>> 8 | Number(this.name_164) << 24);
        param1.writeInt(Number(this.name_115) >>> 6 | Number(this.name_115) << 26);
        param1.writeInt(Number(this.name_127) >>> 15 | Number(this.name_127) << 17);
        param1.writeInt(Number(this.var_124) << 15 | Number(this.var_124) >>> 17);
        param1.writeInt(Number(this.maxHitpoints) << 15 | Number(this.maxHitpoints) >>> 17);
        param1.writeShort(14279);
        this.type.write(param1);
        param1.writeBoolean(this.var_661);
        param1.writeInt(Number(this.var_2703) << 12 | Number(this.var_2703) >>> 20);
    }
}
}
