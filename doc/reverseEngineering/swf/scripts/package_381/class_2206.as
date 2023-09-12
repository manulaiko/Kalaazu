package package_381 {

import com.greensock.TweenMax;

import flash.media.SoundChannel;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_27.class_82;

import package_75.class_1482;

public class class_2206 implements IDisposable {


    private var _effect: class_1482;

    private var var_419: TweenMax;

    private var var_168: Boolean = false;

    private var var_389: SoundChannel;

    public function class_2206(param1: class_1211, param2: class_1482) {
        super();
        this._effect = param2;
        this.ship.const_1925.value = true;
        this.ship.name_39.add(this.name_39);
        this.ship.name_21.add(this.method_9);
        if (this._effect.method_668) {
            this.var_419 = TweenMax.to(this._effect.source.position, 0.075, {
                "z": 4,
                "repeat": -1,
                "yoyo": true
            });
        }
        if (!this.ship.method_6406) {
            this.method_9();
        }
    }

    private function method_9(): void {
        if (this._effect.method_668) {
            this.var_419.pause();
        }
        if (this.var_389 != null) {
            class_82.method_401(this.var_389, true);
            this.var_389 = null;
        }
    }

    private function name_39(): void {
        var _loc1_: int = 0;
        if (this._effect.method_668) {
            this.var_419.resume();
        }
        if (!this.var_168 && Boolean(this.ship.method_6225())) {
            class_82.playSoundEffect(class_126.const_367, false, false, this.ship.position.x, this.ship.position.y);
            this.var_168 = true;
        }
        if (this.var_389 == null && Boolean(this.ship.method_6225())) {
            _loc1_ = -1;
            if (this.ship.shipPattern.getPatternID() == "69") {
                _loc1_ = 0;
            } else if (this.ship.shipPattern.getPatternID() == "18") {
                _loc1_ = 0;
            }
            if (_loc1_ != -1) {
                this.var_389 = class_82.playSoundEffect(_loc1_, true, true);
            }
        }
    }

    public function disposeView(param1: Boolean = false): void {
        if (this._effect.method_668) {
            this.var_419.restart();
            this.var_419.kill();
        }
        this.ship.name_39.remove(this.name_39);
        this.ship.name_21.remove(this.method_9);
        this.ship.const_1925.value = false;
    }

    private function get ship(): class_86 {
        return this._effect.source as class_86;
    }
}
}
