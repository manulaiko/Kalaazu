package package_357 {

import com.greensock.TweenMax;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.model.traits.class_287;
import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.map.view2D.class_1206;
import net.bigpoint.darkorbit.settings.Settings;

import package_22.class_1090;
import package_22.class_198;
import package_22.class_426;

import package_27.class_82;

import package_36.class_425;

import package_75.class_349;

import package_9.class_50;

public class class_2059 {


    private var _effect: class_425;

    public function class_2059(param1: class_1206, param2: class_425) {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        super();
        this._effect = param2;
        if (this._effect.attacker != null && this._effect.target != null) {
            _loc3_ = int(class_299(this._effect.attacker.method_1954(class_299)).rocketLauncher.rocketClassId);
            _loc4_ = class_198.method_4446(_loc3_, this._effect.name_106) || class_198.method_4446(0, 1);
            class_82.playSoundEffect(_loc4_.method_3142(), false, false, this._effect.attacker.position.x, this._effect.attacker.position.y);
            class_82.playSoundEffect(class_126.const_1493, false, false, this._effect.attacker.position.x, this._effect.attacker.position.y);
            _loc5_ = class_198.var_4122[0];
            _loc6_ = 0;
            _loc7_ = 0;
            while (_loc7_ < this._effect.method_2523) {
                _loc8_ = new class_2356(this._effect.attacker.method_1954(class_299) as class_299, this._effect.target.method_1954(class_287) as class_287, true, _loc4_, _loc5_, false, true, 0.5 * _loc7_ / Number(param2.method_2523));
                param1.fxLayer.addChild(_loc8_);
                _loc6_ = Math.max(_loc6_, _loc8_.duration);
                _loc7_++;
            }
            if (this._effect.method_1885) {
                TweenMax.delayedCall(_loc6_, this.method_5854);
            }
        }
    }

    public function method_5854(): void {
        if (false) {
            class_50.getInstance().map.effects.method_5084(new class_349(this._effect.target, 0));
        }
    }
}
}
