package net.bigpoint.darkorbit.mvc.gui.highlights.view {

import com.greensock.TweenMax;

import flash.display.DisplayObject;

import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;

public class FlashHighlight implements IHighLighter {


    protected var _running: Boolean;

    protected var _highliteVo: HighlightItemVO;

    public function FlashHighlight() {
        super();
    }

    public function decorateUiElement(param1: Object, param2: HighlightItemVO): void {
        this._highliteVo = param2;
        this._running = true;
        this.doHighlite(param1 as DisplayObject, param2.highlightDuration);
    }

    protected function doHighlite(param1: DisplayObject, param2: Number): void {
        if (this._running) {
            TweenMax.to(param1, param2, {
                "colorMatrixFilter": {
                    "brightness": 1.5,
                    "contrast": 1.5,
                    "saturation": 1.5
                },
                "yoyo": true,
                "repeat": 1,
                "onComplete": this.doHighlite,
                "onCompleteParams": [param1, param2]
            });
        }
    }

    public function remove(): void {
        this._running = false;
    }

    public function get vo(): HighlightItemVO {
        return this._highliteVo;
    }

    public function get expectedClass(): Class {
        return DisplayObject;
    }
}
}
