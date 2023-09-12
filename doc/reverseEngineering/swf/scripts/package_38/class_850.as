package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_850 implements ICommand {

    public static const const_2140: uint = 0;

    public static const const_2746: uint = 2;

    public static const const_1713: uint = 3;

    public static const const_1601: uint = 1;

    public static const ID: int = 24033;


    public var type: uint = 0;

    public function class_850(param1: uint = 0) {
        super();
        this.type = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
        param1.readShort();
        this.type = param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(11654);
        param1.writeShort(-1488);
        param1.writeShort(this.type);
    }
}
}
