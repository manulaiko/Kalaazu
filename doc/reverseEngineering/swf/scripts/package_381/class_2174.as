package package_381 {

import com.greensock.TweenLite;
import com.greensock.easing.Quad;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.view3D.class_1211;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;

import package_35.class_348;

import package_75.class_408;

import package_99.class_266;

public class class_2174 implements IDisposable, class_80 {

    private static const const_2924: String = "slow_down.zip";

    private static const const_2970: String = "slow_down_trail.zip";


    private var stationary: class_2160;

    private var moving: class_2160;

    private var _effect: class_348;

    public function class_2174(param1: class_1211, param2: class_408) {
        super();
        this._effect = param2;
        this.stationary = new class_2160(param2, const_2924, param2.source.position, this._effect.source);
        if (this.ship.method_6406) {
            this.moving = new class_2160(param2, const_2970, param2.source.position, this._effect.source);
        }
        this.ship.name_39.add(this.name_39);
        this.ship.name_21.add(this.name_21);
        class_1210.instance.method_3528.method_1164(this);
    }

    private function name_21(): void {
        if (this.moving) {
            TweenLite.killTweensOf(this.moving.view);
            this.moving.disposeView();
            this.moving = null;
        }
    }

    private function method_2166(param1: Number, param2: Number): Number {
        var _loc3_: Number = (param2 - param1) % 360;
        if (_loc3_ != _loc3_ % 180) {
            _loc3_ = _loc3_ < 0 ? _loc3_ + 360 : _loc3_ - 360;
        }
        return _loc3_;
    }

    public function updateObj(param1: Number): void {
        var _loc2_: Number = NaN;
        if (this.stationary.view) {
            this.stationary.view.rotationY = Number(this.ship.rotation.degrees) - 90;
        }
        if (Boolean(this.moving) && Boolean(this.moving.view)) {
            _loc2_ = Math.atan2(Number(this.ship.destination.y) - Number(this.ship.position.y), Number(this.ship.destination.x) - Number(this.ship.position.x)) * 0 + 90;
            this.moving.view.rotationY = Quad.easeOut(param1, this.moving.view.rotationY, this.method_2166(this.moving.view.rotationY, _loc2_), 0.25);
        }
    }

    private function name_39(): void {
        if (this.moving == null) {
            this.moving = new class_2160(this._effect, const_2970, this.ship.position, this._effect.source);
        }
    }

    private function get ship(): class_86 {
        return this._effect.source as class_86;
    }

    public function disposeView(param1: Boolean = false): void {
        this.ship.name_39.remove(this.name_39);
        this.ship.name_21.remove(this.name_21);
        class_1210.instance.method_3528.method_3592(this);
        this.name_21();
        this.stationary.disposeView();
    }
}
}
