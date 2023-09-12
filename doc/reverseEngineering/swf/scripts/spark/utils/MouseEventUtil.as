package spark.utils {

import flash.display.InteractiveObject;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.events.MouseEvent;

import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexMouseEvent;
import mx.events.SandboxMouseEvent;

public class MouseEventUtil {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function MouseEventUtil() {
        super();
    }

    public static function addDownDragUpListeners(param1: UIComponent, param2: Function, param3: Function, param4: Function): void {
        var f: Function = null;
        var target: UIComponent = param1;
        var handleDown: Function = param2;
        var handleDrag: Function = param3;
        var handleUp: Function = param4;
        f = function (param1: Event): void {
            var _loc2_: * = null;
            switch (param1.type) {
                case MouseEvent.MOUSE_DOWN:
                    if (param1.isDefaultPrevented()) {
                        break;
                    }
                    handleDown(param1);
                    _loc2_ = target.systemManager.getSandboxRoot();
                    _loc2_.addEventListener(MouseEvent.MOUSE_MOVE, f, true);
                    _loc2_.addEventListener(MouseEvent.MOUSE_UP, f, true);
                    _loc2_.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, f, true);
                    target.systemManager.deployMouseShields(true);
                    break;
                case MouseEvent.MOUSE_MOVE:
                    handleDrag(param1);
                    break;
                case MouseEvent.MOUSE_UP:
                    handleUp(param1);
                    _loc2_ = target.systemManager.getSandboxRoot();
                    _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE, f, true);
                    _loc2_.removeEventListener(MouseEvent.MOUSE_UP, f, true);
                    _loc2_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, f, true);
                    target.systemManager.deployMouseShields(false);
                    break;
                case "removeHandler":
                    target.removeEventListener("removeHandler", f);
                    target.removeEventListener(MouseEvent.MOUSE_DOWN, f);
                    _loc2_ = target.systemManager.getSandboxRoot();
                    _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE, f, true);
                    _loc2_.removeEventListener(MouseEvent.MOUSE_UP, f, true);
                    _loc2_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, f, true);
                    target.systemManager.deployMouseShields(false);
            }
        };
        target.addEventListener(MouseEvent.MOUSE_DOWN, f);
        target.addEventListener("removeHandler", f);
    }

    public static function removeDownDragUpListeners(param1: UIComponent, param2: Function, param3: Function, param4: Function): void {
        param1.dispatchEvent(new RemoveHandlerEvent(param2, param3, param4));
    }

    public static function createMouseWheelChangingEvent(param1: MouseEvent): FlexMouseEvent {
        return new FlexMouseEvent(FlexMouseEvent.MOUSE_WHEEL_CHANGING, true, true, param1.localX, param1.localY, InteractiveObject(param1.target), param1.ctrlKey, param1.altKey, param1.shiftKey, param1.buttonDown, param1.delta);
    }
}
}

import flash.events.Event;

class RemoveHandlerEvent extends Event {


    public var handleDown: Function;

    public var handleDrag: Function;

    public var handleUp: Function;

    function RemoveHandlerEvent(param1: Function, param2: Function = null, param3: Function = null) {
        this.handleDown = param1;
        this.handleDown = param2;
        this.handleUp = param3;
        super("removeHandler");
    }
}
