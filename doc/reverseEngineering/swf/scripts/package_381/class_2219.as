package package_381 {

import com.greensock.TweenLite;
import com.greensock.easing.Quad;

import flash.geom.Vector3D;
import flash.media.SoundChannel;
import flash.utils.Timer;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.map.view3D.class_1211;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_27.class_82;

import package_295.class_1752;

import package_373.class_2134;
import package_373.class_2456;

import package_75.class_1862;

public class class_2219 implements IDisposable {

    private static var var_1232: SoundChannel = null;


    private var _uberAsset: class_2134;

    private var _effect: class_1862;

    private var _timer: Timer;

    private var var_1913: String;

    private var var_510: int = -1;

    private var var_656: Number;

    private var var_267: int = 5;

    private var var_2311: Boolean = false;

    private var var_292: class_1752;

    public function class_2219(param1: class_1211, param2: class_1862) {
        super();
        this._effect = param2;
        if (param2.method_4766 == class_1862.NORMAL) {
            this.var_1913 = "stickybomb";
            this.var_656 = 9;
        } else if (param2.method_4766 == class_1862.const_1782) {
            this.var_1913 = "stickybomb-emperor";
            this.var_656 = 7;
        }
        this.var_292 = param1.method_3658.method_6501(param2.source.method_1954(class_306));
        if (param2.source != null) {
            this.method_1220();
        } else {
            this.method_2739();
        }
    }

    public function disposeView(param1: Boolean = false): void {
        this.method_4036();
        this.method_940();
    }

    private function method_1220(): void {
        this._uberAsset = new class_2134(UberAssetsLib.instance.getDescriptor(this.var_1913, UberAssetsLib.LIB_DEFAULT).display3D[0]);
        this.glow = 0;
        this._uberAsset.ready.add(this.method_4815);
    }

    private function method_2739(): void {
        if (this._uberAsset) {
            class_1210.instance.method_3528.method_1616.addChild(this._uberAsset);
            this._uberAsset.method_6420("open");
            this.var_510 = this.var_656;
            this.var_267 = 5;
            this.method_1905();
            TweenLite.delayedCall(1, this.method_3155);
        } else {
            this.disposeView();
        }
    }

    private function method_4815(): void {
        if (this._effect.method_4676 == null) {
            this.disposeView();
        } else {
            class_1210.instance.method_3528.method_1616.addChild(this._uberAsset);
            this._uberAsset.moveTo(this._effect.method_4676.method_1474, this._effect.method_4676.method_1121, this._effect.method_4676.method_6123);
            TweenLite.to(this._uberAsset, 0.5, {
                "dynamicProps": {
                    "x": this.method_38,
                    "z": this.method_3304
                },
                "onUpdate": this.update,
                "onComplete": this.method_829
            });
            TweenLite.to(this._uberAsset.method_3287[0], 0.25, {
                "delay": 0.25,
                "rotationZ": 0,
                "ease": Quad.easeInOut
            });
        }
    }

    private function update(): void {
        this._uberAsset.rotationY = this.getRotation();
    }

    private function method_1905(): void {
        if (this._uberAsset) {
            this.var_292.addChild(this._uberAsset);
            this._uberAsset.position = new Vector3D();
        }
        this.var_267 = 1;
        this.method_2463();
    }

    private function method_2463(): void {
        this.var_2311 = !this.var_2311;
        if (this.var_2311) {
            class_82.playSoundEffect(class_126.const_2025);
            this.glow = 2;
        } else {
            this.glow = 0;
        }
        if (this.var_510 <= 1) {
            this.glow = 2;
            this.var_2311 = true;
            if (var_1232) {
                class_82.method_401(var_1232);
            }
            var_1232 = class_82.playSoundEffect(class_126.const_2025, true);
            return;
        }
        TweenLite.delayedCall(1 / Number(this.var_267), this.method_2463);
    }

    private function set glow(param1: Number): void {
        var _loc2_: * = null;
        for each(_loc2_ in this._uberAsset.method_3287) {
            _loc2_.glow = param1;
        }
    }

    private function method_3155(): void {
        if (this.var_510-- > 0) {
            ++this.var_267;
            TweenLite.delayedCall(1, this.method_3155);
        }
    }

    private function method_38(): int {
        return this._effect.method_5963.method_1474;
    }

    private function method_3304(): int {
        return this._effect.method_5963.method_6123;
    }

    private function getRotation(): Number {
        var _loc1_: Number = Math.atan2(Number(this._uberAsset.x) - Number(this._effect.method_5963.method_1474), Number(this._uberAsset.z) - Number(this._effect.method_5963.method_6123)) * 180 / 0;
        return _loc1_ - 90;
    }

    private function method_4036(): void {
        TweenLite.killTweensOf(this._uberAsset);
    }

    private function method_940(): void {
        if (var_1232) {
            class_82.method_401(var_1232);
        }
        if (this._uberAsset) {
            if (this._uberAsset.parent) {
                this._uberAsset.parent.removeChild(this._uberAsset);
            }
            this._uberAsset = null;
        }
        TweenLite.killTweensOf(this.method_3155);
        TweenLite.killTweensOf(this.method_1905);
        TweenLite.killTweensOf(this.method_2463);
    }

    private function method_829(): void {
        this.method_4036();
        this.method_2739();
    }
}
}
