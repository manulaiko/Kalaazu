package package_42 {

import flash.utils.getTimer;

import net.bigpoint.darkorbit.map.model.class_90;

import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_13.class_1935;
import package_13.class_51;

public class SystemManagerProxy extends Proxy {

    public static const NAME: String = "SystemManagerProxy";


    protected var var_3168: class_1935;

    protected var var_3704: Boolean = false;

    protected var var_4015: Number;

    public function SystemManagerProxy() {
        super(NAME);
    }

    public function initialize(param1: class_51): void {
        var _loc2_: * = null;
        if (!this.var_3704) {
            _loc2_ = new class_1935(param1);
            setData(_loc2_);
            this.var_3704 = true;
        }
    }

    public function method_979(): void {
        this.var_4015 = getTimer();
    }

    public function method_3341(): Boolean {
        return getTimer() - Number(this.var_4015) < 60000 ? true : false;
    }

    public function method_146(): class_1935 {
        if (this.var_3168 == null) {
            this.var_3168 = getData() as class_1935;
        }
        return this.var_3168;
    }

    public function get map(): class_90 {
        return this.method_146().name_47.map;
    }
}
}
