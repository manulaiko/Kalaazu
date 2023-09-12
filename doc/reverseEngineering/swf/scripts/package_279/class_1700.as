package package_279 {

import flash.display.DisplayObject;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_1699;
import net.bigpoint.darkorbit.map.model.traits.class_1493;
import net.bigpoint.darkorbit.map.model.traits.class_319;

import package_113.class_310;

import package_195.class_1203;

import package_29.class_267;
import package_29.class_85;

public class class_1700 extends class_1203 implements class_1699 {

    private static const MAPPING: Dictionary = new Dictionary();

    {
        MAPPING[class_1493] = class_2012;
    }

    private var var_2267: class_85;

    private var var_3461: Dictionary;

    private var var_1994: class_2011;

    private var var_3007: TopDisplay;

    public function class_1700(param1: class_87, param2: class_310) {
        this.var_3461 = new Dictionary();
        super(param1, param2.owner.position);
        this.var_2267 = param2.owner;
        this.var_1994 = new class_2011(param2);
        addChild(this.var_1994);
        this.var_3007 = new TopDisplay(this.var_2267);
        addChild(this.var_3007);
        this.var_2267.name_110.add(this.name_110);
        this.var_2267.name_33.add(this.name_33);
        this.updateLayout();
    }

    override public function updateObj(param1: Number): void {
        super.updateObj(param1);
        this.updateLayout();
    }

    override public function disposeView(param1: Boolean = false): void {
        this.var_2267.name_110.remove(this.name_110);
        this.var_2267.name_33.remove(this.name_33);
        this.var_1994.disposeView(param1);
        this.var_3007.disposeView(param1);
        super.disposeView(param1);
    }

    private function updateLayout(): void {
        var _loc1_: * = null;
        var _loc2_: Number = NaN;
        _loc1_ = !!this.var_2267 ? this.var_2267.method_1954(class_319) as class_319 : null;
        if (_loc1_) {
            _loc2_ = this.var_2267.id == class_81.userID ? Number(var_425) : 1;
            this.var_1994.y = Number(_loc1_.clickRadius) * _loc2_;
            this.var_3007.y = -(Number(_loc1_.clickRadius) * _loc2_) - 5;
        }
    }

    private function name_110(param1: class_267): void {
        var _loc2_: * = undefined;
        var _loc3_: * = null;
        for (_loc2_ in MAPPING) {
            if (param1 is _loc2_) {
                _loc3_ = this.var_3461[param1] = new MAPPING[_loc2_](param1, this);
                addChild(_loc3_ as DisplayObject);
            }
        }
        this.updateLayout();
    }

    private function name_33(param1: class_267): void {
        var _loc2_: Object = this.var_3461[param1];
        if (_loc2_ != null) {
            if (_loc2_ is DisplayObject) {
                removeChild(_loc2_ as DisplayObject);
            }
            if (_loc2_ is IDisposable) {
                (_loc2_ as IDisposable).disposeView();
            }
        }
    }

    public function get layer(): int {
        return 0;
    }
}
}
