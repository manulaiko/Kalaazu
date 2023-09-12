package package_428 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.geom.Matrix;
import flash.geom.Point;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.settings.Settings;

import package_116.class_1178;
import package_116.class_317;
import package_116.class_397;

import package_360.class_2084;

public class class_2377 extends Sprite implements IDisposable {

    private static const const_2125: Matrix = new Matrix();


    private var var_669: class_317;

    private var var_127: class_2084;

    public function class_2377(param1: class_317, param2: class_2084) {
        super();
        this.var_127 = param2;
        this.var_669 = param1;
        Settings.displayDrones.changed.add(this.method_3134);
        this.method_3134();
    }

    public function disposeView(param1: Boolean = false): void {
        var _loc2_: * = null;
        this.method_64();
        Settings.displayDrones.changed.remove(this.method_3134);
        while (numChildren) {
            _loc2_ = removeChildAt(numChildren - 1) as class_2568;
            _loc2_.method_2447 = null;
        }
    }

    private function addListeners(): void {
        this.var_127.ship.position.changed.add(this.update);
        this.var_127.ship.rotation.changed.add(this.update);
        this.var_669.const_1693.changed.add(this.update);
        this.var_669.const_2113.changed.add(this.update);
        this.var_669.const_1831.add(this.method_3134);
    }

    private function method_64(): void {
        this.var_127.ship.position.changed.remove(this.update);
        this.var_127.ship.rotation.changed.remove(this.update);
        this.var_669.const_1693.changed.remove(this.update);
        this.var_669.const_2113.changed.remove(this.update);
        this.var_669.const_1831.remove(this.method_3134);
    }

    private function method_3134(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        while (numChildren) {
            _loc1_ = removeChildAt(numChildren - 1) as class_2568;
            _loc1_.method_2447 = null;
        }
        if (Settings.displayDrones.value) {
            for each(_loc2_ in this.var_669.drones) {
                _loc1_ = new class_2568(_loc2_);
                _loc1_.method_2447 = this.var_127.ship.rotation;
                addChild(_loc1_);
            }
            this.addListeners();
            this.update();
        } else {
            this.method_64();
        }
    }

    private function update(): void {
        var _loc2_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc1_: class_397 = class_397.var_63[this.var_669.const_1693.value];
        var _loc3_: int = 0;
        const_2125.identity();
        const_2125.rotate(this.var_127.ship.rotation.radians);
        const_2125.scale(this.var_669.const_2113.value, this.var_669.const_2113.value);
        for each(_loc4_ in this.var_669.drones) {
            _loc2_ = _loc1_.method_4473(numChildren, _loc4_.index);
            if (_loc2_) {
                _loc5_ = const_2125.transformPoint(_loc2_.method_3137());
                TweenLite.to(getChildAt(_loc3_++), 0.5, {
                    "x": _loc5_.x,
                    "y": _loc5_.y
                });
            }
        }
    }
}
}
