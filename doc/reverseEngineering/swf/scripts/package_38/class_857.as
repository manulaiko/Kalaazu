package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_857 implements ICommand {

    public static const ID: int = 3397;


    public var assetType: class_445;

    public var uid: int = 0;

    public function class_857(param1: class_445 = null, param2: int = 0) {
        super();
        if (param1 == null) {
            this.assetType = new class_445();
        } else {
            this.assetType = param1;
        }
        this.uid = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.assetType = class_127.getInstance().createInstance(param1.readShort()) as class_445;
        this.assetType.read(param1);
        param1.readShort();
        this.uid = param1.readInt();
        this.uid = Number(this.uid) >>> 15 | Number(this.uid) << 17;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.assetType.write(param1);
        param1.writeShort(-17782);
        param1.writeInt(Number(this.uid) << 15 | Number(this.uid) >>> 17);
    }
}
}
