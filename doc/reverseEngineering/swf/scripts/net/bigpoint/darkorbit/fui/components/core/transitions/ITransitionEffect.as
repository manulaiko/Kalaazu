package net.bigpoint.darkorbit.fui.components.core.transitions {

import flash.display.DisplayObject;
import flash.events.IEventDispatcher;

public interface ITransitionEffect extends IEventDispatcher {


    function init(): void;

    function dispose(): void;

    function fadeIn(): void;

    function fadeOut(): void;

    function set target(param1: DisplayObject): void;

    function set fadeTime(param1: Number): void;

    function set fadeInTime(param1: Number): void;

    function set fadeOutTime(param1: Number): void;
}
}
