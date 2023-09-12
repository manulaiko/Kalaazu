package net.bigpoint.darkorbit.fui.system.manager {

import flash.display.DisplayObject;

public interface IMouseManager {


    function isCursorRegistered(param1: String): Boolean;

    function registerMouseCursor(param1: String, param2: DisplayObject, param3: Number = 0, param4: Number = 0): void;

    function registerMouseCursorViaReskey(param1: String, param2: String, param3: String, param4: Number = 0, param5: Number = 0): void;

    function unregisterMouseCursor(param1: String): void;

    function showCustomCursor(param1: String): void;

    function hideCustomCursor(): void;
}
}
