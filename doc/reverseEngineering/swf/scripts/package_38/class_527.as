package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_527 implements ICommand {

    public static const ID: int = 20988;


    public var var_1922: Boolean = false;

    public var autoRefinement: Boolean = false;

    public var var_1725: Boolean = false;

    public var var_5022: Boolean = false;

    public var var_2664: Boolean = false;

    public var var_3797: Boolean = false;

    public var var_2969: Boolean = false;

    public var showBattlerayNotifications: Boolean = false;

    public var var_960: Boolean = false;

    public var autoBoost: Boolean = false;

    public function class_527(param1: Boolean = false, param2: Boolean = false, param3: Boolean = false, param4: Boolean = false, param5: Boolean = false, param6: Boolean = false, param7: Boolean = false, param8: Boolean = false, param9: Boolean = false, param10: Boolean = false) {
        super();
        this.var_1922 = param1;
        this.autoBoost = param2;
        this.autoRefinement = param3;
        this.var_2969 = param4;
        this.var_960 = param5;
        this.var_1725 = param6;
        this.var_3797 = param7;
        this.var_2664 = param8;
        this.showBattlerayNotifications = param9;
        this.var_5022 = param10;
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 10;
    }

    public function read(param1: IDataInput): void {
        this.var_1922 = param1.readBoolean();
        this.autoRefinement = param1.readBoolean();
        this.var_1725 = param1.readBoolean();
        this.var_5022 = param1.readBoolean();
        this.var_2664 = param1.readBoolean();
        this.var_3797 = param1.readBoolean();
        this.var_2969 = param1.readBoolean();
        this.showBattlerayNotifications = param1.readBoolean();
        this.var_960 = param1.readBoolean();
        param1.readShort();
        this.autoBoost = param1.readBoolean();
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        param1.writeBoolean(this.var_1922);
        param1.writeBoolean(this.autoRefinement);
        param1.writeBoolean(this.var_1725);
        param1.writeBoolean(this.var_5022);
        param1.writeBoolean(this.var_2664);
        param1.writeBoolean(this.var_3797);
        param1.writeBoolean(this.var_2969);
        param1.writeBoolean(this.showBattlerayNotifications);
        param1.writeBoolean(this.var_960);
        param1.writeShort(-15038);
        param1.writeBoolean(this.autoBoost);
    }
}
}
