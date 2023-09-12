package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_874 implements ICommand {

    public static const ID: int = 9151;


    public var mapId: int = 0;

    public var var_1408: int = 0;

    public function class_874(param1: int = 0, param2: int = 0) {
        super();
        this.mapId = param1;
        this.var_1408 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.mapId = param1.readInt();
        this.mapId = Number(this.mapId) >>> 5 | Number(this.mapId) << 27;
        param1.readShort();
        this.var_1408 = param1.readInt();
        this.var_1408 = Number(this.var_1408) >>> 16 | Number(this.var_1408) << 16;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.mapId) << 5 | Number(this.mapId) >>> 27);
        param1.writeShort(-16361);
        param1.writeInt(Number(this.var_1408) << 16 | Number(this.var_1408) >>> 16);
    }
}
}
