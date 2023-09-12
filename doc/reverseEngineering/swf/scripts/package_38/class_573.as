package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_573 implements ICommand {

    public static const ID: int = 29819;


    public var y: int = 0;

    public var name_128: int = 0;

    public var x: int = 0;

    public var var_3446: int = 0;

    public function class_573(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0) {
        super();
        this.name_128 = param1;
        this.x = param2;
        this.y = param3;
        this.var_3446 = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 16;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.y = param1.readInt();
        this.y = Number(this.y) << 13 | Number(this.y) >>> 19;
        this.name_128 = param1.readInt();
        this.name_128 = Number(this.name_128) << 12 | Number(this.name_128) >>> 20;
        this.x = param1.readInt();
        this.x = Number(this.x) << 4 | Number(this.x) >>> 28;
        this.var_3446 = param1.readInt();
        this.var_3446 = Number(this.var_3446) << 13 | Number(this.var_3446) >>> 19;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(6455);
        param1.writeInt(Number(this.y) >>> 13 | Number(this.y) << 19);
        param1.writeInt(Number(this.name_128) >>> 12 | Number(this.name_128) << 20);
        param1.writeInt(Number(this.x) >>> 4 | Number(this.x) << 28);
        param1.writeInt(Number(this.var_3446) >>> 13 | Number(this.var_3446) << 19);
    }
}
}
