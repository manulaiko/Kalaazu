package package_303 {

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.traits.class_309;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_295.class_1752;

import package_35.Effect;
import package_35.class_348;

import package_445.class_2469;

public class class_2222 extends class_1752 implements IDisposable {


    private var _mapView: class_1211;

    private var _effect: Effect;

    private var var_4388: class_2469;

    public function class_2222(param1: class_1211, param2: Effect) {
        super();
        this._effect = param2;
        this._mapView = param1;
        var _loc3_: class_348 = this._effect as class_348;
        if (_loc3_) {
            this.var_4388 = param1.method_3658.method_6501(_loc3_.source.method_1954(class_309)) as class_2469;
        }
    }

    public function cleanup(): void {
        if (parent) {
            parent.removeChild(this);
        }
    }

    public function disposeView(param1: Boolean = false): void {
        this.cleanup();
    }

    protected function get effect(): Effect {
        return this._effect;
    }

    protected function get method_1521(): class_2469 {
        return this.var_4388;
    }

    public function get method_3528(): class_1211 {
        return this._mapView;
    }
}
}
