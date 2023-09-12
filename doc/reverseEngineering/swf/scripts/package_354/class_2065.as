package package_354 {

import com.greensock.TweenMax;

import flash.filters.GlowFilter;

import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_129.class_372;

import package_286.class_2019;

public class class_2065 extends class_2019 {


    private var _tween: TweenMax;

    public function class_2065(param1: class_1206, param2: class_372) {
        super(param1, param2);
        if (Boolean(method_5878) && Boolean(param2.method_5518)) {
            this.startTween();
        }
    }

    override public function disposeView(param1: Boolean = false): void {
        if (this._tween != null) {
            this._tween.kill();
            this._tween = null;
        }
        if (method_5878) {
            method_5878.filters = null;
        }
        super.disposeView(param1);
    }

    private function get method_1874(): class_372 {
        return effect as class_372;
    }

    private function startTween(): void {
        if (this.method_1874.color == 0) {
            method_5878.filters = [new GlowFilter(this.method_1874.color, 0.9, this.method_1874.method_1784, this.method_1874.method_1784)];
        } else {
            this._tween = TweenMax.to(method_5878, 0, {
                "yoyo": false,
                "repeat": 1,
                "glowFilter": {
                    "color": this.method_1874.color,
                    "alpha": 0.9,
                    "blurX": this.method_1874.method_1784,
                    "blurY": this.method_1874.method_1784
                }
            });
        }
    }
}
}
