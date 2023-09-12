package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_639 extends class_434 implements ICommand {

    public static const ID: int = 14585;


    public var rank: class_884;

    public var name_124: class_824;

    public var name_60: class_584;

    public function class_639(param1: class_884 = null, param2: class_824 = null, param3: class_584 = null) {
        super();
        if (param1 == null) {
            this.rank = new class_884();
        } else {
            this.rank = param1;
        }
        if (param3 == null) {
            this.name_60 = new class_584();
        } else {
            this.name_60 = param3;
        }
        if (param2 == null) {
            this.name_124 = new class_824();
        } else {
            this.name_124 = param2;
        }
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 0;
    }

    override public function read(param1: IDataInput): void {
        super.read(param1);
        this.rank = class_127.getInstance().createInstance(param1.readShort()) as class_884;
        this.rank.read(param1);
        param1.readShort();
        this.name_124 = class_127.getInstance().createInstance(param1.readShort()) as class_824;
        this.name_124.read(param1);
        this.name_60 = class_127.getInstance().createInstance(param1.readShort()) as class_584;
        this.name_60.read(param1);
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        super.method_3(param1);
        this.rank.write(param1);
        param1.writeShort(-9335);
        this.name_124.write(param1);
        this.name_60.write(param1);
    }
}
}
