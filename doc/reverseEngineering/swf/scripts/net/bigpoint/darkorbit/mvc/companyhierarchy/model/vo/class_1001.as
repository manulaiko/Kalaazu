package net.bigpoint.darkorbit.mvc.companyhierarchy.model.vo {

import net.bigpoint.darkorbit.settings.Settings;

public class class_1001 implements IRankedClanViewData {


    private var var_2176: int;

    private var _position: String;

    private var var_4091: String;

    private var var_2757: int;

    private var var_1500: String;

    private var var_1691: int;

    private var var_4332: String;

    private var var_966: String;

    public function class_1001(param1: int, param2: String, param3: String, param4: String, param5: int, param6: int = 0, param7: String = "-") {
        super();
        this.var_2176 = param1;
        this._position = param2;
        this.var_4091 = param3;
        this.var_2757 = param6;
        this.var_1500 = param4;
        this.var_1691 = param5;
        this.var_4332 = "http://sharedimages.bigpoint.net//clanLogo/clan_undefined_" + param6 + ".gif?project=darkorbit&default=%2FclanLogo%2Fdefault.jpg";
        this.var_966 = param7;
    }

    public function get rank(): int {
        return this.var_2176;
    }

    public function get position(): String {
        return this._position;
    }

    public function get name_123(): String {
        return this.var_4091;
    }

    public function get name_45(): int {
        return this.var_2757;
    }

    public function get leader(): String {
        return this.var_1500;
    }

    public function get points(): int {
        return this.var_1691;
    }

    public function get method_2285(): String {
        return this.var_4332;
    }

    public function get name_49(): String {
        return this.var_966;
    }
}
}
