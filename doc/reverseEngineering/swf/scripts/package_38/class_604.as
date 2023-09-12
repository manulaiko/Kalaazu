package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_604 implements ICommand {

    public static const ID: int = 23447;


    public var var_4428: String = "";

    public var mapId: int = 0;

    public function class_604(param1: int = 0, param2: String = "") {
        super();
        this.mapId = param1;
        this.var_4428 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 6;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_4428 = param1.readUTF();
        param1.readShort();
        this.mapId = param1.readInt();
        this.mapId = Number(this.mapId) << 15 | Number(this.mapId) >>> 17;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(4383);
        param1.writeUTF(this.var_4428);
        param1.writeShort(-13508);
        param1.writeInt(Number(this.mapId) >>> 15 | Number(this.mapId) << 17);
    }
}
}
