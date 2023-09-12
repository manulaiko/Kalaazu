package package_36 {

import net.bigpoint.darkorbit.map.model.traits.class_299;

import package_29.class_85;

import package_35.Effect;
import package_35.class_338;

public class class_98 extends Effect {


    private var var_1231: class_85;

    private var _target: class_85;

    private var var_590: int;

    private var var_85: Boolean;

    private var var_4486: int = 0;

    private var var_4641: Boolean = false;

    public function class_98(param1: class_85, param2: class_85, param3: int, param4: Boolean, param5: int = 0, param6: Boolean = false) {
        super(class_338.ROCKET, const_925);
        this.var_1231 = param1;
        this._target = param2;
        this.var_590 = param3;
        this.var_85 = param4;
        this.var_4486 = param5;
        this.var_4641 = param6;
    }

    public function get attacker(): class_85 {
        return this.var_1231;
    }

    public function get target(): class_85 {
        return this._target;
    }

    public function get typeID(): int {
        return this.var_590;
    }

    public function get name_56(): Boolean {
        return this.var_85;
    }

    public function get method_5769(): int {
        return this.var_4486;
    }

    public function get name_40(): Boolean {
        return this.var_4641;
    }

    override public function isValid(): Boolean {
        return super.isValid() && this.var_1231 != null && this._target != null;
    }

    override public function activate(): Boolean {
        (this.var_1231.method_1954(class_299) as class_299).rocketLauncher.fire.dispatch();
        return super.activate();
    }
}
}
