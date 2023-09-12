package net.bigpoint.darkorbit.mvc.gui.highlights.view {

import com.greensock.TweenMax;

import flash.display.DisplayObject;

import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;

public class WrongHighlighter implements IHighLighter {


    private var _highliteVo: HighlightItemVO;

    private var _active: Boolean;

    public function WrongHighlighter() {
        super();
    }

    public function decorateUiElement(param1: Object, param2: HighlightItemVO): void {
        this._highliteVo = param2;
        this._active = true;
        this.tweenItWrong(param1 as DisplayObject);
    }

    private function tweenItWrong(param1: DisplayObject): void {
        if (this._active) {
            TweenMax.to(param1, 1, {
                "glowFilter": {
                    "alpha": 1,
                    "color": 16777215 * Math.random(),
                    "blurX": 30,
                    "blurY": 30
                },
                "onComplete": this.tweenItWrong,
                "onCompleteParams": [param1],
                "yoyo": true,
                "repeat": 1
            });
        }
    }

    public function remove(): void {
        this._active = false;
    }

    public function get vo(): HighlightItemVO {
        return this._highliteVo;
    }

    public function get expectedClass(): Class {
        return DisplayObject;
    }
}
}
