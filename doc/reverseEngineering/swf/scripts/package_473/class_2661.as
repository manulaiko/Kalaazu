package package_473 {

import net.bigpoint.darkorbit.map.model.traits.class_306;

import package_29.class_85;

import package_381.class_2160;

public class class_2661 extends class_2160 {

    public static const const_1238: int = 0;

    public static const const_835: int = 1;

    public static const const_1794: int = 2;

    private static const const_445: Object = {};

    {
        const_445[const_1238] = "impact_shield.zip";
        const_445[const_835] = "impact_shield_skill.zip";
        const_445[const_1794] = "impact_shield.zip";
    }

    private var var_2218: Number;

    private var var_50: Number;

    private var var_4845: Number;

    public function class_2661(param1: Number, param2: Number, param3: Number, param4: class_85, param5: int = 0) {
        this.var_2218 = param1;
        this.var_50 = param2;
        this.var_4845 = param3;
        super(null, const_445[param5], param4.position, param4, true, 0.2);
        var _loc6_: class_306;
        if (_loc6_ = param4.method_1954(class_306) as class_306) {
            scale = _loc6_.method_4449;
        }
        method_450 = false;
    }

    override protected function method_1460(): void {
        super.method_1460();
        method_1154(this.var_2218, this.var_50, this.var_4845);
    }
}
}
