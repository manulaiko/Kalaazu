package net.bigpoint.darkorbit.fui.components.bars {

import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;

import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.skins.BasicSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.layers.MovieClipLayer;

public class SliderNSteps extends Coreponent {


    private var _maxSteps: Number = 1;

    private var _currentStep: Number = 1;

    private var _sliderClip: MovieClip;

    private var _isDragging: Boolean = false;

    public function SliderNSteps() {
        super();
    }

    override protected function onAddedToStage(param1: Event): void {
        super.onAddedToStage(param1);
        var _loc2_: BasicSkin = this.getChildAt(0) as BasicSkin;
        this._sliderClip = (_loc2_.getSkinLayer("normal") as MovieClipLayer).getChildAt(0) as MovieClip;
        this._maxSteps = this._sliderClip.totalFrames;
        this._sliderClip.gotoAndStop(1);
        this.addChild(this._sliderClip);
        this.mouseEnabled = true;
        this.mouseChildren = true;
        var _loc3_: MovieClip = this._sliderClip.getChildByName("SliderKnobInstance") as MovieClip;
        this.addEventListener(MouseEvent.MOUSE_DOWN, this.handleMouseDown);
        this.addEventListener(MouseEvent.MOUSE_UP, this.handleMouseUp);
        this.addEventListener("releaseOutside", this.handleMouseUp);
        this.addEventListener(MouseEvent.MOUSE_MOVE, this.handleMouseDragged);
        this.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
    }

    private function handleMouseUp(param1: MouseEvent): void {
        this._isDragging = false;
    }

    private function handleMouseDown(param1: MouseEvent): void {
        this._isDragging = true;
        this.handleMouseDragged(param1);
    }

    private function handleMouseDragged(param1: MouseEvent): void {
        if (!this._isDragging || !param1.buttonDown) {
            return;
        }
        this._currentStep = Math.max(1, Math.min(this._maxSteps, int(Math.round(1 + (this._maxSteps - 1) * (this.mouseX / 330)))));
        this._sliderClip.gotoAndStop(this._currentStep);
        dispatchEvent(new SliderNStepsEvent(SliderNStepsEvent.SLIDER_VALUE_CHANGED, this._currentStep, this._maxSteps));
    }

    override protected function removeEventListeners(): void {
        super.removeEventListeners();
        this.removeEventListener(MouseEvent.MOUSE_MOVE, this.handleMouseDragged);
        this.removeEventListener(MouseEvent.MOUSE_UP, this.handleMouseDown);
    }

    public function set currentStep(param1: Number): void {
        this._currentStep = Math.min(this._sliderClip.totalFrames, Math.max(1, param1));
        this._sliderClip.gotoAndStop(int(this._currentStep));
    }

    public function get currentStep(): Number {
        return this._currentStep;
    }
}
}
