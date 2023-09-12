package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_458 implements ICommand {

    public static const ID: int = 14974;


    public var var_4149: class_748;

    public var name_128: int = 0;

    public function class_458(param1: class_748 = null, param2: int = 0) {
        super();
        if (param1 == null) {
            this.var_4149 = new class_748();
        } else {
            this.var_4149 = param1;
        }
        this.name_128 = param2;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.var_4149 = class_127.getInstance().createInstance(param1.readShort()) as class_748;
        this.var_4149.read(param1);
        param1.readShort();
        this.name_128 = param1.readInt();
        this.name_128 = Number(this.name_128) << 8 | Number(this.name_128) >>> 24;
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_4149.write(param1);
        param1.writeShort(24759);
        param1.writeInt(Number(this.name_128) >>> 8 | Number(this.name_128) << 24);
    }
}
}
