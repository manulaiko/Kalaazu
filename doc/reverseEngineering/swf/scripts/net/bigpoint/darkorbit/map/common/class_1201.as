package net.bigpoint.darkorbit.map.common {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.map.model.class_90;

import package_286.class_1734;

import package_35.Effect;
import package_35.EffectManager;

public class class_1201 {


    private var _manager: EffectManager;

    protected var var_4256: Dictionary;

    public function class_1201() {
        this.var_4256 = new Dictionary(true);
        super();
    }

    public function set map(param1: class_90): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this._manager) {
            this._manager.const_1806.remove(this.method_3292);
            this._manager.const_727.remove(this.method_534);
            for (_loc2_ in this.var_4256) {
                this.method_534(_loc2_ as Effect);
            }
        }
        this._manager = !!param1 ? param1.effects : null;
        if (this._manager) {
            this._manager.const_1806.add(this.method_3292);
            this._manager.const_727.add(this.method_534);
            for each(_loc3_ in this._manager.effects) {
                this.method_3292(_loc3_);
            }
        }
    }

    public function method_1766(param1: Effect): class_1734 {
        return this.var_4256[param1] as class_1734;
    }

    private function method_3292(param1: Effect): void {
        if (this.var_4256[param1] != null) {
            this.method_534(param1);
        }
        var _loc2_: Object = this.method_3190(param1);
        if (Boolean(_loc2_) && (Boolean(param1.method_1664) || Boolean(param1.timeout))) {
            this.var_4256[param1] = _loc2_;
        }
    }

    protected function method_3190(param1: Effect): Object {
        throw new Error("buildEffect is an abstract function. Override it.");
    }

    protected function method_534(param1: Effect): void {
        var _loc2_: Object = this.var_4256[param1];
        if (_loc2_ != null) {
            if (_loc2_ is IDisposable) {
                (_loc2_ as IDisposable).disposeView();
            }
            this.var_4256[param1] = null;
            delete this.var_4256[param1];
        }
    }
}
}
