package package_354 {

import com.greensock.TweenLite;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_27.class_82;

import package_286.class_2019;

import package_75.class_370;

public class class_2037 extends class_2019 {


    public function class_2037(param1: class_1206, param2: class_370) {
        super(param1, param2, true, true, true);
    }

    override protected function method_30(): void {
        this.fps = 25;
        method_6420(true, 1, false);
        class_82.playSoundEffect(class_126.const_2157);
        clip.alpha = 0;
        TweenLite.to(clip, 0.25, {
            "alpha": 1,
            "onComplete": this.method_1670
        });
    }

    override public function disposeView(param1: Boolean = false): void {
        TweenLite.killTweensOf(clip);
        TweenLite.killDelayedCallsTo(this.method_6511);
        TweenLite.killDelayedCallsTo(this.method_30);
        super.disposeView(param1);
    }

    private function method_1670(): void {
        TweenLite.delayedCall(2, this.method_6511);
    }

    private function method_6511(): void {
        TweenLite.to(clip, 0.75, {
            "alpha": 0,
            "onComplete": this.method_2305
        });
    }

    private function method_2305(): void {
        var _loc1_: class_370 = effect as class_370;
        if (_loc1_.method_1664) {
            TweenLite.delayedCall(_loc1_.name_114 + Math.random() * (Number(_loc1_.name_88) - Number(_loc1_.name_114)), this.method_30);
        } else {
            this.disposeView();
        }
    }
}
}
