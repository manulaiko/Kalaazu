package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_946 implements ICommand {

    public static const ID: int = 16633;


    public var var_4992: int = 0;

    public var var_5007: int = 0;

    public var faction: class_439;

    public function class_946(param1: class_439 = null, param2: int = 0, param3: int = 0) {
        super();
        if (param1 == null) {
            this.faction = new class_439();
        } else {
            this.faction = param1;
        }
        this.var_4992 = param2;
        this.var_5007 = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.var_4992 = param1.readInt();
        this.var_4992 = Number(this.var_4992) << 10 | Number(this.var_4992) >>> 22;
        this.var_5007 = param1.readInt();
        this.var_5007 = Number(this.var_5007) >>> 1 | Number(this.var_5007) << 31;
        this.faction = class_127.getInstance().createInstance(param1.readShort()) as class_439;
        this.faction.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_4992) >>> 10 | Number(this.var_4992) << 22);
        param1.writeInt(Number(this.var_5007) << 1 | Number(this.var_5007) >>> 31);
        this.faction.write(param1);
    }
}
}
