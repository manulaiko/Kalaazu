package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_120 implements ICommand {

    public static const ID: int = 666;


    public var major: int = 0;

    public var minor: int = 0;

    public var build: int = 0;

    public function class_120(param1: int = 0, param2: int = 74, param3: int = 7) {
        super();
        this.major = param1;
        this.minor = param2;
        this.build = param3;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 12;
    }

    public function read(param1: IDataInput): void {
        this.major = param1.readInt();
        this.minor = param1.readInt();
        this.build = param1.readInt();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeInt(this.major);
        param1.writeInt(this.minor);
        param1.writeInt(this.build);
    }
}
}
