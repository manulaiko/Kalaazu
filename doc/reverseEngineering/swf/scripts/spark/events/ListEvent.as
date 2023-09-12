package spark.events {

import flash.display.InteractiveObject;
import flash.events.Event;
import flash.events.MouseEvent;

import mx.core.mx_internal;

import spark.components.IItemRenderer;

public class ListEvent extends MouseEvent {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static const ITEM_ROLL_OUT: String = "itemRollOut";

    public static const ITEM_ROLL_OVER: String = "itemRollOver";


    public var item: Object;

    public var itemRenderer: IItemRenderer;

    public var itemIndex: int;

    public function ListEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: Number = NaN, param5: Number = NaN, param6: InteractiveObject = null, param7: Boolean = false, param8: Boolean = false, param9: Boolean = false, param10: Boolean = false, param11: int = 0, param12: int = -1, param13: Object = null, param14: IItemRenderer = null) {
        super(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11);
        this.itemIndex = param12;
        this.item = param13;
        this.itemRenderer = param14;
    }

    override public function clone(): Event {
        var _loc1_: ListEvent = new ListEvent(type, bubbles, cancelable, localX, localY, relatedObject, ctrlKey, altKey, shiftKey, buttonDown, delta, this.itemIndex, this.item, this.itemRenderer);
        _loc1_.relatedObject = this.relatedObject;
        return _loc1_;
    }
}
}
