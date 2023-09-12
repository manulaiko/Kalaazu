package net.bigpoint.darkorbit.fui.components.core.layout {

import flash.display.DisplayObjectContainer;

public interface ILayout {


    function execute(param1: DisplayObjectContainer = null): void;

    function set gap(param1: uint): void;

    function get gap(): uint;
}
}
