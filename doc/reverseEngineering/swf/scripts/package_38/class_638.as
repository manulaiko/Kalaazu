package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_638 implements ICommand {

    public static const ID: int = 18381;


    public var var_687: class_448;

    public var var_3004: class_611;

    public var var_4114: class_915;

    public var var_4239: class_829;

    public var var_4616: class_527;

    public var var_2076: class_200;

    public function class_638(param1: class_448 = null, param2: class_915 = null, param3: class_200 = null, param4: class_829 = null, param5: class_527 = null, param6: class_611 = null) {
        super();
        if (param1 == null) {
            this.var_687 = new class_448();
        } else {
            this.var_687 = param1;
        }
        if (param2 == null) {
            this.var_4114 = new class_915();
        } else {
            this.var_4114 = param2;
        }
        if (param3 == null) {
            this.var_2076 = new class_200();
        } else {
            this.var_2076 = param3;
        }
        if (param4 == null) {
            this.var_4239 = new class_829();
        } else {
            this.var_4239 = param4;
        }
        if (param5 == null) {
            this.var_4616 = new class_527();
        } else {
            this.var_4616 = param5;
        }
        if (param6 == null) {
            this.var_3004 = new class_611();
        } else {
            this.var_3004 = param6;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 0;
    }

    public function read(param1: IDataInput): void {
        this.var_687 = class_127.getInstance().createInstance(param1.readShort()) as class_448;
        this.var_687.read(param1);
        this.var_3004 = class_127.getInstance().createInstance(param1.readShort()) as class_611;
        this.var_3004.read(param1);
        this.var_4114 = class_127.getInstance().createInstance(param1.readShort()) as class_915;
        this.var_4114.read(param1);
        this.var_4239 = class_127.getInstance().createInstance(param1.readShort()) as class_829;
        this.var_4239.read(param1);
        this.var_4616 = class_127.getInstance().createInstance(param1.readShort()) as class_527;
        this.var_4616.read(param1);
        param1.readShort();
        this.var_2076 = class_127.getInstance().createInstance(param1.readShort()) as class_200;
        this.var_2076.read(param1);
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        this.var_687.write(param1);
        this.var_3004.write(param1);
        this.var_4114.write(param1);
        this.var_4239.write(param1);
        this.var_4616.write(param1);
        param1.writeShort(-23775);
        this.var_2076.write(param1);
    }
}
}
