package package_354 {

import com.greensock.TweenLite;
import com.greensock.TweenNano;

import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.media.SoundChannel;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.traits.class_309;
import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_11.class_39;

import package_14.class_52;

import package_27.class_82;

import package_360.class_2084;

import package_75.class_1862;

import package_9.ResourceManager;
import package_9.class_50;

public class class_2018 implements IDisposable, class_52 {

    private static var var_1232: SoundChannel = null;

    private static const DATA: Object = {};

    {
        DATA[class_1862.NORMAL] = {
            "libId": "stickyBomb",
            "warmUpDuration": 9
        };
        DATA[class_1862.const_1782] = {
            "libId": "emperorStickyBomb",
            "warmUpDuration": 7
        };
    }

    private const const_411: int = 4;

    private var _mapView: class_1206;

    private var _effect: class_1862;

    private var var_1499: MovieClip;

    private var var_2430: Sprite;

    private var _light: Bitmap;

    private var var_373: MovieClip;

    private var var_510: int = -1;

    private var _libId: String;

    private var var_656: Number;

    private var var_267: int = 5;

    public function class_2018(param1: class_1206, param2: class_1862) {
        super();
        this._mapView = param1;
        this._effect = param2;
        this._libId = DATA[param2.method_4766].libId;
        this.var_656 = DATA[param2.method_4766].warmUpDuration;
        if (param2.source != null) {
            this.method_1220();
        } else {
            this.method_2739();
        }
    }

    private function get method_3237(): class_1862 {
        return this._effect as class_1862;
    }

    public function disposeView(param1: Boolean = false): void {
        this.method_4036();
        this.method_940();
    }

    private function method_940(): void {
        if (var_1232) {
            class_82.method_401(var_1232);
        }
        if (this.var_2430) {
            if (this.var_2430.parent) {
                this.var_2430.parent.removeChild(this.var_2430);
            }
            this.var_2430 = null;
        }
        TweenNano.killTweensOf(this.method_3155);
        TweenNano.killTweensOf(this.method_1905);
        TweenNano.killTweensOf(this.method_2463);
        class_50.removeObserver(this);
    }

    public function updateTimer(param1: Number): void {
        if (Boolean(this.var_373) && Boolean(this.method_2261)) {
            this.var_373.gotoAndStop(Number(this.method_2261.base.clip.currentFrame) % 4 + 1);
        }
    }

    private function get method_2261(): class_2084 {
        return this._mapView.method_5826.method_6501(this.method_3237.source.method_1954(class_309)) as class_2084;
    }

    private function method_1220(): void {
        ResourceManager.name_15.load(this._libId, this.method_1856);
    }

    private function method_4036(): void {
        if (this.var_1499) {
            TweenLite.killTweensOf(this.var_1499);
            if (this.var_1499.parent) {
                this.var_1499.parent.removeChild(this.var_1499);
            }
            this.var_1499 = null;
        }
    }

    private function method_1856(param1: class_39): void {
        if (param1 == null || this.method_3237.method_4676 == null) {
            this.disposeView();
        } else {
            this.var_1499 = param1.getEmbeddedMovieClip("flying_mc");
            this.var_1499.x = this.method_3237.method_4676.x;
            this.var_1499.y = this.method_3237.method_4676.y;
            this.method_4235();
            this._mapView.fxLayer.addChild(this.var_1499);
            TweenLite.to(this.var_1499, 1, {
                "dynamicProps": {
                    "x": this.method_38,
                    "y": this.method_1584
                },
                "onUpdate": this.method_4235,
                "onComplete": this.method_829
            });
        }
    }

    private function method_829(): void {
        this.method_4036();
        this.method_2739();
    }

    private function method_38(): int {
        return this.method_3237.method_5963.x;
    }

    private function method_1584(): int {
        return this.method_3237.method_5963.y;
    }

    private function method_4235(): void {
        var _loc1_: Number = Math.atan2(Number(this.method_3237.method_5963.y) - Number(this.var_1499.y), Number(this.method_3237.method_5963.x) - Number(this.var_1499.x)) * 180 / 0 + 180;
        var _loc2_: int = _loc1_ % 360;
        while (_loc2_ < 0) {
            _loc2_ = 360 + _loc2_;
        }
        this.var_1499.gotoAndStop(int((32 * _loc2_ / 360 + 0.5) % 32 + 1));
    }

    private function method_2739(): void {
        ResourceManager.name_15.load(this._libId, this.method_6516);
    }

    private function method_6516(param1: class_39): void {
        this.var_2430 = new Sprite();
        if (this.method_2261) {
            this.method_2261.addChild(this.var_2430);
            this._light = param1.getEmbeddedBitmap("light");
            this._light.x = -0.5 * Number(this._light.width);
            this._light.y = -0.5 * Number(this._light.height);
            this._light.visible = false;
            this.var_2430.addChild(this._light);
            this.var_373 = param1.getEmbeddedMovieClip("rotating_mc");
            this.var_373.gotoAndStop(1);
            this.var_2430.addChild(this.var_373);
            this.var_510 = this.var_656;
            this.var_267 = 5;
            this.method_1905();
            TweenNano.delayedCall(1, this.method_3155);
        } else {
            this.disposeView();
        }
    }

    private function method_3155(): void {
        if (this.var_510-- > 0) {
            ++this.var_267;
            TweenNano.delayedCall(1, this.method_3155);
        }
    }

    private function method_1905(): void {
        this.var_373.gotoAndStop(this.var_373.currentFrame + 1);
        if (this.var_373.currentFrame == 4) {
            this.var_373.gotoAndStop(1);
            this.var_2430.addChild(this.var_373);
            this.var_2430.addChild(this._light);
            class_50.method_5621(this);
            this.var_267 = 1;
            this.method_2463();
        } else {
            TweenNano.delayedCall(1 / Number(this.var_267), this.method_1905);
        }
    }

    private function method_2463(): void {
        this._light.visible = !this._light.visible;
        if (this._light.visible) {
            class_82.playSoundEffect(class_126.const_2025);
        }
        if (this.var_510 <= 1) {
            this._light.visible = true;
            if (var_1232) {
                class_82.method_401(var_1232);
            }
            var_1232 = class_82.playSoundEffect(class_126.const_2025, true);
            return;
        }
        TweenNano.delayedCall(1 / Number(this.var_267), this.method_2463);
    }
}
}
