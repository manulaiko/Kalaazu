package net.bigpoint.darkorbit.map.view3D.display3D {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_1860;
import net.bigpoint.darkorbit.map.model.traits.class_306;

import package_119.class_1191;

import package_177.class_2468;

import package_29.class_267;

import package_373.class_2134;

import package_443.class_2461;
import package_443.class_2462;
import package_443.class_2463;
import package_443.class_2464;
import package_443.class_2465;
import package_443.class_2467;
import package_443.class_2470;
import package_443.class_2471;
import package_443.class_2472;

import package_444.class_2466;
import package_444.class_2473;

import package_445.class_2469;

public class class_2135 extends class_2134 {

    private static const const_2191: Object = {};

    private static const const_1333: Dictionary = new Dictionary();

    {
        const_2191["hero"] = class_2470;
        const_2191["heroPet"] = class_2462;
        const_2191["ship"] = class_2469;
        const_2191["drones"] = class_2468;
        const_2191["portal"] = class_2465;
        const_2191["battleStation"] = class_2471;
        const_2191["sectorControlBeacon"] = class_2463;
        const_2191["collectable"] = class_2467;
        const_2191["relay"] = class_2464;
        const_2191["mine"] = class_2472;
        const_1333[class_1860] = class_2466;
        const_1333[class_1191] = class_2473;
    }

    private var var_176: class_306;

    private var var_390: Vector.<Object>;

    private var var_2613: Dictionary;

    public function class_2135(param1: class_306) {
        var _loc2_: * = null;
        var _loc3_: * = null;
        this.var_390 = new Vector.<Object>();
        this.var_2613 = new Dictionary();
        this.var_176 = param1;
        super(param1.descriptor.display3D[0], param1.state, param1.owner, param1.debug, "uid " + param1.owner.id + " " + param1.owner);
        this.var_176.const_820.add(method_6420);
        x = this.var_176.owner.method_1474;
        y = this.var_176.owner.method_1121;
        z = this.var_176.owner.method_6123;
        for each(_loc2_ in this.var_176.decorators) {
            if (false) {
                _loc3_ = new const_2191[_loc2_.id]();
                _loc3_.initialize(this.var_176, this, _loc2_);
                this.var_390.push(_loc3_);
                if (_loc3_ is class_80) {
                    _manager.method_1164(_loc3_ as class_80);
                }
                if (_loc3_ is IDisposable) {
                    _manager.method_1490(_loc3_ as IDisposable);
                }
            } else {
                log("unknown decorator " + _loc2_.id);
            }
        }
    }

    override public function disposeView(param1: Boolean = false): void {
        var _loc2_: * = null;
        this.var_176.const_820.remove(method_6420);
        this.var_176.owner.name_110.remove(this.method_2767);
        this.var_176.owner.name_33.remove(this.method_2228);
        if (param1) {
            for each(_loc2_ in this.var_176.owner.traits) {
                this.method_2228(_loc2_, param1);
            }
        }
        super.disposeView(param1);
    }

    override protected function method_206(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        super.method_206();
        for each(_loc1_ in this.var_390) {
            _loc1_.decorate();
        }
        this.var_176.owner.name_110.add(this.method_2767);
        this.var_176.owner.name_33.add(this.method_2228);
        for each(_loc2_ in this.var_176.owner.traits) {
            this.method_2767(_loc2_);
        }
    }

    private function method_2767(param1: class_267): void {
        var _loc2_: * = undefined;
        var _loc3_: * = null;
        for (_loc2_ in const_1333) {
            if (param1 is (_loc2_ as Class)) {
                _loc3_ = new const_1333[_loc2_](param1, this);
                this.var_2613[param1] = _loc3_;
                if (_loc3_ is class_80) {
                    _manager.method_1164(_loc3_ as class_80);
                }
                if (_loc3_ is IDisposable) {
                    _manager.method_1490(_loc3_ as IDisposable);
                }
            }
        }
    }

    private function method_2228(param1: class_267, param2: Boolean = false): void {
        var _loc3_: * = null;
        if (this.var_2613[param1]) {
            _loc3_ = this.var_2613[param1];
            if (_loc3_ is IDisposable) {
                IDisposable(_loc3_).disposeView(param2);
                _manager.method_6419(IDisposable(_loc3_));
            }
            if (_loc3_ is class_80) {
                _manager.method_3592(_loc3_ as class_80);
            }
        }
    }
}
}
