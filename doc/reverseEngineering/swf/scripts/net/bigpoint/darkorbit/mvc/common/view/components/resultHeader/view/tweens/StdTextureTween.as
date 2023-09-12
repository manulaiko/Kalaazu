package net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens {

import com.greensock.TweenMax;

import mx.core.IUIComponent;

import spark.filters.BlurFilter;

public class StdTextureTween implements IUIComponentTween {


    private var _comp: IUIComponent;

    private var blurFilter: BlurFilter;

    public function StdTextureTween() {
        super();
    }

    public function execute(param1: IUIComponent): void {
        TweenMax.killTweensOf(param1, true);
        this._comp = param1;
        this.blurFilter = new BlurFilter();
        this.blurFilter.blurX = 0;
        this.blurFilter.blurY = 32;
        this._comp.filters = [this.blurFilter];
        this._comp.alpha = 0;
        TweenMax.delayedCall(0.5, this.tweenTextureOut, [param1]);
    }

    private function tweenTextureOut(param1: IUIComponent): void {
        param1.y = param1.height;
        TweenMax.to(param1, 3, {
            "alpha": 1,
            "y": 0,
            "onComplete": this.tweenTextureIn,
            "onCompleteParams": [param1]
        });
    }

    private function tweenTextureIn(param1: IUIComponent): void {
        TweenMax.to(this.blurFilter, 1, {
            "blurY": 0,
            "onComplete": this.removeFilter,
            "onCompleteParams": [param1]
        });
    }

    private function removeFilter(param1: IUIComponent): void {
        TweenMax.killTweensOf(this.blurFilter);
        param1.filters = [];
    }

    public function destruct(): void {
        TweenMax.killDelayedCallsTo(this.tweenTextureOut);
        TweenMax.killTweensOf(this._comp);
        TweenMax.killTweensOf(this.blurFilter);
        this.blurFilter = null;
    }
}
}
