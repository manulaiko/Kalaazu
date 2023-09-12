package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_200 implements ICommand {

    public static const ID: int = 27262;


    public var var_946: int = 0;

    public var sound: int = 0;

    public var playCombatMusic: Boolean = false;

    public var music: int = 0;

    public var var_1922: Boolean = false;

    public function class_200(param1: Boolean = false, param2: int = 0, param3: int = 0, param4: int = 0, param5: Boolean = false) {
        super();
        this.var_1922 = param1;
        this.sound = param2;
        this.music = param3;
        this.var_946 = param4;
        this.playCombatMusic = param5;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 14;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        this.var_946 = param1.readInt();
        this.var_946 = Number(this.var_946) >>> 9 | Number(this.var_946) << 23;
        this.sound = param1.readInt();
        this.sound = Number(this.sound) >>> 7 | Number(this.sound) << 25;
        this.playCombatMusic = param1.readBoolean();
        this.music = param1.readInt();
        this.music = Number(this.music) << 4 | Number(this.music) >>> 28;
        param1.readShort();
        this.var_1922 = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-4407);
        param1.writeInt(Number(this.var_946) << 9 | Number(this.var_946) >>> 23);
        param1.writeInt(Number(this.sound) << 7 | Number(this.sound) >>> 25);
        param1.writeBoolean(this.playCombatMusic);
        param1.writeInt(Number(this.music) >>> 4 | Number(this.music) << 28);
        param1.writeShort(-5063);
        param1.writeBoolean(this.var_1922);
    }
}
}
