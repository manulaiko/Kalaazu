package package_195 {

import com.bigpoint.utils.class_73;

import flash.display.Sprite;

import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;

import package_10.class_305;

public class class_1203 extends Sprite implements class_80, IDisposable {

    private static const const_2832: class_73 = new class_73();


    protected var _mapView: class_87;

    protected var var_727: class_305;

    protected var var_425: Number = 1;

    public function class_1203(param1: class_87, param2: class_305) {
        super();
        this._mapView = param1;
        this.var_727 = param2;
        this._mapView.method_1164(this);
    }

    public function updateObj(param1: Number): void {
        this._mapView.method_4683(this.var_727.x, this.var_727.y, this.var_727.z, const_2832);
        x = int(const_2832.x);
        y = int(const_2832.y);
        this.var_425 = const_2832.z;
    }

    public function disposeView(param1: Boolean = false): void {
        if (parent) {
            parent.removeChild(this);
        }
        this._mapView.method_3592(this);
    }
}
}
