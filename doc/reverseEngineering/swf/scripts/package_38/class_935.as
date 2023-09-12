package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_935 implements ICommand {

    public static const ID: int = 3946;


    public var var_1684: Boolean = false;

    public var showRequests: Boolean = false;

    public var var_1258: Boolean = false;

    public var var_1401: Boolean = false;

    public function class_935(param1: Boolean = false, param2: Boolean = false, param3: Boolean = false, param4: Boolean = false) {
        super();
        this.var_1258 = param1;
        this.var_1684 = param2;
        this.showRequests = param3;
        this.var_1401 = param4;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.var_1684 = param1.readBoolean();
        this.showRequests = param1.readBoolean();
        this.var_1258 = param1.readBoolean();
        this.var_1401 = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.var_1684);
        param1.writeBoolean(this.showRequests);
        param1.writeBoolean(this.var_1258);
        param1.writeBoolean(this.var_1401);
    }
}
}
