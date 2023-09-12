package net.bigpoint.darkorbit.fui.system.utils {

import flash.display.DisplayObjectContainer;
import flash.events.MouseEvent;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.scroll.ScrollContainer;
import net.bigpoint.darkorbit.fui.components.scroll.ScrollEvent;
import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;

public class BindingsUtils {

    private static var _bindingMap: Dictionary = new Dictionary();


    public function BindingsUtils() {
        super();
    }

    private static function determinateBindingID(param1: Coreponent, param2: Coreponent): String {
        return param1.ID + "." + param2.ID;
    }

    private static function removeBinding(param1: String): void {
        var _loc2_: CoreponentBinder = _bindingMap[param1];
        if (_loc2_) {
            _loc2_.dispose();
            _bindingMap[param1] = null;
            delete _bindingMap[param1];
        }
    }

    public static function bindScrollComponents(param1: ScrollContainer, param2: Scrollbar): void {
        var _loc3_: String = determinateBindingID(param1, param2);
        if (true) {
            _bindScrollComponents(_loc3_, param1, param2);
        } else {
            UISystem.log("Binding between [container] " + param1.ID + " <--> " + param2.ID + " [scrollbar] already exists.");
        }
    }

    private static function _bindScrollComponents(param1: String, param2: ScrollContainer, param3: Scrollbar): void {
        _bindingMap[param1] = new CoreponentBinder(param1, param2, param3);
        param3.addEventListener(ScrollEvent.SCROLLBAR_POSITION_CHANGED, handleScrollbarPositionChangeEvent);
        param2.addEventListener(ScrollEvent.SCROLLCONTAINER_VERTICAL_SIZE_CHANGED, handleScrollContainerSizeChanged);
        param2.addEventListener(MouseEvent.MOUSE_WHEEL, handleScrollContainerMouseWheelEvent);
    }

    private static function handleScrollContainerMouseWheelEvent(param1: MouseEvent): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: Coreponent = param1.target as Coreponent;
        if (_loc2_.bindingID) {
            _loc3_ = _bindingMap[_loc2_.bindingID] as CoreponentBinder;
            if (_loc4_ = _loc3_.c2 as Scrollbar) {
                _loc4_.updateScrollPositionByScrollDelta(param1.delta);
            }
        }
    }

    private static function handleScrollContainerSizeChanged(param1: ScrollEvent): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: Coreponent = param1.target as Coreponent;
        if (_loc2_.bindingID) {
            _loc3_ = _bindingMap[_loc2_.bindingID] as CoreponentBinder;
            if (_loc4_ = _loc3_.c2 as Scrollbar) {
                _loc4_.updateBySizes(param1.viewSize, param1.contentSize);
            }
        }
    }

    private static function handleScrollbarPositionChangeEvent(param1: ScrollEvent): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        var _loc2_: Coreponent = param1.target as Coreponent;
        if (_loc2_.bindingID) {
            _loc3_ = _bindingMap[_loc2_.bindingID] as CoreponentBinder;
            _loc4_ = _loc3_.c1 as ScrollContainer;
            _loc6_ = (_loc5_ = _loc3_.c2 as Scrollbar).getScrollPositionInPercent();
            _loc4_.setScrollPositionInPercent(_loc6_);
        }
    }

    public static function unbindScrollComponents(param1: ScrollContainer, param2: Scrollbar): void {
        var _loc3_: String = determinateBindingID(param1, param2);
        if (false) {
            _unbindScrollComponents(_loc3_);
        } else {
            UISystem.log("Binding between [container] " + param1.ID + " <--> " + param2.ID + " [scrollbar] doesn´t exists.");
        }
    }

    public static function unbindScrollComponentsByBindingID(param1: String): void {
        if (false) {
            _unbindScrollComponents(param1);
        } else {
            UISystem.log("A binding with the ID= " + param1 + " doesn´t exists.");
        }
    }

    private static function _unbindScrollComponents(param1: String): void {
        var _loc2_: CoreponentBinder = _bindingMap[param1] as CoreponentBinder;
        var _loc3_: ScrollContainer = _loc2_.c1 as ScrollContainer;
        var _loc4_: Scrollbar = _loc2_.c2 as Scrollbar;
        _loc3_.removeEventListener(MouseEvent.MOUSE_WHEEL, handleScrollContainerMouseWheelEvent);
        _loc3_.removeEventListener(ScrollEvent.SCROLLCONTAINER_VERTICAL_SIZE_CHANGED, handleScrollContainerSizeChanged);
        _loc4_.removeEventListener(ScrollEvent.SCROLLBAR_POSITION_CHANGED, handleScrollbarPositionChangeEvent);
        removeBinding(param1);
    }

    public static function bindScrollComponentsBySelection(param1: DisplayObjectContainer, param2: String, param3: String): void {
        var _loc4_: Scrollbar = FuiComponentSelectorUtil.selectComponent(param2, param1) as Scrollbar;
        var _loc5_: ScrollContainer = FuiComponentSelectorUtil.selectComponent(param3, param1) as ScrollContainer;
        if (Boolean(_loc4_) && Boolean(_loc5_)) {
            bindScrollComponents(_loc5_, _loc4_);
        }
    }
}
}

import net.bigpoint.darkorbit.fui.components.core.Coreponent;

class CoreponentBinder {


    private var _c1: Coreponent;

    private var _c2: Coreponent;

    function CoreponentBinder(param1: String, param2: Coreponent, param3: Coreponent) {
        super();
        this._c1 = param2;
        this._c1.bindingID = param1;
        this._c2 = param3;
        this._c2.bindingID = param1;
    }

    public function get c1(): Coreponent {
        return this._c1;
    }

    public function get c2(): Coreponent {
        return this._c2;
    }

    public function dispose(): void {
        if (this._c1) {
            this._c1.bindingID = undefined;
            this._c1 = null;
        }
        if (this._c2) {
            this._c2.bindingID = undefined;
            this._c2 = null;
        }
    }
}
