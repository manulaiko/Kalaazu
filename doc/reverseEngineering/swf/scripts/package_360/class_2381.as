package package_360 {

import com.greensock.TweenLite;
import com.greensock.easing.Linear;
import com.greensock.plugins.FramePlugin;
import com.greensock.plugins.ShortRotationPlugin;
import com.greensock.plugins.TweenPlugin;

import flash.display.MovieClip;
import flash.display.Sprite;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.mvc.common.AssetNotifications;

import package_10.class_314;

import package_11.class_39;

import package_17.class_62;

import package_19.class_70;

import package_76.class_215;

import package_9.ResourceManager;

import package_99.class_266;

public class class_2381 extends Sprite implements IDisposable {

    {
        TweenPlugin.activate([FramePlugin]);
        TweenPlugin.activate([ShortRotationPlugin]);
    }

    public const changed: class_70 = new class_70();

    public const loaded: class_70 = new class_70();

    private var var_1788: class_314;

    private var _resKey: String;

    private var var_4143: String;

    private var var_500: MovieClip;

    private var _loop: Boolean;

    private var var_1179: Boolean = true;

    private var var_3285: Number = 0;

    private var var_4864: String;

    private var var_3599: String;

    public function class_2381(param1: MovieClip = null, param2: class_314 = null) {
        super();
        if (param1 != null) {
            this.clip = param1;
        }
        this.method_2447 = param2;
    }

    public function disposeView(param1: Boolean = false): void {
        this.method_2447 = null;
        this.clip = null;
    }

    public function set method_2447(param1: class_314): void {
        if (this.var_1788) {
            this.var_1788.changed.remove(this.method_1382);
        }
        this.var_1788 = param1;
        if (this.var_1788) {
            this.var_1788.changed.add(this.method_1382);
            if (this.var_1788) {
                this.clipRotation = this.var_1788.degrees;
            }
        }
    }

    public function method_2622(param1: String, param2: String): void {
        if (this.var_4864) {
            ResourceManager.name_15.method_2379(this.var_4864, this.method_2183);
        }
        if (this._resKey) {
            ResourceManager.name_15.method_2379(this._resKey, this.method_2414);
        }
        this._resKey = null;
        this.var_4143 = null;
        this.var_4864 = param1;
        this.var_3599 = param2;
        ResourceManager.name_15.load(this.var_4864, this.method_2183);
    }

    public function load(param1: String, param2: String, param3: Boolean = true, param4: Boolean = false): void {
        if (this._resKey != param1 || this.var_4143 != param2) {
            if (this._resKey) {
                ResourceManager.name_15.method_2379(this._resKey, this.method_2414);
            }
            this._resKey = param1;
            this.var_4143 = param2;
            this.var_1179 = param3;
            this._loop = param4;
            ResourceManager.name_15.load(param1, this.method_2414);
        } else {
            this.clip = this.clip;
        }
    }

    public function set clipRotation(param1: Number): void {
        var _loc2_: int = 0;
        if (this.var_500 == null) {
            return;
        }
        param1 = Number(class_266.method_2692(param1));
        this.var_3285 = param1;
        if (this.var_500.framesLoaded > 1) {
            rotation = 0;
            _loc2_ = int((32 * Number(this.var_3285) / 360 + 0.5) % 32 + 1);
            this.var_500.gotoAndStop(_loc2_ % Number(this.var_500.totalFrames));
        } else if (Boolean(this.var_1179) && !this._loop) {
            rotation = this.var_3285;
        }
        this.changed.dispatch();
    }

    public function get clipRotation(): Number {
        return this.var_3285;
    }

    public function get clip(): MovieClip {
        return this.var_500;
    }

    public function set clip(param1: MovieClip): void {
        if (this.var_500) {
            class_215.stopAnimation(this.var_500);
            class_215.removeDisplayObject(this.var_500);
        }
        TweenLite.killTweensOf(this);
        this.var_500 = param1;
        rotation = 0;
        if (this.var_500) {
            this.var_500.gotoAndStop(1);
            if (!this.var_500.parent) {
                addChild(this.var_500);
            }
            this.method_227();
            this.loaded.dispatch();
        }
        this.changed.dispatch();
    }

    private function method_227(): void {
        if (this.var_500) {
            class_215.stopAnimation(this.var_500);
            if (this._loop) {
                class_215.method_6420(this.var_500, 30, true);
            } else if (this.var_1788) {
                this.clipRotation = this.var_1788.degrees;
            }
        }
    }

    public function cleanup(): void {
        this.clip = null;
        this.method_2447 = null;
        TweenLite.killTweensOf(this);
    }

    private function method_2183(param1: class_39): void {
        this.clip = MovieClip(param1.getEmbeddedMovieClip(this.var_3599));
    }

    private function method_2414(param1: class_39): void {
        if (this.var_4864) {
            ResourceManager.name_15.method_2379(this.var_4864, this.method_2183);
        }
        this.clip = MovieClip(param1.getEmbeddedMovieClip(this.var_4143));
        class_62.getInstance().method_2407(AssetNotifications.ADD_UNLOAD_FINISHER, param1);
    }

    private function method_1382(): void {
        if (this.var_500 != null && this.var_1788 && this.var_1179 && !this._loop) {
            TweenLite.to(this, 0.1, {
                "shortRotation": {"clipRotation": this.var_1788.degrees},
                "ease": Linear.easeNone
            });
        }
    }

    public function set rotatable(param1: Boolean): void {
        this.var_1179 = param1;
        this.method_1382();
    }

    public function set loop(param1: Boolean): void {
        this._loop = param1;
        this.method_227();
    }

    public function reset(): void {
        if (this._resKey) {
            ResourceManager.name_15.method_2379(this._resKey, this.method_2414);
        }
        this.var_4143 = null;
        this._resKey = null;
        this.clip = null;
    }
}
}
