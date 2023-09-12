package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_780 implements ICommand {

    public static const const_2954: uint = 7;

    public static const const_2115: uint = 2;

    public static const const_1633: uint = 5;

    public static const const_2813: uint = 8;

    public static const TIME: uint = 4;

    public static const PVP: uint = 3;

    public static const const_830: uint = 6;

    public static const const_567: uint = 0;

    public static const COLLECT: uint = 1;

    public static const ID: int = 5610;


    public var icon: uint = 0;

    public function class_780(param1: uint = 0) {
        super();
        this.icon = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.icon = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.icon);
    }
}
}
