package package_423 {

import com.greensock.TweenLite;
import com.greensock.TweenMax;

import flash.display.MovieClip;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.ship.class_1859;

import package_360.class_2084;
import package_360.class_2381;

public class class_2379 implements IDisposable {


    private var var_176: class_1859;

    private var var_127: class_2084;

    private var var_477: Number;

    private var var_1085: int = 1;

    private var var_1646: class_2381;

    private var var_3092: class_2381;

    public function class_2379(param1: class_1859, param2: class_2084) {
        super();
        this.var_127 = param2;
        this.var_176 = param1;
        this.var_127.base.loaded.add(this.init);
    }

    public function method_1451(): void {
        if (this.var_127.base.clip != null) {
            this.var_1646.clip.stop();
            this.var_3092.clip.stop();
        }
    }

    public function method_4635(): void {
        if (this.var_127.base.clip != null) {
            if (this.var_1085 == 0) {
                TweenLite.to(this.var_1646.clip, this.var_176.method_894, {
                    "colorTransform": {
                        "tint": this.var_176.method_1353,
                        "tintAmount": this.var_176.tintAmount
                    }
                });
                TweenLite.to(this.var_1646.clip, this.var_176.method_894, {
                    "glowFilter": {
                        "color": this.var_176.method_1353,
                        "blurX": this.var_176.method_3525,
                        "blurY": this.var_176.method_1940,
                        "strength": this.var_176.glowStrength,
                        "alpha": this.var_176.method_2372
                    }
                });
                TweenLite.to(this.var_3092.clip, this.var_176.method_894, {
                    "colorTransform": {
                        "tint": this.var_176.method_6201,
                        "tintAmount": this.var_176.tintAmount
                    }
                });
                TweenLite.to(this.var_3092.clip, this.var_176.method_894, {
                    "glowFilter": {
                        "color": this.var_176.method_6201,
                        "blurX": this.var_176.method_3525,
                        "blurY": this.var_176.method_1940,
                        "strength": this.var_176.glowStrength,
                        "alpha": this.var_176.method_2372
                    }
                });
                this.var_1085 = 1;
            } else if (this.var_1085 == 1) {
                TweenLite.to(this.var_3092.clip, this.var_176.method_894, {
                    "colorTransform": {
                        "tint": this.var_176.method_1353,
                        "tintAmount": this.var_176.tintAmount
                    }
                });
                TweenLite.to(this.var_3092.clip, this.var_176.method_894, {
                    "glowFilter": {
                        "color": this.var_176.method_1353,
                        "blurX": this.var_176.method_3525,
                        "blurY": this.var_176.method_1940,
                        "strength": this.var_176.glowStrength,
                        "alpha": this.var_176.method_2372
                    }
                });
                TweenLite.to(this.var_1646.clip, this.var_176.method_894, {
                    "colorTransform": {
                        "tint": this.var_176.method_6201,
                        "tintAmount": this.var_176.tintAmount
                    }
                });
                TweenLite.to(this.var_1646.clip, this.var_176.method_894, {
                    "glowFilter": {
                        "color": this.var_176.method_6201,
                        "blurX": this.var_176.method_3525,
                        "blurY": this.var_176.method_1940,
                        "strength": this.var_176.glowStrength,
                        "alpha": this.var_176.method_2372
                    }
                });
                this.var_1085 = 0;
            }
        }
        TweenMax.delayedCall(this.var_176.method_3723, this.method_4635);
    }

    private function init(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.var_127.base.clip) {
            if (!this.var_1646) {
                this.var_1646 = new class_2381();
            }
            _loc1_ = this.var_127.base.clip.light1;
            if (_loc1_) {
                _loc1_.stop();
                this.var_1646.loop = false;
                this.var_1646.rotatable = true;
                this.var_1646.clip = _loc1_;
                this.var_1646.method_2447 = this.var_127.ship.rotation;
            }
            if (!this.var_3092) {
                this.var_3092 = new class_2381();
            }
            _loc2_ = this.var_127.base.clip.light2;
            if (_loc2_) {
                _loc2_.stop();
                this.var_3092.loop = false;
                this.var_3092.rotatable = true;
                this.var_3092.clip = _loc2_;
                this.var_3092.method_2447 = this.var_127.ship.rotation;
            }
            this.method_1451();
            this.method_4635();
        }
    }

    public function disposeView(param1: Boolean = false): void {
        if (this.var_1646.clip) {
            TweenLite.killTweensOf(this.var_1646.clip);
        }
        if (this.var_3092.clip) {
            TweenLite.killTweensOf(this.var_3092.clip);
        }
        TweenMax.killDelayedCallsTo(this.method_4635);
    }
}
}
