package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_535 implements ICommand {

    public static const ID: int = 19557;


    public var y: int = 0;

    public var color: int = 0;

    public var x: int = 0;

    public var var_3097: int = 0;

    public function class_535(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0) {
        super();
        this.x = param1;
        this.y = param2;
        this.color = param3;
        this.var_3097 = param4;
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
        this.y = Number(this.y) >>> 2 | Number(this.y) << 30;
        this.color = param1.readInt();
        this.color = Number(this.color) << 13 | Number(this.color) >>> 19;
        this.x = param1.readInt();
        this.x = Number(this.x) >>> 11 | Number(this.x) << 21;
        this.var_3097 = param1.readInt();
        this.var_3097 = Number(this.var_3097) << 8 | Number(this.var_3097) >>> 24;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-22855);
        param1.writeInt(Number(this.y) << 2 | Number(this.y) >>> 30);
        param1.writeInt(Number(this.color) >>> 13 | Number(this.color) << 19);
        param1.writeInt(Number(this.x) << 11 | Number(this.x) >>> 21);
        param1.writeInt(Number(this.var_3097) >>> 8 | Number(this.var_3097) << 24);
    }
}
}
