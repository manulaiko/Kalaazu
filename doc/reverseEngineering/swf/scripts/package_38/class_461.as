package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_461 implements ICommand {

    public static const ID: int = 5029;


    public var type: class_745;

    public function class_461(param1: class_745 = null) {
        super();
        if (param1 == null) {
            this.type = new class_745();
        } else {
            this.type = param1;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.type = class_127.getInstance().createInstance(param1.readShort()) as class_745;
        this.type.read(param1);
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(14156);
        this.type.write(param1);
        param1.writeShort(2907);
    }
}
}
