package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_786 implements ICommand {

    public static const ID: int = 18140;


    public var x: int = 0;

    public var var_448: class_821;

    public var y: int = 0;

    public var uid: int = 0;

    public var hash: String = "";

    public var type: class_445;

    public function class_786(param1: String = "", param2: class_445 = null, param3: class_821 = null, param4: int = 0, param5: int = 0, param6: int = 0) {
        super();
        this.hash = param1;
        if (param2 == null) {
            this.type = new class_445();
        } else {
            this.type = param2;
        }
        if (param3 == null) {
            this.var_448 = new class_821();
        } else {
            this.var_448 = param3;
        }
        this.x = param4;
        this.y = param5;
        this.uid = param6;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 14;
    }

    public function read(param1: IDataInput): void {
        this.x = param1.readInt();
        this.x = Number(this.x) >>> 5 | Number(this.x) << 27;
        this.var_448 = class_127.getInstance().createInstance(param1.readShort()) as class_821;
        this.var_448.read(param1);
        this.y = param1.readInt();
        this.y = Number(this.y) << 5 | Number(this.y) >>> 27;
        this.uid = param1.readInt();
        this.uid = Number(this.uid) << 2 | Number(this.uid) >>> 30;
        this.hash = param1.readUTF();
        this.type = class_127.getInstance().createInstance(param1.readShort()) as class_445;
        this.type.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.x) << 5 | Number(this.x) >>> 27);
        this.var_448.write(param1);
        param1.writeInt(Number(this.y) >>> 5 | Number(this.y) << 27);
        param1.writeInt(Number(this.uid) >>> 2 | Number(this.uid) << 30);
        param1.writeUTF(this.hash);
        this.type.write(param1);
    }
}
}
