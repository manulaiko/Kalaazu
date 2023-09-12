package package_177 {

import com.bigpoint.utils.class_73;
import com.greensock.easing.Quad;

import flash.geom.Matrix3D;
import flash.geom.Vector3D;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
import net.bigpoint.darkorbit.map.view3D.display3D.class_2135;
import net.bigpoint.darkorbit.settings.Settings;

import package_116.class_1178;
import package_116.class_397;

import package_295.class_1752;

import package_310.class_1780;

import package_373.class_2134;

import package_424.class_2563;
import package_424.class_2564;

import package_443.class_2461;

public class class_2468 implements class_2461, IDisposable, class_80 {

    private static const const_2125: Matrix3D = new Matrix3D();

    private static const const_588: Vector.<Number> = new Vector.<Number>(3, true);


    private var _ship: class_86;

    private var var_669: Vector.<class_2653>;

    private var var_2466: class_1752;

    private var var_127: class_2135;

    private var var_4563: Number = 0;

    private var var_3639: Dictionary;

    private var var_53: class_2563;

    public function class_2468() {
        this.var_669 = new Vector.<class_2653>();
        this.var_3639 = new Dictionary();
        super();
    }

    public function initialize(param1: class_306, param2: class_2134, param3: Object): void {
        this._ship = param1.owner as class_86;
        this.var_127 = param2 as class_2135;
    }

    public function decorate(): void {
        this.addListeners();
        Settings.displayDrones.changed.add(this.method_3134);
        this._ship.drones.const_1693.changed.add(this.method_3134);
        Settings.show2DFormation.changed.add(this.method_3134);
        this.method_3134();
    }

    public function disposeView(param1: Boolean = false): void {
        var _loc2_: * = null;
        this.method_64();
        Settings.displayDrones.changed.remove(this.method_3134);
        Settings.show2DFormation.changed.remove(this.method_3134);
        this._ship.drones.const_1693.changed.remove(this.method_3134);
        while (this.var_669.length) {
            _loc2_ = this.var_669.pop() as class_2653;
            this._ship.removeTrait(this.var_3639[_loc2_.drone]);
            _loc2_.disposeView();
        }
    }

    public function updateObj(param1: Number): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        if (this.var_669.length > 0) {
            _loc2_ = class_397.var_912[this._ship.drones.const_1693.value];
            if (_loc2_ == null || Settings.show2DFormation.value) {
                _loc2_ = class_397.var_63[this._ship.drones.const_1693.value];
            }
            this.var_4563 = param1 > 0 ? Quad.easeOut(param1, this.var_4563, this.method_2166(this.var_4563, this._ship.rotation.degrees), 0.3) : Number(this._ship.rotation.degrees);
            const_2125.identity();
            const_2125.appendScale(this._ship.drones.const_2113.value, this._ship.drones.const_2113.value, this._ship.drones.const_2113.value);
            const_2125.appendRotation(this.var_4563, Vector3D.Y_AXIS);
            _loc4_ = int(this.var_669.length);
            _loc6_ = 0;
            while (_loc6_ < _loc4_) {
                _loc3_ = (_loc5_ = this.var_669[_loc6_]).var_3298;
                _loc7_ = _loc2_.method_4473(this._ship.drones.drones.length, _loc5_.drone.index);
                const_588[0] = _loc7_.x;
                const_588[1] = -Number(_loc7_.z);
                const_588[2] = -Number(_loc7_.y);
                if (_loc5_.var_2364) {
                    if (_loc3_) {
                        const_2125.appendRotation(_loc3_.z, Vector3D.Z_AXIS);
                        const_2125.appendRotation(_loc3_.x, Vector3D.X_AXIS);
                        const_2125.appendRotation(_loc3_.y, Vector3D.Y_AXIS);
                    }
                    _loc5_.var_2364.transform.transformVectors(const_588, const_588);
                }
                const_2125.transformVectors(const_588, const_588);
                _loc5_.name_67.setTo(const_588[0], const_588[1], const_588[2]);
                _loc5_.updateObj(param1);
                _loc5_.rotationY = Number(this.var_4563) - 90;
                if (_loc5_.var_2364) {
                    if (_loc3_) {
                        const_2125.appendRotation(-_loc3_.z, Vector3D.Z_AXIS);
                        const_2125.appendRotation(-_loc3_.x, Vector3D.X_AXIS);
                        const_2125.appendRotation(-_loc3_.y, Vector3D.Y_AXIS);
                    }
                }
                _loc6_++;
            }
            if (this.var_127.method_3464) {
                this.var_2466.moveTo(-Number(this.var_127.method_3464.z) * Number(this.var_127.const_2015.z) + this._ship.method_1474, Number(this.var_127.method_3464.y) * Number(this.var_127.const_2015.y) + this._ship.method_1121, Number(this.var_127.method_3464.x) * Number(this.var_127.const_2015.x) + this._ship.method_6123);
            } else {
                this.var_2466.moveTo(this._ship.method_1474, this._ship.method_1121, this._ship.method_6123);
            }
        }
    }

    private function addListeners(): void {
        this._ship.drones.const_1831.add(this.method_3134);
        this.var_127.const_260.add(this.method_6035);
    }

    private function method_64(): void {
        this._ship.drones.const_1831.remove(this.method_3134);
        this.var_127.const_260.remove(this.method_6035);
    }

    private function method_6035(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        for each(_loc1_ in this.var_669) {
            _loc1_.view.method_2531();
            for each(_loc2_ in this.var_127.method_5489) {
                _loc1_.view.addMethod(_loc2_);
            }
        }
    }

    private function method_3134(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        var _loc7_: * = null;
        if (this.var_53) {
            this.var_53.dispose();
            this.var_53 = null;
        }
        while (this.var_669.length) {
            _loc1_ = this.var_669.pop() as class_2653;
            _loc1_.disposeView();
        }
        if (Settings.displayDrones.value) {
            this.var_2466 = new class_1752();
            class_1210.instance.method_3528.method_1616.addChild(this.var_2466);
            for each(_loc2_ in this._ship.drones.drones) {
                _loc1_ = new class_2653(_loc2_, this._ship);
                this.var_669.push(_loc1_);
                this.var_2466.addChild(_loc1_);
            }
            this.method_6035();
            _loc3_ = class_397.var_912[this._ship.drones.const_1693.value];
            if (_loc3_ == null || Settings.show2DFormation.value) {
                _loc3_ = class_397.var_63[this._ship.drones.const_1693.value];
            }
            for each(_loc4_ in _loc3_.rotationGroups) {
                _loc5_ = new class_1752();
                for each(_loc6_ in _loc4_.droneIds) {
                    if (_loc6_ - 1 < this.var_669.length) {
                        (this.var_669[_loc6_ - 1] as class_2653).var_2364 = _loc5_;
                        (this.var_669[_loc6_ - 1] as class_2653).var_3298 = _loc4_.rotation;
                        this.var_2466.addChild(this.var_669[_loc6_ - 1]);
                    }
                }
                _loc7_ = class_2564.parse(_loc4_.method_4465);
                this.var_53 = new class_2563(_loc7_, _loc5_);
                this.var_53.start();
            }
            this.addListeners();
            this.updateObj(0);
        } else {
            this.method_64();
        }
    }

    private function method_2166(param1: Number, param2: Number): Number {
        var _loc3_: Number = (param2 - param1) % 360;
        if (_loc3_ != _loc3_ % 180) {
            _loc3_ = _loc3_ < 0 ? _loc3_ + 360 : _loc3_ - 360;
        }
        return _loc3_;
    }

    public function get drones(): Vector.<class_2653> {
        return this.var_669;
    }
}
}
