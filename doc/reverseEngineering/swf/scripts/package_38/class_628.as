package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_628 implements ICommand {

    public static const ID: int = 17926;


    public function class_628() {
        super();
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        param1.readShort();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(-29485);
    }
}
}
