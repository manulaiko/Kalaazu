package net.bigpoint.darkorbit.mvc.gui.highlights.view {

import com.greensock.TweenLite;
import com.greensock.TweenMax;
import com.greensock.easing.Linear;

import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.display.MovieClip;
import flash.display.Sprite;

import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;

import package_141.class_969;

import package_9.ResourceManager;

public class ItemActivationHighlight implements IHighLighter {

    protected static const LIB_ID: String = "itemsControlMenu";

    protected static const LIB_LINKAGE_ID: String = "highlightedBorderAnimation";

    protected static const FLASH_COLOR: uint = 16777215;

    protected static const HIGHLIGHTED_BORDER_LAYER_NAME: String = "highlight_border";

    protected static const HIGHLIGHTED_FLASH_ACTIVATION_LAYER_NAME: String = "highlight_flash_activation";

    protected static const HIGHLIGHTED_FLASH_DEACTIVATION_LAYER_NAME: String = "highlight_flash_deactivation";


    protected var _highlightVO: HighlightItemVO;

    protected var _highlightedBorder: MovieClip;

    protected var _highlightFlashActivationLayer: Sprite;

    protected var _highlightFlashDeactivationLayer: Sprite;

    protected var _highlightFlashBorderLayerTween: TweenLite;

    protected var _target: DisplayObjectContainer;

    public function ItemActivationHighlight() {
        super();
    }

    public function decorateUiElement(param1: Object, param2: HighlightItemVO): void {
        this._highlightVO = param2;
        var _loc3_: class_969 = param1 as class_969;
        this._target = _loc3_.view;
        var _loc4_: Number = Number(_loc3_.width);
        var _loc5_: Number = Number(_loc3_.height);
        this._highlightedBorder = ResourceManager.getMovieClip(LIB_ID, LIB_LINKAGE_ID);
        if (this._highlightedBorder) {
            if (this._target.getChildByName(HIGHLIGHTED_BORDER_LAYER_NAME) == null) {
                this._highlightedBorder.name = HIGHLIGHTED_BORDER_LAYER_NAME;
                this._target.addChild(this._highlightedBorder);
                this.fadeInBorder();
            }
            if (this._target.getChildByName(HIGHLIGHTED_FLASH_ACTIVATION_LAYER_NAME) == null) {
                this._highlightFlashActivationLayer = this.createFlashActivationLayer(_loc4_, _loc5_);
                this._highlightFlashActivationLayer.name = HIGHLIGHTED_FLASH_ACTIVATION_LAYER_NAME;
                this._target.addChild(this._highlightFlashActivationLayer);
                this.flashUpActivationLayer();
            }
            if (this._target.getChildByName(HIGHLIGHTED_FLASH_DEACTIVATION_LAYER_NAME) == null) {
                this._highlightFlashDeactivationLayer = this.createFlashDeactivationLayer(_loc4_, _loc5_);
                this._highlightFlashDeactivationLayer.name = HIGHLIGHTED_FLASH_DEACTIVATION_LAYER_NAME;
                this._target.addChild(this._highlightFlashDeactivationLayer);
            }
        }
    }

    public function remove(): void {
        if (this._target) {
            this.removeBorderLayer();
            this.removeFlashActivationLayer();
            this.flashUpDeactivationLayer();
        }
    }

    protected function removeBorderLayer(): void {
        var _loc1_: MovieClip = this._target.getChildByName(HIGHLIGHTED_BORDER_LAYER_NAME) as MovieClip;
        if (_loc1_) {
            this._target.removeChild(_loc1_);
        }
        this._highlightedBorder = null;
    }

    protected function removeFlashActivationLayer(): void {
        var _loc1_: Sprite = this._target.getChildByName(HIGHLIGHTED_FLASH_ACTIVATION_LAYER_NAME) as Sprite;
        if (_loc1_) {
            if (!TweenMax.isTweening(_loc1_)) {
                this._target.removeChild(_loc1_);
                this._highlightFlashActivationLayer = null;
            }
        }
    }

    protected function removeFlashDeactivationLayer(): void {
        var _loc1_: Sprite = this._target.getChildByName(HIGHLIGHTED_FLASH_DEACTIVATION_LAYER_NAME) as Sprite;
        if (_loc1_) {
            if (!TweenMax.isTweening(_loc1_)) {
                this._target.removeChild(_loc1_);
                this._highlightFlashDeactivationLayer = null;
            }
        }
    }

    protected function fadeInBorder(): void {
        this._highlightFlashBorderLayerTween = TweenLite.to(this._highlightedBorder, 0.5, {"alpha": 1});
    }

    protected function fadeOutBorder(): void {
        TweenLite.to(this._highlightedBorder, 0.5, {"alpha": 0});
    }

    protected function flashUpActivationLayer(): void {
        if (this._highlightFlashActivationLayer) {
            TweenMax.to(this._highlightFlashActivationLayer, 0.15, {
                "alpha": 0.7,
                "yoyo": true,
                "repeat": 1,
                "ease": Linear.easeNone,
                "startAt": {"alpha": 0},
                "onComplete": this.flashUpActivationEffectFinished
            });
        }
    }

    protected function flashUpActivationEffectFinished(): void {
        this.removeFlashActivationLayer();
    }

    protected function flashUpDeactivationLayer(): void {
        if (this._highlightFlashDeactivationLayer) {
            this._highlightFlashDeactivationLayer.alpha = 0;
            TweenMax.killTweensOf(this._highlightFlashDeactivationLayer);
            TweenMax.to(this._highlightFlashDeactivationLayer, 0.3, {
                "alpha": 0.7,
                "yoyo": true,
                "repeat": 1,
                "ease": Linear.easeNone,
                "onComplete": this.flashUpDeactivationEffectFinished
            });
        }
    }

    protected function flashUpDeactivationEffectFinished(): void {
        this.removeFlashDeactivationLayer();
    }

    protected function createFlashActivationLayer(param1: uint, param2: uint): Sprite {
        var _loc3_: Sprite = new Sprite();
        _loc3_.alpha = 0;
        var _loc4_: Graphics;
        (_loc4_ = _loc3_.graphics).beginFill(FLASH_COLOR);
        _loc4_.drawRect(1, 1, param1 - 1, param2 - 1);
        _loc4_.endFill();
        return _loc3_;
    }

    protected function createFlashDeactivationLayer(param1: uint, param2: uint): Sprite {
        var _loc3_: Sprite = new Sprite();
        _loc3_.alpha = 0;
        var _loc4_: Graphics;
        (_loc4_ = _loc3_.graphics).lineStyle(2, FLASH_COLOR);
        _loc4_.drawRect(2, 2, param1 - 4, param2 - 4);
        return _loc3_;
    }

    public function get vo(): HighlightItemVO {
        return this._highlightVO;
    }

    public function get expectedClass(): Class {
        return class_969;
    }
}
}
