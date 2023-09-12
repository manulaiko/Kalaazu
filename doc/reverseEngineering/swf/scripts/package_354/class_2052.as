package package_354 {

import com.greensock.TweenMax;

import flash.display.Sprite;

import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_286.class_2019;

import package_35.class_348;

public class class_2052 extends class_2019 {


    private var _tween: TweenMax;

    public function class_2052(param1: class_1206, param2: class_348) {
        super(param1, param2);
    }

    override protected function method_30(): void {
        var _loc1_: Sprite = method_5878;
        if (_loc1_ != null) {
            this._tween = TweenMax.to(_loc1_, 0.5, {
                "yoyo": true,
                "repeat": -1,
                "glowFilter": {
                    "color": 16711680,
                    "alpha": 1,
                    "blurX": 60,
                    "blurY": 60
                }
            });
        }
    }

    override public function disposeView(param1: Boolean = false): void {
        if (this._tween != null) {
            this._tween.kill();
            this._tween = null;
        }
        var _loc2_: Sprite = method_5878;
        if (_loc2_ != null) {
            _loc2_.filters = null;
        }
        super.disposeView(param1);
    }
}
}
