package package_354 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;

import flash.display.MovieClip;
import flash.media.SoundChannel;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_27.class_82;

import package_286.class_2019;

import package_75.class_1891;

import package_76.class_215;

import package_9.ResourceManager;

public class class_2020 extends class_2019 {


    private var var_1632: Number = 0.1;

    private var var_3303: Number = 5;

    private var var_527: Number = 0.3;

    private var var_2910: Number = 0;

    private var var_385: SoundChannel = null;

    public function class_2020(param1: class_1206, param2: class_1891) {
        super(param1, param2);
    }

    override protected function method_30(): void {
        var_1714 = new MovieClip();
        addChild(var_1714);
        method_2332(var_1714, false);
        this.method_1057(0);
        method_6420();
        var _loc1_: class_73 = class_1891(effect).source.position;
        this.var_385 = class_82.playSoundEffect(class_126.const_2773, true, false, _loc1_.x, _loc1_.y);
    }

    private function method_1057(param1: int): void {
        var _loc2_: * = null;
        _loc2_ = ResourceManager.getMovieClip("shockwaves", "shockring0");
        _loc2_.scaleX = this.var_1632;
        _loc2_.scaleY = this.var_1632;
        _loc2_.alpha = this.var_527;
        var_1714.addChild(_loc2_);
        TweenLite.to(_loc2_, 1.5, {
            "scaleX": this.var_3303,
            "scaleY": this.var_3303,
            "alpha": this.var_2910,
            "onComplete": class_215.removeDisplayObject,
            "onCompleteParams": [_loc2_]
        });
        TweenLite.delayedCall(2, this.method_1057, [param1 + 1]);
    }

    override public function disposeView(param1: Boolean = false): void {
        if (this.var_385 != null) {
            class_82.method_401(this.var_385);
            this.var_385 = null;
        }
        TweenLite.killDelayedCallsTo(this.method_1057);
        super.disposeView(param1);
    }
}
}
