package package_423 {

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.settings.Settings;

import package_112.class_420;

import package_115.class_1085;

import package_22.class_198;

import package_360.class_2084;
import package_360.class_2381;

public class class_2383 extends class_2381 implements IDisposable {


    private var var_127: class_2084;

    private var var_176: class_420;

    private var _owner: class_86;

    public function class_2383(param1: class_420, param2: class_2084) {
        super();
        this.var_176 = param1;
        this._owner = this.var_176.owner as class_86;
        this.var_127 = param2;
        this.method_5731();
        this.var_176.name_127.changed.add(this.method_5731);
        this.var_127.base.loaded.add(this.method_5731);
    }

    private function get ship(): class_86 {
        return this.var_127.ship;
    }

    override public function disposeView(param1: Boolean = false): void {
        this.var_127.base.loaded.remove(this.method_5731);
        this.var_176.name_127.changed.remove(this.method_5731);
        super.disposeView(param1);
    }

    private function method_5731(): void {
        var _loc1_: * = null;
        method_2447 = this.ship.rotation;
        if (Settings.qualityShip.value > Settings.QUALITY_LOW) {
            _loc1_ = class_198.method_2454(this._owner.shipPattern.expansionClassID, this.var_176.name_127.value);
            if (Boolean(_loc1_) && Boolean(_loc1_.resKey)) {
                load(_loc1_.resKey, "mc");
            } else {
                reset();
            }
        } else {
            reset();
        }
    }
}
}
