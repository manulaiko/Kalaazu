package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_864 implements ICommand {

    public static const ID: int = 5748;


    public var toolTip: class_358;

    public var itemId: String = "";

    public var visible: Boolean = false;

    public function class_864(param1: String = "", param2: Boolean = false, param3: class_358 = null) {
        super();
        this.itemId = param1;
        this.visible = param2;
        if (param3 == null) {
            this.toolTip = new class_358();
        } else {
            this.toolTip = param3;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 3;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.toolTip = class_127.getInstance().createInstance(param1.readShort()) as class_358;
        this.toolTip.read(param1);
        this.itemId = param1.readUTF();
        this.visible = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(11362);
        this.toolTip.write(param1);
        param1.writeUTF(this.itemId);
        param1.writeBoolean(this.visible);
    }
}
}
