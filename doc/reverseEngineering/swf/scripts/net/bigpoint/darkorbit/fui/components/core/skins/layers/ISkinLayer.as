package net.bigpoint.darkorbit.fui.components.core.skins.layers {

import flash.display.DisplayObject;

public interface ISkinLayer {


    function set name(param1: String): void;

    function get name(): String;

    function set width(param1: Number): void;

    function set height(param1: Number): void;

    function clone(): DisplayObject;

    function dispose(): void;
}
}
