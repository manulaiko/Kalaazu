package net.bigpoint.darkorbit.fui.components.core.transitions {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.EventDispatcher;

import net.bigpoint.darkorbit.fui.UISystem;

public class AbstractTransitionEffect extends EventDispatcher implements ITransitionEffect {

    public static const FADE_IN_COMPLETE: String = "fadeInComplete";

    public static const FADE_OUT_COMPLETE: String = "fadeOutComplete";


    private var _target: DisplayObject;

    protected var _fadeInTime: Number = 0.5;

    protected var _fadeOutTime: Number = 0.5;

    public function AbstractTransitionEffect() {
        super();
    }

    public function init(): void {
    }

    public function dispose(): void {
        this._target = null;
    }

    public function fadeIn(): void {
        throw new Error("You have to override and implement the {transitIn} method.");
    }

    protected function fadeInComplete(): void {
        dispatchEvent(new Event(FADE_IN_COMPLETE));
    }

    public function fadeOut(): void {
        throw new Error("You have to override and implement the {transitOut} method.");
    }

    protected function fadeOutComplete(): void {
        dispatchEvent(new Event(FADE_OUT_COMPLETE));
    }

    public function set target(param1: DisplayObject): void {
        if (param1 == null) {
            UISystem.log("You have to specify an instance target.", UISystem.LOG_LEVEL_WARN);
            return;
        }
        this._target = param1;
    }

    public function get target(): DisplayObject {
        return this._target;
    }

    public function set fadeTime(param1: Number): void {
        this._fadeInTime = param1;
        this._fadeOutTime = param1;
    }

    public function set fadeInTime(param1: Number): void {
        this._fadeInTime = param1;
    }

    public function set fadeOutTime(param1: Number): void {
        this._fadeOutTime = param1;
    }
}
}
