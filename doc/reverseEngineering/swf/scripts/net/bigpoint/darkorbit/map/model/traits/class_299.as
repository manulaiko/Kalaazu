package net.bigpoint.darkorbit.map.model.traits {

import package_114.class_312;
import package_114.class_318;

import package_19.class_68;
import package_19.class_70;

import package_29.class_267;
import package_29.class_85;

public class class_299 extends class_267 {


    public const targetChanged: class_68 = new class_70();

    private var _laser: class_312;

    private var var_3576: class_318;

    private var _target: class_287 = null;

    private var var_2054: class_85;

    public function class_299(param1: class_312, param2: class_318) {
        super();
        this._laser = param1;
        this._laser.owner = this;
        this.var_3576 = param2;
        this.var_3576.owner = this;
        this._laser.fire.add(this.method_6405);
        this.var_3576.fire.add(this.method_162);
    }

    private function method_162(): void {
        var _loc1_: * = null;
        if (owner) {
            _loc1_ = owner.method_1954(class_306) as class_306;
            if (_loc1_) {
                _loc1_.method_6420(this.rocketLauncher.var_698);
            }
        }
    }

    private function method_6405(): void {
        var _loc1_: * = null;
        if (owner) {
            _loc1_ = owner.method_1954(class_306) as class_306;
            if (_loc1_) {
                _loc1_.method_6420(this.laser.var_698);
            }
        }
    }

    public function get laser(): class_312 {
        return this._laser;
    }

    public function get rocketLauncher(): class_318 {
        return this.var_3576;
    }

    public function get target(): class_287 {
        return this._target;
    }

    public function set target(param1: class_287): void {
        if (this._target != param1) {
            if (this.var_2054) {
                this.var_2054.const_2402.remove(this.method_3130);
                this.var_2054 = null;
            }
            this._target = param1;
            if (Boolean(this._target) && Boolean(this._target.owner)) {
                this.var_2054 = this._target.owner;
                this.var_2054.const_2402.add(this.method_3130);
            }
            this.targetChanged.dispatch();
        }
    }

    private function method_3130(): void {
        this.target = null;
    }
}
}
