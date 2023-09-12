package net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens {

import com.greensock.TweenMax;

import mx.core.IUIComponent;

public class StdOverLayTween implements IUIComponentTween {


    private var _comp: IUIComponent;

    public function StdOverLayTween() {
        super();
    }

    public function execute(param1: IUIComponent): void {
        TweenMax.killTweensOf(param1, true);
        this._comp = param1;
        param1.alpha = 1;
        TweenMax.delayedCall(0.5, this.tweenPlay, [param1]);
    }

    private function tweenPlay(param1: IUIComponent): void {
        TweenMax.to(param1, 1, {
            "delay": 0.5,
            "x": param1.parent.width,
            "onComplete": this.reverseTween,
            "onCompleteParams": [param1]
        });
    }

    private function reverseTween(param1: IUIComponent): void {
        param1.x = -Number(param1.width);
        this.tweenPlay(param1);
    }

    public function destruct(): void {
        TweenMax.killTweensOf(this._comp, true);
    }
}
}
