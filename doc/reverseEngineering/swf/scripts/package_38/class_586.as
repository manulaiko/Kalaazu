package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_586 implements ICommand {

    public static const ID: int = 3388;


    public var var_2380: int = 0;

    public var var_2742: int = 0;

    public var var_2345: int = 0;

    public var var_3082: int = 0;

    public var speed: int = 0;

    public function class_586(param1: int = 0, param2: int = 0, param3: int = 0, param4: int = 0, param5: int = 0) {
        super();
        this.var_2742 = param1;
        this.var_2345 = param2;
        this.var_3082 = param3;
        this.var_2380 = param4;
        this.speed = param5;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 20;
    }

    public function read(param1: IDataInput): void {
        this.var_2380 = param1.readInt();
        this.var_2380 = Number(this.var_2380) << 1 | Number(this.var_2380) >>> 31;
        this.var_2742 = param1.readInt();
        this.var_2742 = Number(this.var_2742) >>> 8 | Number(this.var_2742) << 24;
        this.var_2345 = param1.readInt();
        this.var_2345 = Number(this.var_2345) >>> 13 | Number(this.var_2345) << 19;
        this.var_3082 = param1.readInt();
        this.var_3082 = Number(this.var_3082) >>> 7 | Number(this.var_3082) << 25;
        this.speed = param1.readInt();
        this.speed = Number(this.speed) << 15 | Number(this.speed) >>> 17;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(Number(this.var_2380) >>> 1 | Number(this.var_2380) << 31);
        param1.writeInt(Number(this.var_2742) << 8 | Number(this.var_2742) >>> 24);
        param1.writeInt(Number(this.var_2345) << 13 | Number(this.var_2345) >>> 19);
        param1.writeInt(Number(this.var_3082) << 7 | Number(this.var_3082) >>> 25);
        param1.writeInt(Number(this.speed) >>> 15 | Number(this.speed) << 17);
    }
}
}
