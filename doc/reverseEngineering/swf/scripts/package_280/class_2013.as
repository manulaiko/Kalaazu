package package_280 {

import com.greensock.TweenMax;

import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;

import package_11.class_39;

import package_9.ResourceManager;

public class class_2013 {


    private var _target: DisplayObjectContainer;

    private var _running: Boolean;

    private var _effect: MovieClip;

    public function class_2013(param1: DisplayObjectContainer) {
        super();
        this._target = param1;
    }

    public function activate(): void {
        this._running = true;
        if (this._effect) {
            this.doHighlite();
            this.method_5681();
        } else {
            ResourceManager.name_15.load("highlightEffect", this.method_941);
        }
    }

    public function deactivate(): void {
        this._running = false;
    }

    private function method_941(param1: class_39): void {
        if (!this._running) {
            return;
        }
        this._effect = param1.getEmbeddedMovieClip("mc");
        if (this._effect) {
            this._target.addChild(this._effect);
            this.doHighlite();
            this.method_5681();
        }
    }

    private function doHighlite(): void {
        if (this._running) {
            TweenMax.to(this._target, 0.5, {
                "colorMatrixFilter": {
                    "brightness": 1.5,
                    "contrast": 1.5,
                    "saturation": 1.5
                },
                "yoyo": true,
                "repeat": 1,
                "onComplete": this.doHighlite
            });
        }
    }

    private function method_5681(): void {
        if (this._running) {
            this._effect.alpha = 1;
            this._effect.visible = true;
            this._effect.scaleY = 1;
            this._effect.scaleX = 1;
            this._effect.x = -Number(this._effect.width) / 2;
            this._effect.y = -Number(this._effect.height) - 34;
            TweenMax.to(this._effect, 1, {
                "transformAroundCenter": {"scale": 1.5},
                "autoAlpha": 0,
                "onComplete": this.method_5681
            });
        }
    }
}
}
