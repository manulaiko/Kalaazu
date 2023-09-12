package package_242 {

import flash.display.DisplayObject;

public interface IDropable {


    function isDraggingItemAcceptable(param1: IDraggable): Boolean;

    function setAcceptedDragItem(param1: IDraggable): void;

    function showAcceptableState(param1: IDraggable): void;

    function hideAcceptableState(param1: IDraggable): void;

    function get asDisplayObject(): DisplayObject;
}
}
