package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_595 implements ICommand {

    public static const const_2867: uint = 1;

    public static const const_1873: uint = 2;

    public static const OPEN: uint = 0;

    public static const ID: int = 4423;


    public var visibility: uint = 0;

    public var paymentLink: String = "";

    public var var_3770: class_834;

    public var var_541: Boolean = false;

    public var var_3110: Boolean = false;

    public var window: class_672;

    public function class_595(param1: class_672 = null, param2: Boolean = false, param3: uint = 0, param4: Boolean = false, param5: class_834 = null, param6: String = "") {
        super();
        if (param1 == null) {
            this.window = new class_672();
        } else {
            this.window = param1;
        }
        this.var_541 = param2;
        this.visibility = param3;
        this.var_3110 = param4;
        if (param5 == null) {
            this.var_3770 = new class_834();
        } else {
            this.var_3770 = param5;
        }
        this.paymentLink = param6;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        this.visibility = param1.readShort();
        this.paymentLink = param1.readUTF();
        this.var_3770 = class_127.getInstance().createInstance(param1.readShort()) as class_834;
        this.var_3770.read(param1);
        this.var_541 = param1.readBoolean();
        this.var_3110 = param1.readBoolean();
        this.window = class_127.getInstance().createInstance(param1.readShort()) as class_672;
        this.window.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeShort(this.visibility);
        param1.writeUTF(this.paymentLink);
        this.var_3770.write(param1);
        param1.writeBoolean(this.var_541);
        param1.writeBoolean(this.var_3110);
        this.window.write(param1);
    }
}
}
