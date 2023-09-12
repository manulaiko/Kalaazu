package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_835 implements ICommand {

    public static const ID: int = 8537;


    public var quest: class_238;

    public function class_835(param1: class_238 = null) {
        super();
        if (param1 == null) {
            this.quest = new class_238();
        } else {
            this.quest = param1;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.quest = class_127.getInstance().createInstance(param1.readShort()) as class_238;
        this.quest.read(param1);
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.quest.write(param1);
        param1.writeShort(-4395);
    }
}
}
