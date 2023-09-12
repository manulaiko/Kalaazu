package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_581 implements ICommand {

    public static const ID: int = 7114;


    public var playerScore: Number = 0;

    public function class_581(param1: Number = 0) {
        super();
        this.playerScore = param1;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 8;
    }

    public function read(param1: IDataInput): void {
        this.playerScore = param1.readDouble();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeDouble(this.playerScore);
    }
}
}
