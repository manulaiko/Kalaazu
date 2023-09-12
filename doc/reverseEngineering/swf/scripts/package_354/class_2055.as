package package_354 {

import com.greensock.TweenLite;
import com.greensock.TweenMax;

import flash.display.MovieClip;

import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_11.class_39;

import package_286.class_2019;

import package_35.class_348;

import package_76.class_215;

import package_9.ResourceManager;

public class class_2055 extends class_2019 {


    private var var_1249: MovieClip;

    private var var_4117: MovieClip;

    public function class_2055(param1: class_1206, param2: class_348) {
        super(param1, param2);
    }

    override protected function method_30(): void {
        method_6420();
        ResourceManager.name_15.load("shockwaves", this.method_297);
        scaleX = 0.3;
        scaleY = 0.3;
        TweenLite.to(this, 2.5, {
            "scaleX": 1,
            "scaleY": 1
        });
        TweenLite.delayedCall(2.5, this.method_1049);
    }

    private function method_297(param1: class_39): void {
        if (method_5878) {
            this.var_4117 = param1.getEmbeddedMovieClip("blitz");
            this.var_1249 = param1.getEmbeddedMovieClip("shockringUltimate");
            addChild(this.var_4117);
        }
    }

    private function method_1049(): void {
        stopAnimation(false);
        if (this.var_1249) {
            this.var_1249.scaleX = 0.1;
            this.var_1249.scaleY = 0.1;
            addChild(this.var_1249);
            TweenLite.to(this.var_1249, 0.6, {
                "scaleX": 3,
                "scaleY": 3,
                "alpha": 0
            });
        }
        clip.cacheAsBitmap = true;
        TweenLite.to(clip, 0.6, {
            "scaleX": 3,
            "scaleY": 3
        });
        TweenLite.to(method_5878, 0.6, {
            "autoAlpha": 0,
            "onComplete": this.method_1926
        });
    }

    private function method_1926(): void {
        TweenLite.killTweensOf(this.var_1249);
        TweenLite.killTweensOf(clip);
        TweenLite.killTweensOf(method_5878);
        TweenLite.killTweensOf(this);
    }

    override public function disposeView(param1: Boolean = false): void {
        TweenMax.killTweensOf(method_5878);
        TweenMax.killDelayedCallsTo(this.method_1049);
        method_5878.alpha = 1;
        method_5878.visible = true;
        if (this.var_1249) {
            TweenMax.killTweensOf(this.var_1249);
            TweenMax.killDelayedCallsTo(this.var_1249);
        }
        class_215.removeDisplayObject(this.var_4117);
        class_215.removeDisplayObject(this.var_1249);
        super.disposeView(param1);
    }
}
}
