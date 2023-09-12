package net.bigpoint.darkorbit.fui.components.core.skins {

import flash.display.DisplayObject;
import flash.geom.Rectangle;
import flash.utils.Dictionary;

public interface ISkin {


    function set state(param1: String): void;

    function getCurrentState(): String;

    function setSkinLayer(param1: String, param2: DisplayObject): void;

    function getSkinLayer(param1: String): DisplayObject;

    function getSkinLayerDefintions(): Dictionary;

    function init(): void;

    function clone(): ISkin;

    function dispose(): void;

    function set width(param1: Number): void;

    function set height(param1: Number): void;

    function get measureRawSkinSize(): Rectangle;

    function get registerdName(): String;

    function set registerdName(param1: String): void;
}
}
