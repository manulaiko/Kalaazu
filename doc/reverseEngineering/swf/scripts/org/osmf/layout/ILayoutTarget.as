package org.osmf.layout {

import flash.display.DisplayObject;
import flash.events.IEventDispatcher;

public interface ILayoutTarget extends IEventDispatcher {


    function get displayObject(): DisplayObject;

    function get layoutMetadata(): LayoutMetadata;

    function get measuredWidth(): Number;

    function get measuredHeight(): Number;

    function measure(param1: Boolean = true): void;

    function layout(param1: Number, param2: Number, param3: Boolean = true): void;
}
}
