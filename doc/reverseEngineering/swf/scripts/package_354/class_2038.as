package package_354 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;
import com.greensock.TweenMax;

import flash.display.MovieClip;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_27.class_82;

import package_286.class_2019;

import package_35.class_348;

import package_76.class_215;

import package_9.ResourceManager;

public class class_2038 extends class_2019 {


    private var var_1632: Number = 7;

    private var var_3303: Number = 0.1;

    private var var_527: Number = 0;

    private var var_2910: Number = 0.2;

    public function class_2038(param1: class_1206, param2: class_348) {
        super(param1, param2);
    }

    override protected function method_30(): void {
        var_1714 = ResourceManager.getMovieClip("shockwaves", "drawFireVortex");
        addChild(var_1714);
        method_2332(var_1714, false);
        this.method_3400();
        TweenMax.delayedCall(0.1, this.method_3400);
        TweenMax.delayedCall(0.2, this.method_3400);
        method_6420();
        var _loc1_: class_73 = (effect as class_348).source.position;
        class_82.playSoundEffect(class_126.const_974, false, false, _loc1_.x, _loc1_.y);
    }

    private function method_3400(): void {
        var _loc1_: * = null;
        _loc1_ = ResourceManager.getMovieClip("shockwaves", "drawFireRing");
        _loc1_.scaleX = this.var_1632;
        _loc1_.scaleY = this.var_1632;
        _loc1_.alpha = this.var_527;
        var_1714.addChild(_loc1_);
        TweenLite.to(_loc1_, 2.5, {
            "scaleX": this.var_3303,
            "scaleY": this.var_3303,
            "alpha": this.var_2910,
            "onComplete": class_215.removeDisplayObject,
            "onCompleteParams": [_loc1_]
        });
        TweenLite.delayedCall(1, this.method_3400);
    }

    override public function disposeView(param1: Boolean = false): void {
        TweenMax.killDelayedCallsTo(this.method_3400);
        super.disposeView(param1);
    }
}
}
